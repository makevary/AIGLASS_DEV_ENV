/*
 * Copyright (c) 2023 Rockchip, Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include "utils/common.h"
#include "utils/log.h"

#include "sys/common.h"
#include "isp/isp.h"
#ifdef USE_RKAOV
#include "aov/aov_core.h"
#endif
#include "param/record_param.h"

#include "mpu/mpu_storage.h"
#include "mpu/mpu_record.h"
#include "mpu/osd/mpu_osd.h"

#include <unistd.h>
#include <fcntl.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    MPU_RECORD_EVENT_INIT = 0,
    MPU_RECORD_EVENT_STOP,
    MPU_RECORD_EVENT_START,
    MPU_RECORD_EVENT_DEINIT
} MPU_RECORD_EVENT_TYPE_E;

typedef struct {
    uint32_t cam_id;
    MPU_RECORD_EVENT_TYPE_E type;
} mpu_record_event_info_t, *mpu_record_event_info_p;

typedef struct {
    uint32_t cam_id;
    HANDLE proc_handle;
    const char *storage_path;
    HANDLE osd_handle;
    RKADK_STREAM_TYPE_E stream_type;
} mpu_record_context_t, *mpu_record_context_p;

typedef struct {
    uint32_t num_records;
    mpu_record_context_t context[CVR_SUPPORT_SENSOR_CNT];
} mpu_record_manager_t, *mpu_record_manager_p;

/**********************
 *  STATIC VARIABLES
 **********************/
extern mpu_osd_operate_t time_osd_op;

static volatile bool g_record_init = false;
static mpu_record_manager_t g_record_manger;
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

/**********************
 *      MACROS
 **********************/

#define MPU_RECORD_CHECK_INIT(init, errcode)                                        \
  do {                                                                         \
    if (!(g_record_init)) {                                                             \
      CVR_ERR("[%s] not init\n", #init);                                      \
      return errcode;                                                          \
    }                                                                          \
  } while (0)

#define MPU_RECORD_GET_PROC_HANDLE(CamId, RecordManager) \
    ({ \
        HANDLE result = NULL; \
        do { \
            for (uint32_t i = 0; i < (RecordManager)->num_records; i++) { \
                if ((RecordManager)->context[i].cam_id == CamId) \
                    result = (RecordManager)->context[i].proc_handle; \
            } \
        } while (0); \
        result; \
    })

#define MPU_RECORD_GET_CONTEXT(CamId, RecordManager) \
    ({ \
        mpu_record_context_p result = NULL; \
        do { \
            for (uint32_t i = 0; i < (RecordManager)->num_records; i++) { \
                if ((RecordManager)->context[i].cam_id == (CamId)) \
                    result = &(RecordManager)->context[i]; \
            } \
        } while (0); \
        result; \
    })

#define MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, RecordManager) \
    for (uint32_t i = 0; i < (RecordManager)->num_records; i++) \
        if (NULL != (proc_handle = (RecordManager)->context[i].proc_handle))

#define MPU_RECORD_FOR_EACH_CONTEXT(ctx, RecordManager) \
    for (uint32_t i = 0; i < (RecordManager)->num_records; i++) \
        if (NULL != (ctx = &((RecordManager)->context[i])))

/**********************
 *   STATIC FUNCTIONS   
 **********************/
static HANDLE time_osd_create(uint32_t cam_id, uint32_t osd_id) {
    HANDLE osd_handle = NULL;
    mpu_osd_attr_t osd_attr = {0};

    osd_attr.cam_id = cam_id;
    osd_attr.osd_id = osd_id;
    osd_attr.op = &time_osd_op;
    osd_attr.osd_type = RKADK_OSD_TYPE_NORMAL;

    osd_handle = mpu_osd_task_create(&osd_attr);
    if (NULL == osd_handle) {
        CVR_ERR("cam_id: %d, Time OSD creation failed!\n", cam_id);
        return NULL;
    }

    return osd_handle;
}

static void time_osd_destroy(HANDLE osd_handle) {
    if (NULL != osd_handle)
        mpu_osd_task_destroy(osd_handle);
}

static int32_t time_osd_start(HANDLE osd_handle, RKADK_STREAM_TYPE_E stream_type) {
    if (NULL == osd_handle)
        return -1;

    RKADK_OSD_STREAM_ATTR_S osd_stream_attr = {};
    MultiTimerSpec_t timing = {};

    osd_stream_attr.bEnableShow = TRUE;
    osd_stream_attr.Origin_X = 16;
    osd_stream_attr.Origin_Y = 16;

    timing.it_value = 0;
    timing.it_interval = 1000;
    if (mpu_osd_task_start(osd_handle, stream_type, &osd_stream_attr, &timing)) {
        CVR_ERR("Failed to start osd!\n");
        return -1;
    }

    return 0;
}

static int32_t time_osd_stop(HANDLE osd_handle) {
    if (NULL == osd_handle)
        return -1;

    return mpu_osd_task_end(osd_handle);
}

static int32_t time_osd_update(HANDLE osd_handle) {
    if (NULL == osd_handle)
        return -1;
    return mpu_osd_manual_update(osd_handle);
}

static void record_file_process(RKADK_MUXER_EVENT_E event,
                                const RKADK_MUXER_FILE_EVENT_INFO_S *src_file_info) {
    if (NULL == src_file_info) {
        CVR_ERR("Invalid input parameter\n");
        return;
    }

    char str_new_name[RKADK_MAX_FILE_PATH_LEN] = {0};
    char str_time1[32] = {0};
    char str_time2[32] = {0};
    char str_type[8] = {0};
    char *ptr = NULL;
    const char *path = NULL;
    uint32_t record_duration;

    record_duration = src_file_info->u32Duration / 1000;    /* Second */

    // Check if the file exists
    if (-1 == access(src_file_info->asFileName, F_OK)) {
        CVR_ERR("File does not exist, file name: %s, event type: %d.\n", src_file_info->asFileName, event);
        return ;
    }

   // Check if the file name contains the time lapse path
    ptr = strstr(src_file_info->asFileName, STR_TIME_LAPSE_PATH);
    if (NULL == ptr) {
       // If the file duration is less than 5 seconds, remove it
        if (record_duration < 5) {
            remove(src_file_info->asFileName);
            CVR_INFO("Remove file:%s\n", src_file_info->asFileName);
            return ;
        }
    }

    switch (event) {
        case RKADK_MUXER_EVENT_MANUAL_SPLIT_END:
            // If the file is manually split, the file name should be moved to the urgent path
            path = STR_URGENT_PATH;
            break;

        default:
            return ;
    }

   ptr = strrchr(src_file_info->asFileName, '/');
    if (NULL == ptr) {
        CVR_ERR("Filename is invalid.\n");
        return;
    }

    // Check if the file is sub-file
    if (NULL != strstr(ptr, "sub")) {
        // Parse the sub-file name
        if (3 != sscanf(ptr, "/%[^_]_%[^_]_sub.%s", str_time1, str_time2, str_type)) {
            CVR_ERR("Filename parsing failed.\n");
            return;
        }

        // Generate the new file name
        snprintf(str_new_name, RKADK_MAX_FILE_PATH_LEN, "%s%s%s_%s_sub.%s",
                 STR_MOUNT_PATH, path, str_time1, str_time2, str_type);
    } else {
        // Parse the main-file name
        if (3 != sscanf(ptr, "/%[^_]_%[^.].%s", str_time1, str_time2, str_type)) {
            CVR_ERR("Filename parsing failed.\n");
            return;
        }

        // Generate the new file name
        snprintf(str_new_name, RKADK_MAX_FILE_PATH_LEN, "%s%s%s_%s.%s",
                 STR_MOUNT_PATH, path, str_time1, str_time2, str_type);
    }

    // Rename the file
    if (rename(src_file_info->asFileName, str_new_name)) {
        CVR_ERR("File rename failed: %s.\n", strerror(errno));
        return;
    }

    CVR_INFO("video name: %s\n",str_new_name);
}

static RKADK_VOID callback_record_event(RKADK_MW_PTR handle,
                                        const RKADK_MUXER_EVENT_INFO_S *event_info) {
    switch (event_info->enEvent) {
        case RKADK_MUXER_EVENT_STREAM_START:
            CVR_INFO("RKADK_MUXER_EVENT_STREAM_START\n");
            break;
        case RKADK_MUXER_EVENT_STREAM_STOP:
            CVR_INFO("RKADK_MUXER_EVENT_STREAM_STOP\n");
            break;
        case RKADK_MUXER_EVENT_FILE_BEGIN:
            CVR_INFO("RKADK_MUXER_EVENT_FILE_BEGIN\n");
            CVR_INFO("\tstFileInfo: %s\n",
                     event_info->unEventInfo.stFileInfo.asFileName);
            CVR_INFO("\tu32Duration: %d\n",
                     event_info->unEventInfo.stFileInfo.u32Duration);
            break;
        case RKADK_MUXER_EVENT_FILE_END:
            CVR_INFO("RKADK_MUXER_EVENT_FILE_END %s, duration: %u\n",
            event_info->unEventInfo.stFileInfo.asFileName, event_info->unEventInfo.stFileInfo.u32Duration);
            record_file_process(event_info->enEvent,
                                &event_info->unEventInfo.stFileInfo);
            break;
        case RKADK_MUXER_EVENT_MANUAL_SPLIT_END:
            CVR_INFO("RKADK_MUXER_EVENT_MANUAL_SPLIT_END\n");
            record_file_process(event_info->enEvent,
                                &event_info->unEventInfo.stFileInfo);
            break;
        case RKADK_MUXER_EVENT_ERR_CREATE_FILE_FAIL:
            CVR_ERR("RKADK_MUXER_EVENT_ERR_CREATE_FILE_FAIL\n");
            break;
        case RKADK_MUXER_EVENT_ERR_WRITE_FILE_FAIL:
            CVR_ERR("RKADK_MUXER_EVENT_ERR_WRITE_FILE_FAIL\n");
            break;
        case RKADK_MUXER_EVENT_FILE_WRITING_SLOW:
            CVR_WARN("RKADK_MUXER_EVENT_FILE_WRITING_SLOW\n");
            break;
        case RKADK_MUXER_EVENT_ERR_CARD_NONEXIST:
            CVR_WARN("RKADK_MUXER_EVENT_ERR_CARD_NONEXIST\n");
            break;
        default:
            CVR_INFO("Unknown event(%d)\n", event_info->enEvent);
            break;
    }

    return ;
}

static RKADK_S32 callback_get_record_filename(RKADK_MW_PTR handle, RKADK_U32 file_cnt,
                                              RKADK_CHAR (*file_name)[RKADK_MAX_FILE_PATH_LEN]) {
   time_t timep;
    struct tm *p = NULL;
    const char *storage_path;
    mpu_record_context_p ctx = NULL;
    RKADK_MUXER_HANDLE_S *muxer = (RKADK_MUXER_HANDLE_S *)handle;

    ctx = MPU_RECORD_GET_CONTEXT(muxer->u32CamId, &g_record_manger);
    if (NULL == ctx || NULL == ctx->storage_path) {
        CVR_ERR("Failed to get type file name!\n");
        return -1;
    }

    /* get current time */
    time(&timep);
    p = gmtime(&timep);

    /* generate file name */
    for (uint32_t i = 0; i < file_cnt; i++) {
        if (0 == i) {  /* main stream */
            if (RKADK_REC_TYPE_AOV_LAPSE == muxer->enRecType ||
                RKADK_REC_TYPE_LAPSE == muxer->enRecType)
                storage_path = STR_TIME_LAPSE_PATH;
            else
                storage_path = ctx->storage_path;

            snprintf(file_name[i], RKADK_MAX_FILE_PATH_LEN, "%s%s%04d%02d%02d_%02d%02d%02d.mp4",
                    STR_MOUNT_PATH, storage_path, (1900 + p->tm_year), (1 + p->tm_mon), p->tm_mday,
                    p->tm_hour, p->tm_min, p->tm_sec);
        } else if (1 == i) {    /* sub stream */
            if (RKADK_REC_TYPE_AOV_LAPSE == muxer->enRecType ||
                RKADK_REC_TYPE_LAPSE == muxer->enRecType)
                storage_path = STR_TIME_LAPSE_PATH;
            else
                storage_path = ctx->storage_path;

            snprintf(file_name[i], RKADK_MAX_FILE_PATH_LEN, "%s%s%04d%02d%02d_%02d%02d%02d_sub.mp4",
                    STR_MOUNT_PATH, storage_path, (1900 + p->tm_year), (1 + p->tm_mon), p->tm_mday,
                    p->tm_hour, p->tm_min, p->tm_sec);
        }
    }
    return 0;
}

static void storage_event_cb(RKADK_MOUNT_STATUS disk_state) {
    MPU_RECORD_CHECK_INIT(g_record_init,);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    HANDLE proc_handle = NULL;

    switch (disk_state) {
        case DISK_UNMOUNTED:
        case DISK_NOT_FORMATTED:
        case DISK_FORMAT_ERR:
        case DISK_SCANNING:{
            MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
                record_proc_state_transition(proc_handle, RECORD_CONDITION_ANNORMAL_STR);
            }
        } break;
        case DISK_MOUNTED: {
            MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
                record_proc_state_transition(proc_handle, RECORD_CONDITION_NORMAL_STR);
            }
        } break;

        case DISK_MOUNT_BUTT:
        default:
            goto end;
    }
end:
    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}

static void callback_record_state(HANDLE handle, record_proc_state_info_p state_info) {
    mpu_record_context_p ctx;

    switch(state_info->state) {
        case RECORD_STATE_TRANS_INIT_AFTER:
            //TODO
        break;

        case RECORD_STATE_TRANS_STOP_BEFORE:
            ctx = MPU_RECORD_GET_CONTEXT(state_info->cam_id, &g_record_manger);
            if (ctx && ctx->osd_handle)
                time_osd_stop(ctx->osd_handle);
            break;

        case RECORD_STATE_TRANS_START_AFTER:
            ctx = MPU_RECORD_GET_CONTEXT(state_info->cam_id, &g_record_manger);
            if (ctx && ctx->osd_handle)
                time_osd_start(ctx->osd_handle, ctx->stream_type);
        break;

        case RECORD_STATE_TRANS_DEINIT_BEFORE:
            //TODO
        break;

        default:
        break;
    }
}

static int32_t file_cache_init(record_param_cfg_p param) {
    FILE_CACHE_ARG file_cache_attr = {0};

    file_cache_attr.total_cache = param->file_cache_total;
    file_cache_attr.write_cache = param->file_cache_write;
    file_cache_attr.write_thread_arg.priority =  param->file_cache_priority;

    switch (param->file_cache_policy) {
        case 0:
            file_cache_attr.write_thread_arg.sched_policy = FILE_SCHED_OTHER;
            break;
        case 1:
            file_cache_attr.write_thread_arg.sched_policy = FILE_SCHED_BATCH;
            break;
        case 2:
            file_cache_attr.write_thread_arg.sched_policy = FILE_SCHED_IDLE;
            break;
        case 3:
            file_cache_attr.write_thread_arg.sched_policy = FILE_SCHED_FIFO;
            break;
        case 4:
            file_cache_attr.write_thread_arg.sched_policy = FILE_SCHED_RR;
        default:
            CVR_WARN("policy == SCHED_OTHER");
            return -1;
	}

    file_cache_attr.sdcard_path = param->root_dir;
#ifdef USE_RKAOV
    file_cache_attr.sdcard_arg.lock = RKADK_AOV_WakeupLock;
    file_cache_attr.sdcard_arg.unlock = RKADK_AOV_WakeupUnlock;
    file_cache_attr.sdcard_arg.mount_sdcard = NULL;
    file_cache_attr.sdcard_arg.umount_sdcard = NULL;
#endif

    if (record_proc_filecache_init(&file_cache_attr)) {
        CVR_ERR("Failed to enable file cache.\n");
        return -1;
    }

    return 0;
}

static void file_cache_deinit(void) {
    record_proc_filecache_deinit();
}

static void record_deinit(void) {
    mpu_record_context_p ctx = NULL;

    MPU_RECORD_FOR_EACH_CONTEXT(ctx, &g_record_manger) {
        if (ctx->osd_handle) {
            time_osd_stop(ctx->osd_handle);
            time_osd_destroy(ctx->osd_handle);
            ctx->osd_handle = NULL;
        }

        if (ctx->proc_handle) {
            record_proc_destroy(ctx->proc_handle);
            ctx->proc_handle = NULL;
        }
    }
}

static int32_t record_init(record_param_cfg_p param) {
    HANDLE proc_handle = NULL;
    HANDLE osd_handle = NULL;
    record_proc_attr_t record_attr = {0};

    g_record_manger.num_records = param->record_cnt;

    for (uint32_t i = 0; i < param->record_cnt; i++) {
        memset(&record_attr, 0, sizeof(record_attr));
        record_attr.cam_id = param->task_info[i].cam_id;
        record_attr.state_cb = callback_record_state;
        record_attr.attr.pfnEventCallback = callback_record_event;
        record_attr.attr.pfnRequestFileNames = callback_get_record_filename;
    #ifdef USE_RKAOV
        record_attr.attr.stAovAttr.pfnSingleFrame = isp_single_frame;
        record_attr.attr.stAovAttr.pfnMultiFrame = isp_multi_frame;
    #endif
        record_attr.attr.s32CamID = param->task_info[i].cam_id;
    #ifndef FILE_CACHE
        record_attr.attr.u32FragKeyFrame = 1;
    #endif

        record_proc_set_rec_type(record_attr.cam_id, RKADK_REC_TYPE_NORMAL);

        proc_handle = record_proc_create(&record_attr);
        if (NULL == proc_handle) {
            CVR_ERR("cam id: %d, Recording module creation failed!\n", record_attr.cam_id);
            goto failed;
        }

        osd_handle = time_osd_create(param->task_info[i].cam_id, param->task_info[i].osd_id);
        if (NULL == osd_handle)
            CVR_WARN("cam_id: %d, time_osd_create failed!\n", param->task_info[i].cam_id);

        g_record_manger.context[i].osd_handle = osd_handle;
        g_record_manger.context[i].stream_type = RKADK_STREAM_TYPE_VIDEO_MAIN;
        g_record_manger.context[i].proc_handle = proc_handle;
        g_record_manger.context[i].cam_id = param->task_info[i].cam_id;
        g_record_manger.context[i].storage_path = param->task_info[i].storage_path;
    }

    return 0;

failed:
    record_deinit();

    return -1;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

bool mpu_record_check_active(int32_t cam_id) {
    MPU_RECORD_CHECK_INIT(g_record_init, false);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    bool active = false;

    HANDLE proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
    if (NULL != proc_handle)
        active = record_proc_check_active(proc_handle);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return active;
}

int32_t mpu_record_urgent_video(int32_t cam_id) {
    MPU_RECORD_CHECK_INIT(g_record_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    HANDLE proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
    if (NULL == proc_handle) {
        CVR_ERR("Invalid handle!\n");
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        return -1;
    }

    int32_t ret = record_proc_manual_split(proc_handle);
    if (ret)
        CVR_ERR("Failed to enable urgent recording!\n");

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_record_switch_type(int32_t cam_id, RKADK_REC_TYPE_E rec_type) {
    MPU_RECORD_CHECK_INIT(g_record_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    HANDLE proc_handle = NULL;

    if (DISK_MOUNTED != mpu_storage_get_status()) {
        CVR_ERR("Storage card not found or abnormal!\n");
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        return -1;
    }

    if (RECORD_ALL_CHN == cam_id) {
        MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_STOP))
                CVR_WARN("Recording state change failed!\n");

            if (record_proc_set_rec_type(i, rec_type)) 
                CVR_WARN("cam_id: %d, Failed to set recording mode!\n", i);

            record_proc_reset(proc_handle);

            record_proc_filecache_set_mode(rec_type);

            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_ACTION))
                CVR_WARN("Recording state change failed!\n");
        }
    } else {
        proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
        if (NULL != proc_handle) {
            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_STOP))
                CVR_WARN("Recording state change failed!\n");

            if (record_proc_set_rec_type(cam_id, rec_type))
                CVR_WARN("cam_id: %d, Failed to set recording mode!\n", cam_id);

            record_proc_reset(proc_handle);

            record_proc_filecache_set_mode(rec_type);

            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_ACTION))
                CVR_WARN("Recording state change failed!\n");
        }
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return 0;
}

RKADK_PARAM_RES_E mpu_record_get_resolution(uint32_t cam_id) {
    PTHREAD_MUTEX_LOCK(mutex_Lock);

    RKADK_PARAM_RES_E res = record_proc_get_resolution(cam_id);
    if (RKADK_RES_BUTT == res)
        CVR_ERR("cam_id: %d, Failed to obtain video resolution!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return res;
}

int32_t mpu_record_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution) {
    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret = record_proc_set_resolution(cam_id, resolution);
    if (ret)
        CVR_ERR("cam_id: %d, Failed to set video resolution!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_record_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type) {
    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret = record_proc_set_codec_type(cam_id, codec_type);
    if (ret)
        CVR_ERR("cam_id: %d, Failed to set video encoding type!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

RKADK_CODEC_TYPE_E mpu_record_get_codec_type(uint32_t cam_id) {
    PTHREAD_MUTEX_LOCK(mutex_Lock);

    RKADK_CODEC_TYPE_E codec_type = record_proc_get_codec_type(cam_id);
    if (RKADK_CODEC_TYPE_BUTT == codec_type)
        CVR_ERR("cam_id: %d, Failed to obtain video encoding type!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return codec_type;
}

int32_t mpu_record_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type) {
    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret = record_proc_set_rec_type(cam_id, rec_type);
    if (ret)
        CVR_ERR("cam_id: %d, Failed to set recording mode!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_record_reset(uint32_t cam_id) {
    MPU_RECORD_CHECK_INIT(g_record_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    HANDLE proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
    if (NULL == proc_handle) {
        CVR_ERR("Invalid handle!\n");
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        return -1;
    }

    int32_t ret = record_proc_reset(proc_handle);
    if (ret)
        CVR_ERR("Recording module failed!\n");

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_record_start(int32_t cam_id) {
    HANDLE proc_handle = NULL;

    MPU_RECORD_CHECK_INIT(g_record_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    if (DISK_MOUNTED != mpu_storage_get_status()) {
        if (RECORD_ALL_CHN == cam_id) {
            MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
                if (record_proc_state_transition(proc_handle, RECORD_CONDITION_READY))
                    CVR_ERR("Recording state change failed!\n");
            }
        } else {
            proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
            if (NULL != proc_handle) {
                if (record_proc_state_transition(proc_handle, RECORD_CONDITION_READY))
                    CVR_ERR("Recording state change failed!\n");
            }
        }
    } else {
        if (RECORD_ALL_CHN == cam_id) {
            MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
                if (record_proc_state_transition(proc_handle, RECORD_CONDITION_ACTION))
                    CVR_ERR("Recording state change failed!\n");
            }
        } else {
            proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
            if (NULL != proc_handle) {
                if (record_proc_state_transition(proc_handle, RECORD_CONDITION_ACTION))
                    CVR_ERR("Recording state change failed!\n");
            }
        }
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return 0;
}

int32_t mpu_record_stop(int32_t cam_id) {
    HANDLE proc_handle = NULL;

    MPU_RECORD_CHECK_INIT(g_record_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    if (RECORD_ALL_CHN == cam_id) {
        MPU_RECORD_FOR_EACH_PROC_HANDLE(proc_handle, &g_record_manger) {
            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_STOP))
                CVR_ERR("Recording state change failed!\n");
        }
    } else {
        proc_handle = MPU_RECORD_GET_PROC_HANDLE(cam_id, &g_record_manger);
        if (NULL != proc_handle) {
            if (record_proc_state_transition(proc_handle, RECORD_CONDITION_STOP))
                CVR_ERR("Recording state change failed!\n");
        }
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return 0;
}

int32_t mpu_record_init(void) {
    if (true == g_record_init)
        return 0;

    record_param_cfg_t param_cfg;

    memset(&param_cfg, 0, sizeof(param_cfg));

    if (record_param_get_cfg(&param_cfg)) {
        CVR_ERR("Failed to obtain recording parameters!\n");
        return -1;
    }

#ifdef USE_RKAOV
    aov_init();
#endif

#ifdef FILE_CACHE
    file_cache_init(&param_cfg);
#endif

    if (0 != record_init(&param_cfg)) {
    #ifdef FILE_CACHE
        file_cache_deinit();
    #endif

    #ifdef USE_RKAOV
        aov_deinit();
    #endif
        return -1;
    }

    mpu_storage_event_cb_register(storage_event_cb);

    g_record_init = true;

    return 0;
}

void mpu_record_deinit(void) {
    MPU_RECORD_CHECK_INIT(g_record_init, );

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    mpu_storage_event_cb_unregister(storage_event_cb);

    record_deinit();

#ifdef FILE_CACHE
    file_cache_deinit();
#endif

#ifdef USE_RKAOV
    aov_deinit();
#endif

    g_record_init = false;

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}