#include <pthread.h>
#include <sys/time.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#include "rk_mpi_vi.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vpss.h"
#include "rk_mpi_rgn.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_cal.h"

#include <rk_aiq_user_api2_camgroup.h>
#include <rk_aiq_user_api2_imgproc.h>
#include <rk_aiq_user_api2_sysctl.h>
#include <rk_aiq_api_types_ae.h>
#include "rkrawstream_user_api.h"

#include "common.h"
#include "rkmuxer.h"

//#include "rkpreroll.h"
//#include "rkdrm.h"
//#include "rga/rga.h"

#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "sensor_init_info.h"
#include "sample_comm_rgn.h"

#define RED_COLOR                                  0x0000FF
#define BLUE_COLOR                                 0xFF0000

#define TEST_SAVE_RAW_FILE                         1
#define RAW_FILE_INPUT                             0
#define SAVE_YUV_FILE                              1
#define PRE_RECORD_FPS                             5
#define PRE_AWB_PROCESS_COUNT                      3
#define MAX_PSRAM_FRAMES_COUNT                     35

typedef enum {
	PRE_RECORD_FPS_1 = 1,
	PRE_RECORD_FPS_2,
	PRE_RECORD_FPS_3,
	PRE_RECORD_FPS_4,
	PRE_RECORD_FPS_5,
} PRE_RECORD_FPS_E;

typedef enum {
	RAW_SBGGR_8 = 0,
	RAW_SBGGR_10,
} IMAGE_FORMAT;

typedef struct PreRecordInfo {
	uint32_t width;
	uint32_t height;
	uint32_t fps;
	uint32_t spi2ahb_success;
	uint32_t spi2ahb_error;
	uint32_t raw_frames_count;
	uint32_t raw_frames_start_seq;
	uint32_t sink_start_addr;
} PreRecordInfo_S;

typedef struct StreamPacketHead {
	uint32_t frame_size;
	uint32_t frame_next_addr;
	uint32_t frame_cur_addr;
	//uint32_t gop; //todo is need to get frame key venc could get?
	int64_t pts;
} StreamPacketHead_S;

typedef struct ShmInfo
{
	rk_aiq_wb_gain_t gain;
	ae_queryInfo_t ExpResInfo;
	uint32_t is_write_file_end;
	uint32_t max_frame_size;
} ShmInfo_S;

/*
	bit 0	0b: lsb; 1b: msb
	bit 1	0b: str; 1b: ddr
	bit 2	0b: cs active low; 1b cs active high
	bit 3	0b: mode0; 1b: mode3
	bit 4-5 00b: 1bit; 01b: 2bits; 10b: 4bits
*/
struct spi_ctrl {
	uint32_t fbm:1,
		 ddr_en:1,
		 cs_mode:1,
		 spim:1,
		 datab:2,
		 fps:5,
		 reserved:21;
};

struct pr_frame_info {
	uint16_t width;
	uint16_t height;
	uint32_t size;
};

typedef struct amp_shm {
	struct spi_ctrl ctrl;
	struct pr_frame_info pr_frame;
	uint32_t frame_align_size;
	uint32_t sink_start_addr;
	uint32_t sink_size;
	uint32_t frame_cnt;
	uint32_t rc_freq;
	/*todo t0 t1 timeout*/
	uint32_t log_magic;
	uint32_t run;
	uint32_t main_loop;
	uint32_t on_isr;
	uint32_t off_isr;
	uint32_t spi2ahb_error;
	uint32_t spi2ahb_success;
} AMP_SHM_S;

typedef struct {
	struct list_head mark;
	MB_BLK pMbBlk;
	unsigned char *buf;
	uint32_t size;
	int isKeyFrame;
	int64_t pts;
	bool bIsPool;
	struct list_head *pool;
	uint32_t seq;
} MUXER_BUF_CELL_S;

typedef struct _OFFLINE_AIQ{
	bool quit;
	rkraw_vi_ctx_t *victx;
	char *entity;
	char *mode;

	int vicap_w;
	int vicap_h;
	int vicap_pixfmt;
	int vicap_memtype;
	int vicap_buftype;

	int readback_w;
	int readback_h;
	int readback_pixfmt;
	int readback_memtype;
	int readback_buftype;

	int frame_num;
	int frame_id;
	int frame_skip;
	char *frame_dir;
	int frame_cnt;//todo maybe unused

	uint8_t *raw_buffer;
	uint32_t raw_size;

	uint8_t use_aiq;
	char *iqpath;
	char *raw_file;

	FILE *raw_fp;
	FILE *yuv_fp;

	rk_aiq_sys_ctx_t* aiqctx;
} OFFLINE_AIQ_S;

typedef struct _rkVENCCHN {
	uint32_t u32Width;
	uint32_t u32Height;
	uint32_t u32Gop;
	uint32_t u32BitRate;
	uint32_t u32StreamBufCnt;
	uint32_t enCodecType;
	VENC_CHN s32ChnId;
	VENC_CHN_ATTR_S stChnAttr;
	PIXEL_FORMAT_E enPixelFormat;
	VENC_RC_PARAM_S stRcParam;
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
} VENC_CHN_S;


typedef struct _rkMpiVENCCtx {
	VENC_CHN_S chn[2];
} VENC_CTX_S;

typedef struct _rkVICHN {
	uint32_t chn_id;
	uint32_t width;
	uint32_t height;
	VI_CHN_ATTR_S stChnAttr;
	VI_SAVE_FILE_INFO_S stDebugFile;
} VI_CHN_S;

typedef struct _rkVIDEV {
	uint32_t dev_id;
	VI_CHN_S chn[5];
	VI_DEV_ATTR_S stDevAttr;
} VI_DEV_S;

typedef struct _rkVIPIPE {
	uint32_t pipe_id;
	uint32_t width;
	uint32_t height;
	VI_PIPE_ATTR_S stPipeAttr;
	VI_DEV_BIND_PIPE_S stBindPipe;
} VI_PIPE_S;

typedef struct _rkMpiVICtx {
	VI_DEV_S dev[2];
	VI_PIPE_S pipe[2];
} VI_CTX_S;

typedef struct _rkMpiVPSSCtx {
	uint32_t u32DstWidth;
	uint32_t u32DstHeight;
	uint32_t u32SrcWidth;
	uint32_t u32SrcHeight;
	VPSS_GRP_ATTR_S stVpssGrpAttr;
	VPSS_CHN_ATTR_S stVpssChnAttr;
} VPSS_CTX_S;

typedef struct _rkMpiCtx {
	VI_CTX_S vi;
	VENC_CTX_S venc;
	VPSS_CTX_S vpss;
	OFFLINE_AIQ_S aiq;
} MPI_CTX_S;

typedef struct meta_info
{
	struct app_param_info app_params;
	struct sensor_init_cfg sensor_init;
} META_INFO;

rk_aiq_sys_ctx_t *g_aiq_ctx;

pthread_mutex_t g_mutex;

static uint32_t g_reg_gain = 0;
static uint32_t g_reg_time = 0;
static float g_real_gain = 0.0;
static float g_real_time = 0.0;
static int g_use_last_frame_exp = 1;
static uint32_t g_test_wb_ae_set = 0;
static uint32_t g_rga_en = 1;

static char g_YuvFilePath[128] = "";
static char g_RawFilePath[128] = "";
static char g_RecordFilePath[128] = "";
static int g_quit = false;

static uint32_t g_dst_width = 2560;
static uint32_t g_dst_height = 1472;
static uint32_t g_rgb_bayer_fmt = RK_FMT_RGB_BAYER_SBGGR_8BPP;
static uint32_t g_pix_fmt = RK_PIX_FMT_SBGGR8;
static uint32_t g_format = 0;

static uint32_t g_width_align_16 = 648;
static uint32_t g_height_align_8 = 368;
static uint32_t g_hdr_mode = 0;
static uint32_t g_max_frame_size = 0;
static uint32_t g_osd_enable = 1;
static uint32_t g_process_end = 0;
static uint32_t g_set_ae_awb_manual = 0;
static SAMPLE_RGN_CTX_S g_rgn_ctx = {0};
static ShmInfo_S g_ShmInfo = {0};
static ShmInfo_S* g_ShareMemory = {0};

static StreamPacketHead_S g_PreRecordHeadInfo = {0};
static StreamPacketHead_S g_NormalHeadInfo = {0};
static PreRecordInfo_S g_PreRecordInfo = {0};
static char g_cmd[128] = "";

int64_t getCurrentTimeUs()
{
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec * 1000000 + tv.tv_usec;
}

static void draw_osd(void) {
	if (!g_osd_enable)
		return;
	SAMPLE_COMM_RGN_DrawOsd(&g_rgn_ctx, g_PreRecordInfo.fps);
}

static RK_S32 rgn_init(void){
	RK_S32 ret = RK_SUCCESS;

	g_rgn_ctx.rgnHandle = 1;
	g_rgn_ctx.stRgnAttr.enType = OVERLAY_RGN;
	g_rgn_ctx.stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
	g_rgn_ctx.bDrawBmpManual = RK_TRUE;
	g_rgn_ctx.stMppChn.enModId = RK_ID_VENC;
	g_rgn_ctx.stMppChn.s32ChnId = 2; //todo venc chn id
	g_rgn_ctx.stMppChn.s32DevId = 0;
	g_rgn_ctx.stRegion.s32X = 0;                          // must be 16 aligned
	g_rgn_ctx.stRegion.s32Y = 0;                          // must be 16 aligned
	g_rgn_ctx.stRegion.u32Width = 1024;   // must be 16 aligned //todo region width
	g_rgn_ctx.stRegion.u32Height = 128; // must be 16 aligned //todo region height
	g_rgn_ctx.u32BmpFormat = RK_FMT_ARGB8888;
	g_rgn_ctx.u32BgAlpha = 0;
	g_rgn_ctx.u32FgAlpha = 255;
	g_rgn_ctx.u32Layer = 1;
	g_rgn_ctx.stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	g_rgn_ctx.stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	g_rgn_ctx.st_osd_data.enable = g_osd_enable;
	if (g_osd_enable) {
		ret = SAMPLE_COMM_RGN_CreateChn(&g_rgn_ctx);
		if (ret != RK_SUCCESS)
			return ret;
	}
}

/*
 * 0. config vi pipe
 * 1. start vi pipe
 * 2. config vi channel
 * 3. enable vi channel
 */
static RK_S32 vi_offline_init(VI_CTX_S *ctx) {
	RK_S32 ret = RK_FAILURE;

	// 0. config vi pipe
	ret = RK_MPI_VI_CreatePipe(ctx->pipe[0].pipe_id,
				      &ctx->pipe[0].stPipeAttr);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("RK_MPI_VI_CreatePipe pipe [%d] failed! ret [0x%08x]\n",
				      ctx->pipe[0].pipe_id,
				      ret);
		goto __FAILED;
	}

	for (int i = 0; i < 2; i++) {
		// 2.config dev0 channel 0/1
		ret = RK_MPI_VI_SetChnAttr(ctx->pipe[0].pipe_id,
					      ctx->dev[0].chn[i].chn_id,
					      &ctx->dev[0].chn[i].stChnAttr);
		if (ret != RK_SUCCESS) {
			ao_record_service_err("RK_MPI_VI_SetChnAttr pipe [%d] chn [%d] failed! ret [0x%08x]\n",
					      ctx->pipe[0].pipe_id,
					      ctx->dev[0].chn[i].chn_id,
					      ret);
			goto __FAILED;
		}

		// 3.enable dev0 channel 0/1
		ret = RK_MPI_VI_EnableChn(ctx->pipe[0].pipe_id,
					     ctx->dev[0].chn[i].chn_id);
		if (ret != RK_SUCCESS) {
			ao_record_service_err("RK_MPI_VI_EnableChn pipe [%d] chn [%d] failed! ret [0x%08x]\n",
					      ctx->pipe[0].pipe_id,
					      ctx->dev[0].chn[i].chn_id,
					      ret);
			goto __FAILED;
		}
	}

	ret = RK_MPI_VI_StartPipe(ctx->pipe[0].pipe_id);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("RK_MPI_VI_StartPipe pipe [%d] failed! ret [0x%08x]\n",
				      ctx->pipe[0].pipe_id,
				      ret);
		goto __FAILED;
	}

	// 4.save debug file
	if (ctx->dev[0].chn[0].stDebugFile.bCfg) {
		ret = RK_MPI_VI_ChnSaveFile(ctx->pipe[0].pipe_id,
					       ctx->dev[0].chn[0].chn_id,
					       &ctx->dev[0].chn[0].stDebugFile);
		ao_record_service_dbg("RK_MPI_VI_ChnSaveFile pipe [%d] chn [%d] failed! ret [%x]\n",
				      ctx->pipe[0].pipe_id,
				      ctx->dev[0].chn[0].chn_id,
				      ret);
	}
__FAILED:
	return ret;
}

static int32_t vi_offline_deinit(VI_CTX_S *ctx)
{
	int ret;

	ret = RK_MPI_VI_StopPipe(ctx->pipe[0].pipe_id);
	if (ret != 0) {
		ao_record_service_err("[%s] vi stop pipe [%d] failed! ret [0x%08x]\n",
				   __func__, ctx->pipe[0].pipe_id, ret);
		return ret;
	}

	for (int i = 0; i < 2; i++) {
		ret = RK_MPI_VI_DisableChn(ctx->pipe[0].pipe_id, ctx->dev[0].chn[i].chn_id);
		if (ret != 0) {
			ao_record_service_err("[%s] vi pipe [%d] chn [%d] disable failed! ret [0x%08x]\n",
					   __func__, ctx->pipe[0].pipe_id, ctx->dev[0].chn[i].chn_id, ret);
			return ret;
		}
	}

	return ret;
}

static int32_t vpss_deinit()
{
	int32_t ret = 0, Grp = 0, VpssChn = 0;

	ret = RK_MPI_VPSS_DisableChn(Grp, VpssChn);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("VPSS Group [%d] Chn[%d] disable failed! ret [0x%08x]\n", Grp, VpssChn, ret);
		return ret;
	}

	ret = RK_MPI_VPSS_StopGrp(Grp);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("VPSS Group [%d] stop failed! ret [0x%08x]\n", Grp, ret);
		return ret;
	}

	ret = RK_MPI_VPSS_DestroyGrp(Grp);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("VPSS Group [%d] destroy failed! ret [0x%08x]\n", Grp, ret);
		return ret;
	}

	return ret;
}

static void *send_raw_frame_thread(void *arg) {
	ao_record_service_info("[%s] enter\n", __func__);
	int pipe_id = 1;
	uint32_t raw_addr_offset_seq = 0;
	RK_S32 ret = RK_SUCCESS;
	RK_S32 waitTime = 3000;
	RK_S32 loopCount = 0;
	VIDEO_FRAME_INFO_S stViFrame = {0};
	FILE *fp = NULL, *vir_fp = NULL, *raw_fp = NULL;
	uint8_t *buf_align_width_16 = NULL;
	rk_aiq_frame_info_t expinfo = {0};
	uint32_t reg_gain_addr = 0, reg_time_addr = 0;
	uint32_t raw_addr_offset_size = 0;
	rk_aiq_uapiV2_awb_ffwbgain_attr_t attr = {0};

	PIC_BUF_ATTR_S RawBufAttr = {0}, AlignedBufAttr = {0};
	MB_PIC_CAL_S RawPicCal = {0}, AlignedPicCal = {0};
	MB_POOL_CONFIG_S stMbPoolCfg = {0};
	MB_POOL mbPool = MB_INVALID_POOLID;
	uint8_t *raw_buf = NULL;

	raw_addr_offset_seq = g_PreRecordInfo.raw_frames_start_seq;

	RawBufAttr.u32Width = g_PreRecordInfo.width;
	RawBufAttr.u32Height = g_PreRecordInfo.height;
	RawBufAttr.enCompMode = COMPRESS_MODE_NONE;
	RawBufAttr.enPixelFormat = g_rgb_bayer_fmt;
	ret = RK_MPI_CAL_COMM_GetPicBufferSize(&RawBufAttr, &RawPicCal);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("RK_MPI_CAL_TDE_GetPicBufferSize failed! ret [0x%08x]\n", ret);
		return RK_NULL;
	}

	raw_buf = malloc(RawPicCal.u32MBSize);
	ao_record_service_info("Malloc raw buf size [%d]\n", RawPicCal.u32MBSize);

#if RAW_FILE_INPUT
	char *inputRawPath = "/etc/1.raw";

	fp = fopen(inputRawPath, "rb");
	if (fp == NULL) {
		perror("Error: ");
		exit(1);
	}

	fread(raw_buf, 1, RawPicCal.u32MBSize, fp);
	fclose(fp);
#endif

	AlignedBufAttr.u32Width = g_width_align_16;
	AlignedBufAttr.u32Height = g_height_align_8;
	AlignedBufAttr.enCompMode = COMPRESS_MODE_NONE;
	AlignedBufAttr.enPixelFormat = g_rgb_bayer_fmt;
	ret = RK_MPI_CAL_COMM_GetPicBufferSize(&AlignedBufAttr, &AlignedPicCal);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("RK_MPI_CAL_TDE_GetPicBufferSize failed! ret [0x%08x]\n", ret);
		return RK_NULL;
	}

	buf_align_width_16 = malloc(AlignedPicCal.u32MBSize);
	ao_record_service_info("Malloc AlignedBuf size [%d]\n", AlignedPicCal.u32MBSize);

	memset(&stMbPoolCfg, 0, sizeof(MB_POOL_CONFIG_S));
	stMbPoolCfg.u64MBSize = AlignedPicCal.u32MBSize;
	stMbPoolCfg.u32MBCnt = 3;
	stMbPoolCfg.enAllocType = MB_ALLOC_TYPE_DMA;
	stMbPoolCfg.bPreAlloc = RK_TRUE;
	mbPool = RK_MPI_MB_CreatePool(&stMbPoolCfg);
	if (mbPool == MB_INVALID_POOLID) {
		ao_record_service_err("RK_MPI_MB_CreatePool failed! ret [0x%08x]\n", ret);
		exit(-1);
	}
	while (loopCount < g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT) {
		if (g_use_last_frame_exp) {
			expinfo.normal_exp = g_real_time;
			expinfo.normal_gain = g_real_gain;
			if (g_test_wb_ae_set) {
				expinfo.normal_exp = g_ShmInfo.ExpResInfo.linExpInfo.expParam.integration_time;
				expinfo.normal_gain = g_ShmInfo.ExpResInfo.linExpInfo.expParam.analog_gain;
				attr.wggain.rgain = (float)g_ShmInfo.gain.rgain;
				attr.wggain.grgain = (float)g_ShmInfo.gain.grgain;
				attr.wggain.gbgain = (float)g_ShmInfo.gain.gbgain;
				attr.wggain.bgain = (float)g_ShmInfo.gain.bgain;
				//rk_aiq_user_api2_awb_SetFFWbgainAttrib(g_aiq_ctx, attr);
			}
			rk_aiq_uapi2_sysctl_rawReproc_genIspParams(g_aiq_ctx, loopCount, &expinfo, 1);// mode == 1
		}
		stViFrame.stVFrame.pMbBlk = RK_MPI_MB_GetMB(mbPool, AlignedPicCal.u32MBSize, RK_TRUE);
		if (stViFrame.stVFrame.pMbBlk == MB_INVALID_HANDLE) {
			usleep(1000);
			continue;
		}
		stViFrame.stVFrame.u32Width = RawBufAttr.u32Width;
		stViFrame.stVFrame.u32Height = RawBufAttr.u32Height;
		stViFrame.stVFrame.u32VirWidth = AlignedBufAttr.u32Width;
		stViFrame.stVFrame.u32VirHeight = AlignedBufAttr.u32Height;
		stViFrame.stVFrame.u32TimeRef = loopCount;
		stViFrame.stVFrame.u64PTS = loopCount * 100;
		stViFrame.stVFrame.enPixelFormat = g_rgb_bayer_fmt;
		stViFrame.stVFrame.enCompressMode = COMPRESS_MODE_NONE;

		/*
		 * The raw frame size is aligned up to 256 in psram
		 */
		if (RawPicCal.u32MBSize % 256)
			raw_addr_offset_size = (RawPicCal.u32MBSize / 256 + 1) * 256;
		else
			raw_addr_offset_size = RawPicCal.u32MBSize;
		read_mem(g_PreRecordInfo.sink_start_addr + raw_addr_offset_seq * raw_addr_offset_size, 
			 raw_buf,
			 RawPicCal.u32MBSize);
		ao_record_service_dbg("loopCount [%d] raw_addr_offset_seq [%d] raw_addr_offset_size [%d]\n",
				       loopCount, raw_addr_offset_seq, raw_addr_offset_size);

		/* raw crop to width 16 aligned height 8 aligned */
		for(int i = 0; i < g_height_align_8; i++) {
			memcpy(buf_align_width_16 + i * g_width_align_16,
			       raw_buf + i * g_PreRecordInfo.width,
			       g_width_align_16);
		}

		/* save raw and aligned raw */
#if TEST_SAVE_RAW_FILE
		char RawPath[32] = {0};
		sprintf(RawPath, "/%s/648x368_%d.raw", g_RawFilePath, raw_addr_offset_seq);
		raw_fp = fopen(RawPath, "wb");
		if (raw_fp == NULL) {
			ao_record_service_err("open file %s failed! reason [%s]\n", g_RawFilePath, strerror(errno));
			exit(1);
		}
		fwrite(raw_buf, 1, RawPicCal.u32MBSize, raw_fp);
		fflush(raw_fp);
		fclose(raw_fp);

		char VirRawPath[32] = {0};
		sprintf(VirRawPath, "/%s/640x368_%d.raw", g_RawFilePath, raw_addr_offset_seq);
		vir_fp = fopen(VirRawPath, "wb");
		if (vir_fp == NULL) {
			ao_record_service_err("open file %s failed! reason [%s]\n", g_RawFilePath, strerror(errno));
			exit(1);
		}
		fwrite(buf_align_width_16, 1, AlignedPicCal.u32MBSize, vir_fp);
		fflush(vir_fp);
		fclose(vir_fp);
#endif
		memcpy(RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk),
		       buf_align_width_16,
		       AlignedPicCal.u32MBSize);
		RK_MPI_SYS_MmzFlushCache(stViFrame.stVFrame.pMbBlk, RK_FALSE);
		ret = RK_MPI_VI_PipeSendFrame(pipe_id, &stViFrame, waitTime);
		if (ret != RK_SUCCESS) {
			ao_record_service_err("RK_MPI_VI_PipeSendFrame failed! ret [0x%08X\n", ret);
			exit(-1);
		}

		loopCount++;
		if (loopCount >= PRE_AWB_PROCESS_COUNT)
			raw_addr_offset_seq++;
		/*
		 * if loopcount is more than the max frames for psram to save 
		 * raw addr offset will return to the start address of psram memory
		 * in 648x368 resolution it will save 35 frames at most
		 */
		if (g_PreRecordInfo.raw_frames_count + g_PreRecordInfo.raw_frames_start_seq - 1 >= MAX_PSRAM_FRAMES_COUNT &&
		    raw_addr_offset_seq == MAX_PSRAM_FRAMES_COUNT) {
			raw_addr_offset_seq = 0;
		}

		RK_MPI_MB_ReleaseMB(stViFrame.stVFrame.pMbBlk);
		stViFrame.stVFrame.pMbBlk = RK_NULL;
		ao_record_service_dbg("send pipe [%d] success loopCount [%d]\n", pipe_id, loopCount);
		if (!g_rga_en) {
			usleep(2000 * 1000);
		} else {
			usleep(20 * 1000);
		}
	}

	if (raw_buf)
		free(raw_buf);
	if (buf_align_width_16)
		free(buf_align_width_16);
	if (fp)
		fclose(fp);
	RK_MPI_MB_DestroyPool(mbPool);
	return RK_NULL;
}

int write_bin(char* file_name, uint8_t* pdata, int nSize, int index)
{
	FILE* fp = NULL;
	if (index == 0)
		fp = fopen(file_name, "wb");
	else
		fp = fopen(file_name, "ab");

	if (fp == NULL) {
		printf("Write %s fail!\n", file_name);
		exit(-1);
	}
	if(fwrite(pdata, sizeof(uint8_t), nSize, fp) != nSize) {
		perror("Error writing to file");
		exit(1);
	}
	fflush(fp);
	fclose(fp);
	return 0;
}

static int32_t mkdirs(char *multidir)
{
	int i, len;
	char str[512];
	int32_t ret = 0;

	strncpy(str, multidir, 512);
	len = strlen(str);
	for(i = 0; i < len; i++) {
		if(str[i] == '/') {
			str[i] = '\0';
			if(access(str, 0) != 0) {
				mkdir(str, 0777);
			}
			str[i] = '/';
		}
	}
	if (len > 0 && access(str, 0) != 0 ) {
		ret = mkdir(str, 0777);
	}
	return ret;
}

static void *get_yuv_frame_thread(void *arg) {
	VI_CTX_S *ctx = (VI_CTX_S *)arg;
	int32_t pipeId = 1, channelId = 0, loopCount = 0, loopCountBak = 0, loopErrCnt = 0;
	int32_t waitTime = 3000, ret = RK_FAILURE, yuv_seq = 0;
	void *pData = RK_NULL;
	VIDEO_FRAME_INFO_S stViFrame = {0};
	VI_CHN_STATUS_S stChnStatus = {0};
	FILE *yuv_fp = NULL;
	FILE *full_yuv_fp = NULL;

	/*
	 * sr algorithm
	 */
	char dstLargeYuvPath[128] = "";
	char srcSmallYuvPath[128] = "";
	char srcLargeYuvPath[128] = "";
	//uint32_t srcSmallWidth, srcSmallHeight, srcLargeWidth, srcLargeHeight, dstLargeWidth, dstLargeHeight;
	//rkdma_buf srcSmallBuf, srcLargeBuf, dstLargeBuf;
	//rk_preroll_param param;

	sprintf(srcLargeYuvPath, "/%s/srcLarge_2560x1472_420SP.yuv", g_YuvFilePath);
	sprintf(g_cmd, "cp /mnt/sdcard/srcLarge_2560x1472_420SP.yuv %s", srcLargeYuvPath);
	execute_cmd(g_cmd);

	if (!g_rga_en) {
	//	srcSmallWidth = g_width_align_16;
	//	srcSmallHeight = g_height_align_8;
	//	srcLargeWidth = g_dst_width;
	//	srcLargeHeight = g_dst_height;
	//	dstLargeWidth = g_dst_width;
	//	dstLargeHeight = g_dst_height;
//
	//	rkdrm_init();
	//	// Alloc SrcSmallBuf Buffer
	//	srcSmallBuf.size = srcSmallWidth * srcSmallHeight * 3 / 2;
	//	rkdrm_allocBuffer(&srcSmallBuf);
	//	printf("srcSmallBuf alloc, fd is %d, phy_addr is %d, vir_addr is %p\n", srcSmallBuf.fd, srcSmallBuf.phy_addr, srcSmallBuf.vir_addr);
//
	//	// Alloc SrcLargeBuf Buffer
	//	srcLargeBuf.size = srcLargeWidth * srcLargeHeight * 3 / 2;
	//	rkdrm_allocBuffer(&srcLargeBuf);
	//	printf("srcLargeBuf alloc, fd is %d, phy_addr is %d, vir_addr is %p\n", srcLargeBuf.fd, srcLargeBuf.phy_addr, srcLargeBuf.vir_addr);
//
	//	// Alloc DstLargeBuf Buffer
	//	dstLargeBuf.size = dstLargeWidth * dstLargeHeight * 3 / 2;
	//	rkdrm_allocBuffer(&dstLargeBuf);
	//	printf("dstLargeBuf alloc, fd is %d, phy_addr is %d, vir_addr is %p\n", dstLargeBuf.fd, dstLargeBuf.phy_addr, dstLargeBuf.vir_addr);
//
	//	// Init RKPre-Roll
	//	param.modelPath0        = "/mnt/sdcard/rkpreroll0.rknn";
	//	param.modelPath1        = "/mnt/sdcard/rkpreroll1.rknn";
	//	printf("model_path [path0, path1] [%s, %s]\n", param.modelPath0, param.modelPath1);
//
	//	param.srcSmallHgt       = srcSmallHeight;
	//	param.srcSmallHgtStd    = srcSmallHeight;
	//	param.srcSmallWid       = srcSmallWidth;
	//	param.srcSmallWidStd    = srcSmallWidth;
	//	param.srcSmallBufFd     = srcSmallBuf.fd;
	//	param.srcSmallBufSize   = srcSmallBuf.size;
	//	param.srcSmallBufVirt   = srcSmallBuf.vir_addr;
	//	param.srcSmallBufFormat = RK_FORMAT_YCbCr_420_SP;
//
	//	param.srcLargeHgt       = srcLargeHeight;
	//	param.srcLargeHgtStd    = srcLargeHeight;
	//	param.srcLargeWid       = srcLargeWidth;
	//	param.srcLargeWidStd    = srcLargeWidth;
	//	param.srcLargeBufFd     = srcLargeBuf.fd;
	//	param.srcLargeBufSize   = srcLargeBuf.size;
	//	param.srcLargeBufVirt   = srcLargeBuf.vir_addr;
	//	param.srcLargeBufFormat = RK_FORMAT_YCbCr_420_SP;
//
	//	param.dstLargeHgt       = dstLargeHeight;
	//	param.dstLargeHgtStd    = dstLargeHeight;
	//	param.dstLargeWid       = dstLargeWidth;
	//	param.dstLargeWidStd    = dstLargeWidth;
	//	param.dstLargeBufFd     = dstLargeBuf.fd;
	//	param.dstLargeBufSize   = dstLargeBuf.size;
	//	param.dstLargeBufVirt   = dstLargeBuf.vir_addr;
	//	param.dstLargeBufFormat = RK_FORMAT_YCbCr_420_SP;
//
	//	rk_preroll_init(&param);
	//	printf("rk_preroll_init end\n");
//
	//	full_yuv_fp = fopen(srcLargeYuvPath, "rb");
	//	if (full_yuv_fp == NULL) {
	//		perror("Error: ");
	//		exit(1);
	//	}
	//	fread(srcLargeBuf.vir_addr, 1, srcLargeBuf.size, full_yuv_fp);
	}

	while (loopCount < g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT) {
		if (loopCount >= PRE_AWB_PROCESS_COUNT) {
			yuv_seq = loopCount - PRE_AWB_PROCESS_COUNT;
		} else {
			yuv_seq = 0;
		}
		// 5.get the frame
		ret = RK_MPI_VI_GetChnFrame(pipeId, channelId, &stViFrame, -1);
		if (ret == RK_SUCCESS) {
			void *data = RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk);
			RK_U64 phyAddr = RK_MPI_MB_Handle2PhysAddr(stViFrame.stVFrame.pMbBlk);
			ao_record_service_info("RK_MPI_VI_GetChnFrame ok:hd [%p] data [%p] phyaddr [0x%08x] loop [%d] seq [%d] pts [%lld]ms len [%d]\n",
					       RK_MPI_MB_VirAddr2Handle(data),
					       data,
					       (RK_U32)phyAddr,
					       loopCount,
					       stViFrame.stVFrame.u32TimeRef,
					       stViFrame.stVFrame.u64PTS / 1000,
					       RK_MPI_MB_GetSize(stViFrame.stVFrame.pMbBlk));
#if SAVE_YUV_FILE
				sprintf(srcSmallYuvPath, "/%s/srcSmall_640x368_420SP.yuv", g_YuvFilePath);
				ao_record_service_dbg("loopCount [%d] yuv_seq [%d]\n", loopCount, yuv_seq);
				write_bin(srcSmallYuvPath, RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk), g_width_align_16 * g_height_align_8 * 3 / 2, yuv_seq);
#endif
			if (!g_rga_en) {
				///* test for sr*/
				//memcpy(srcSmallBuf.vir_addr, RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk), srcSmallBuf.size);
				//long long t0 = getCurrentTimeUs();
				//rk_preroll_proc(&param);
				//long long t1 = getCurrentTimeUs();
				//printf("rkpreroll proc time: %fms.\n", (t1-t0)/1000.f);
				//sprintf(dstLargeYuvPath, "/%s/dstLarge_2560x1472_420SP.yuv", g_YuvFilePath);
				//printf("start to write file\n");
				//write_bin(dstLargeYuvPath, dstLargeBuf.vir_addr, g_dst_width * g_dst_height * 3 / 2, yuv_seq);
			}
			// 6.get the channel status
			ret = RK_MPI_VI_QueryChnStatus(pipeId,
							  channelId,
							  &stChnStatus);
			ao_record_service_dbg("RK_MPI_VI_QueryChnStatus ret [%x] [w h] [%d %d] enable [%d]" \
					      "current_frame_id [%d] input_lost [%d] output_lost[%d]" \
					      "framerate [%d] vbfail [%d] PTS [%lld]us\n",
					      ret,
					      stChnStatus.stSize.u32Width,
					      stChnStatus.stSize.u32Height,
					      stChnStatus.bEnable,
					      stChnStatus.u32CurFrameID,
					      stChnStatus.u32InputLostFrame,
					      stChnStatus.u32OutputLostFrame,
					      stChnStatus.u32FrameRate,
					      stChnStatus.u32VbFail,
					      stViFrame.stVFrame.u64PTS);
			// 7.release the frame
			ret = RK_MPI_VI_ReleaseChnFrame(pipeId,
							   channelId,
							   &stViFrame);
			if (ret != RK_SUCCESS) {
				ao_record_service_err("RK_MPI_VI_ReleaseChnFrame failed ret [0x%08x]\n", ret);
			}
			loopCount++;
			loopCountBak = loopCount;
			if (loopErrCnt) loopErrCnt = 0;
		} else {
			ao_record_service_err("pipe [%d] vi chn [%d] RK_MPI_VI_GetChnFrame loopCount [%d] yuv_seq [%d] timeout ret [0x%08x]\n",
					      pipeId,
					      channelId,
					      loopCount,
					      yuv_seq,
					      ret);
			if (!loopCountBak)
				loopErrCnt++;
			if (loopErrCnt > 50)
				g_quit = RK_TRUE;
		}
	}
	if (!g_rga_en) {
		//rkdrm_freeBuffer(&srcSmallBuf);
		//rkdrm_freeBuffer(&srcLargeBuf);
		//rkdrm_freeBuffer(&dstLargeBuf);
//
		//// Deinit RKPre-Roll
		//rk_preroll_deinit(&param);
		//rkdrm_deinit();
	}
}

void write_data_to_file(FILE *fp, uint8_t *data, int size)
{
	assert(fp);
	if (fp) {
		if (fwrite(data, 1, size, fp) != size) {
			perror("Error writing to file");
			exit(1);
		}
		fflush(fp);
	}
}

static void save_venc_stream_to_file(FILE *fp, VENC_STREAM_S stFrame)
{
	void *pData = NULL;

	if (fp) {
		
		pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
		RK_MPI_SYS_MmzFlushCache(stFrame.pstPack->pMbBlk, false);

		write_data_to_file(fp, pData, stFrame.pstPack->u32Len);
	}
}

static void save_muxer_stream_to_file(FILE *fp, VENC_STREAM_S stFrame, StreamPacketHead_S *HeadInfo)
{
	void *pData = NULL;

	if (fp) {
		HeadInfo->frame_size = stFrame.pstPack->u32Len;
		if (HeadInfo->frame_next_addr) {
			HeadInfo->frame_cur_addr = HeadInfo->frame_next_addr;
		} else {
			HeadInfo->frame_cur_addr = 0;
		}
		HeadInfo->frame_next_addr = HeadInfo->frame_cur_addr + sizeof(StreamPacketHead_S) + HeadInfo->frame_size;
		write_data_to_file(fp, (uint8_t *)HeadInfo, sizeof(StreamPacketHead_S));

		pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
		RK_MPI_SYS_MmzFlushCache(stFrame.pstPack->pMbBlk, false);
		write_data_to_file(fp, pData, stFrame.pstPack->u32Len);
	}
}

static void *get_pre_record_small_stream_thread(void *arg) {
	uint32_t loopCount = 0, ret = 0, errCnt = 0, ChnId = 1;
	VENC_STREAM_S stFrame;
	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));
	ao_record_service_info("%s enter\n", __func__);

	char VencStreamFilePath[128] = "";
	FILE *venc_stream_fp = NULL;

	sprintf(VencStreamFilePath, "%sPre-Record_Small_Video.bin", g_RecordFilePath);
	venc_stream_fp = fopen(VencStreamFilePath, "wb");
	if (venc_stream_fp == NULL) {
		ao_record_service_err("open file %s failed! reason [%s]\n", VencStreamFilePath, strerror(errno));
		exit(-1);
	}

	while (loopCount < g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT) {
		ret = RK_MPI_VENC_GetStream(ChnId, &stFrame, -1);
		if (ret == 0) {
			if (loopCount <= g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT && loopCount >= PRE_AWB_PROCESS_COUNT) {
				ao_record_service_info("ChnId [%d] loopCount [%d] enc->seq [%d] pkt_size [%lu] pts [%llu]\n", ChnId, loopCount,
						       stFrame.u32Seq, stFrame.pstPack->u32Len, stFrame.pstPack->u64PTS);
				save_venc_stream_to_file(venc_stream_fp, stFrame);
			}
			/* rtsp trasnfer */
			//if (loopCount > SAVE_ENC_FRM_CNT_MAX) {
			//	if (g_rtsplive && g_rtsp_session_0 && ChnId == 0) {
			//		pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
			//		ret = RK_MPI_SYS_MmzFlushCache(stFrame.pstPack->pMbBlk, true);
			//		rtsp_tx_video(g_rtsp_session_0, pData, stFrame.pstPack->u32Len,
			//			      stFrame.pstPack->u64PTS);
			//		rtsp_do_event(g_rtsplive);
			//	}
			//}

			ret = RK_MPI_VENC_ReleaseStream(ChnId, &stFrame);
			if (ret != 0) {
				ao_record_service_err("venc release chn [%d] failed! ret [0x%08x]\n", ChnId, ret);
			}
			errCnt = 0;
			loopCount++;
		} else {
			if (errCnt < 10) {
				ao_record_service_err("venc get chn [%d] frame failed! ret [0x%08x]\n", ChnId, ret);
			}
			errCnt++;
		}
	}

	if (venc_stream_fp)
		fclose(venc_stream_fp);
}

static void *get_pre_record_large_stream_thread(void *arg) {
	ao_record_service_info("%s enter\n", __func__);
	uint32_t loopCount = 0, ret = 0, errCnt = 0, ChnId = 2, yuv_seq = 0;
	VENC_STREAM_S stFrame;
	char VencStreamFilePath[128] = "";
	char MuxerStreamFilePath[128] = "";
	FILE *venc_stream_fp = NULL, *muxer_stream_fp = NULL;

	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	sprintf(VencStreamFilePath, "%sPre-Record_Large_Video.bin", g_RecordFilePath);
	sprintf(MuxerStreamFilePath, "%sPre-Record_Muxer.bin", g_RecordFilePath);
	venc_stream_fp = fopen(VencStreamFilePath, "wb");
	if (venc_stream_fp == NULL) {
		ao_record_service_err("open file %s failed! reason [%s]\n", VencStreamFilePath, strerror(errno));
		exit(-1);
	}
	muxer_stream_fp = fopen(MuxerStreamFilePath, "wb");
	if (muxer_stream_fp == NULL) {
		ao_record_service_err("open file %s failed! reason [%s]\n", MuxerStreamFilePath, strerror(errno));
		exit(-1);
	}

	while (loopCount < g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT) {
		draw_osd();
		ret = RK_MPI_VENC_GetStream(ChnId, &stFrame, -1);
		if (ret == 0) {
			if (loopCount < PRE_AWB_PROCESS_COUNT)
				yuv_seq = 0;
			else
				yuv_seq = loopCount - PRE_AWB_PROCESS_COUNT;
			if (loopCount <= g_PreRecordInfo.raw_frames_count + PRE_AWB_PROCESS_COUNT && loopCount >= PRE_AWB_PROCESS_COUNT) {
				ao_record_service_info("ChnId [%d] loopCount [%d] enc->seq [%d] pkt_size [%lu] pts [%llu]\n", ChnId, loopCount,
						       stFrame.u32Seq, stFrame.pstPack->u32Len, stFrame.pstPack->u64PTS);
				save_venc_stream_to_file(venc_stream_fp, stFrame);
				save_muxer_stream_to_file(muxer_stream_fp, stFrame, &g_PreRecordHeadInfo);
				if (g_max_frame_size < stFrame.pstPack->u32Len)
					g_max_frame_size = stFrame.pstPack->u32Len;
			}
			/* rtsp trasnfer */
			//if (loopCount > SAVE_ENC_FRM_CNT_MAX) {
			//	if (g_rtsplive && g_rtsp_session_0 && ChnId == 0) {
			//		pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
			//		ret = RK_MPI_SYS_MmzFlushCache(stFrame.pstPack->pMbBlk, true);
			//		rtsp_tx_video(g_rtsp_session_0, pData, stFrame.pstPack->u32Len,
			//			      stFrame.pstPack->u64PTS);
			//		rtsp_do_event(g_rtsplive);
			//	}
			//}

			ret = RK_MPI_VENC_ReleaseStream(ChnId, &stFrame);
			if (ret != 0) {
				ao_record_service_err("venc release chn [%d] failed! ret [0x%08x]\n", ChnId, ret);
			}
			errCnt = 0;
			loopCount++;
		} else {
			if (errCnt < 10) {
				printf("venc get chn [%d] frame failed! ret [0x%08x]\n", ChnId, ret);
			}
			errCnt++;
		}
	}
	g_process_end = 1;

	if (venc_stream_fp)
		fclose(venc_stream_fp);
	if (muxer_stream_fp)
		fclose(muxer_stream_fp);
}

static int offline_aiq_start() {
	int camId = 1;
	const char *sensor_entity_name, *iqpath = "/tmp/";
	rk_aiq_frame_info_t expinfo[2];
	rk_aiq_rkrawstream_info_t info = {0};
	rk_aiq_static_info_t aiq_static_info = {0};
	rk_aiq_uapiV2_awb_ffwbgain_attr_t attr;

	if (g_test_wb_ae_set || g_set_ae_awb_manual) {
		memcpy(&g_ShmInfo, g_ShareMemory, sizeof(ShmInfo_S));
		ao_record_service_dbg("get WBGain=[%f %f %f %f]\n",
				       g_ShmInfo.gain.rgain,
				       g_ShmInfo.gain.grgain,
				       g_ShmInfo.gain.gbgain,
				       g_ShmInfo.gain.bgain);
		ao_record_service_dbg("share memory [gain time] [%f %f]\n",
				       g_ShmInfo.ExpResInfo.linExpInfo.expParam.analog_gain,
				       g_ShmInfo.ExpResInfo.linExpInfo.expParam.integration_time);
		attr.wggain.rgain = (float)g_ShmInfo.gain.rgain;
		attr.wggain.grgain = (float)g_ShmInfo.gain.grgain;
		attr.wggain.gbgain = (float)g_ShmInfo.gain.gbgain;
		attr.wggain.bgain = (float)g_ShmInfo.gain.bgain;
	}
	rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId(camId, &aiq_static_info);

	if (g_use_last_frame_exp) {
		/* The First frame exp parameters */
		expinfo[0].normal_exp = g_real_time;
		expinfo[0].normal_gain = g_real_gain;
		/* The Second frame exp parameters */
		expinfo[1].normal_exp = g_real_time;
		expinfo[1].normal_gain = g_real_gain;
		if(g_test_wb_ae_set) {
			/* The First frame exp parameters */
			expinfo[0].normal_exp = g_ShmInfo.ExpResInfo.linExpInfo.expParam.integration_time;
			expinfo[0].normal_gain = g_ShmInfo.ExpResInfo.linExpInfo.expParam.analog_gain;
			/* The Second frame exp parameters */
			expinfo[1].normal_exp = g_ShmInfo.ExpResInfo.linExpInfo.expParam.integration_time;
			expinfo[1].normal_gain = g_ShmInfo.ExpResInfo.linExpInfo.expParam.analog_gain;
		}
		ao_record_service_info("rawreproc preinit [gain time] [%f %f]\n", expinfo[0].normal_exp, expinfo[0].normal_gain);
		sensor_entity_name = rk_aiq_uapi2_sysctl_rawReproc_preInit("rkisp1", "sc230ai", expinfo);
	} else {
		/* The First frame exp parameters */
		expinfo[0].normal_exp = 0.03;
		expinfo[0].normal_gain = 2.91;
		/* The Second frame exp parameters */
		expinfo[1].normal_exp = 0.03;
		expinfo[1].normal_gain = 2.91;
		sensor_entity_name = rk_aiq_uapi2_sysctl_rawReproc_preInit("rkisp1", "sc230ai", expinfo);
	}

	ao_record_service_info("sensor entity name [%s]\n", sensor_entity_name);
	info.width = g_width_align_16;
	info.height = g_height_align_8;
	info.format = g_pix_fmt;
	info.mode = RK_ISP_RKRAWSTREAM_MODE_OFFLINE;

	ao_record_service_dbg("rk_aiq_uapi2_sysctl_preInit_rkrawstream_info enter\n");
	rk_aiq_uapi2_sysctl_preInit_rkrawstream_info(sensor_entity_name, &info);
	ao_record_service_dbg("rk_aiq_uapi2_sysctl_init enter\n");
	g_aiq_ctx = rk_aiq_uapi2_sysctl_init(sensor_entity_name, iqpath, NULL, NULL);
	ao_record_service_dbg("rk_aiq_uapi2_sysctl_prepare enter\n");
	rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx, g_width_align_16, g_height_align_8, 0);
	ao_record_service_dbg("rk_aiq_uapi2_sysctl_start enter\n");
	rk_aiq_uapi2_sysctl_start(g_aiq_ctx);

	return 0;
}

static int venc_init(VENC_CTX_S *ctx)
{
	int32_t ret = 0;

	for (int i = 0; i < 2; i++) {
		ret = RK_MPI_VENC_CreateChn(ctx->chn[i].s32ChnId, &ctx->chn[i].stChnAttr);
		if (ret != 0) {
			ao_record_service_err("venc chn [%d] RK_MPI_VENC_CreateChn failed! ret [0x%08x]\n",
			ctx->chn[i].s32ChnId, ret);
			return ret;
		}
		ret = RK_MPI_VENC_SetChnRefBufShareAttr(ctx->chn[i].s32ChnId, &ctx->chn[i].stVencChnRefBufShare);
		if (ret != 0) {
			ao_record_service_err("venc chn [%d] RK_MPI_VENC_SetChnRefBufShareAttr failed! ret [0x%08x]\n",
			ctx->chn[i].s32ChnId, ret);
			return ret;
		}
		ret = RK_MPI_VENC_SetRcParam(ctx->chn[i].s32ChnId, &ctx->chn[i].stRcParam);
		if (ret != 0) {
			ao_record_service_err("venc chn [%d] RK_MPI_VENC_SetRcParam failed! ret [0x%08x]\n",
			ctx->chn[i].s32ChnId, ret);
			return ret;
		}
		ret = RK_MPI_VENC_EnableSvc(ctx->chn[i].s32ChnId, RK_TRUE);
		if (ret != 0) {
			ao_record_service_err("venc chn [%d] RK_MPI_VENC_EnableSvc failed! ret [0x%08x]\n",
			ctx->chn[i].s32ChnId, ret);
			return ret;
		}
		ret = RK_MPI_VENC_StartRecvFrame(ctx->chn[i].s32ChnId, &ctx->chn[i].stRecvParam);
		if (ret != 0) {
			ao_record_service_err("venc chn [%d] RK_MPI_VENC_StartRecvFrame failed! ret [0x%08x]\n",
			ctx->chn[i].s32ChnId, ret);
			return ret;
		}
	}

	return ret;
}

static int32_t venc_deinit(VENC_CTX_S *ctx)
{
	int32_t ret = 0;

	for (int i = 0; i < 2; i++) {
		ret = RK_MPI_VENC_StopRecvFrame(ctx->chn[i].s32ChnId);
		if (ret != 0) {
			ao_record_service_err("[%s] venc chn [%d] stop failed! ret [0x%08x]\n",
				__func__, ctx->chn[i].s32ChnId, ret);
			return ret;
		}
		ret = RK_MPI_VENC_DestroyChn(ctx->chn[i].s32ChnId);
		if (ret != 0) {
			ao_record_service_err("[%s] venc chn [%d] destory failed! ret [0x%08x]\n",
				__func__, ctx->chn[i].s32ChnId, ret);
			return ret;
		}
	}

	return ret;
}

static int32_t vi_bind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 1;
	stSrcChn.s32ChnId   = 0;

	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 1;

	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VI dev [1] chn [0] bind VENC dev [0] chn [1] failed! ret [0x%08x]\n", ret);

	return ret;
}

static int32_t vi_bind_vpss()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 1;
	stSrcChn.s32ChnId   = 1;

	stDestChn.enModId   = RK_ID_VPSS;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 0;

	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VI dev [1] chn [1] bind VPSS dev [0] chn [0] failed! ret [0x%08x]\n", ret);

	return ret;
}

static int32_t vpss_bind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VPSS;
	stSrcChn.s32DevId   = 0;
	stSrcChn.s32ChnId   = 0;

	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 2;

	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VPSS dev [0] chn [0] bind VENC dev [0] chn [2] failed! ret [0x%08x]\n", ret);

	return ret;
}


static int32_t vi_unbind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 1;
	stSrcChn.s32ChnId   = 0;

	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 1;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VI dev [1] chn [0] unbind VENC dev [0] chn [1] failed! ret [0x%08x]\n", ret);

	return ret;
}

static int32_t vpss_unbind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VPSS;
	stSrcChn.s32DevId   = 0;
	stSrcChn.s32ChnId   = 0;

	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 2;

	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VPSS dev [0] chn [0] unbind VENC dev [0] chn [2] failed! ret [0x%08x]\n", ret);

	return ret;
}


static int32_t vi_unbind_vpss()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 1;
	stSrcChn.s32ChnId   = 1;

	stDestChn.enModId   = RK_ID_VPSS;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 0;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_service_err("VI dev [1] chn [1] unbind VPSS dev [0] chn [0] failed! ret [0x%08x]\n", ret);

	return ret;
}

static int vpss_init(VPSS_CTX_S *ctx)
{
	int ret = 0, s32Grp = 0, VpssChn = 0;

	ret = RK_MPI_VPSS_CreateGrp(s32Grp, &ctx->stVpssGrpAttr);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("vpss grp [%d] RK_MPI_VPSS_CreateGrp failed! ret [0x%08x]\n", s32Grp);
		return ret;
	}

	ret = RK_MPI_VPSS_SetChnAttr(s32Grp, VpssChn, &ctx->stVpssChnAttr);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("vpss grp [%d] chn [%d] RK_MPI_VPSS_SetChnAttr failed! ret [0x%08x]\n", s32Grp, VpssChn);
		return ret;
	}

	ret = RK_MPI_VPSS_EnableChn(s32Grp, VpssChn);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("vpss grp [%d] chn [%d] RK_MPI_VPSS_EnableChn failed! ret [0x%08x]\n", s32Grp, VpssChn);
		return ret;
	}

	ret = RK_MPI_VPSS_StartGrp(s32Grp);
	if (ret != RK_SUCCESS) {
		ao_record_service_err("vpss grp [%d] RK_MPI_VPSS_StartGrp failed! ret [0x%08x]\n", s32Grp);
		return ret;
	}
	ret = RK_MPI_VPSS_ResetGrp(s32Grp);

	if (ret != RK_SUCCESS) {
		ao_record_service_err("vpss grp [%d] RK_MPI_VPSS_StartGrp failed! ret [0x%08x]\n", s32Grp);
		return ret;
	}

	return ret;
}

static void mpi_params_init(MPI_CTX_S *ctx)
{
	uint32_t VpssBufCnt = 2, ViBufCnt = 2, VencBufCnt = 4;

	if (g_PreRecordInfo.width % 16 || g_PreRecordInfo.height % 8) {
		g_width_align_16 = g_PreRecordInfo.width / 16 * 16;
		g_height_align_8 = g_PreRecordInfo.height / 8 * 8;
		ao_record_service_info("image width is aligned to 16, height is aligned to 8\n");
		ao_record_service_info("width [%d] height [%d] width_align [%d] height_align [%d]\n", g_PreRecordInfo.width, g_PreRecordInfo.height, g_width_align_16, g_height_align_8);
	}

	/* vi params init */
	ctx->vi.dev[0].dev_id = 1;
	ctx->vi.pipe[0].pipe_id = 1;
	ctx->vi.pipe[0].stPipeAttr.u32MaxW = g_width_align_16;
	ctx->vi.pipe[0].stPipeAttr.u32MaxH = g_height_align_8;
	ctx->vi.pipe[0].stPipeAttr.enPixFmt = g_rgb_bayer_fmt;
	ctx->vi.pipe[0].stPipeAttr.enMemMode = VI_RAW_MEM_COMPACT;
	ctx->vi.pipe[0].stPipeAttr.enHdrMode = (VI_HDR_MODE_E)g_hdr_mode;
	for (int i = 0; i < 2; i++) {
		ctx->vi.dev[0].chn[i].chn_id = i;
		ctx->vi.dev[0].chn[i].stChnAttr.stSize.u32Width  = g_width_align_16;
		ctx->vi.dev[0].chn[i].stChnAttr.stSize.u32Height = g_height_align_8;
		ctx->vi.dev[0].chn[i].stChnAttr.enCompressMode   = COMPRESS_MODE_NONE;
		ctx->vi.dev[0].chn[i].stChnAttr.bMirror          = 0;
		ctx->vi.dev[0].chn[i].stChnAttr.bFlip            = 0;
		ctx->vi.dev[0].chn[i].stChnAttr.stIspOpt.stMaxSize.u32Width  = g_width_align_16;
		ctx->vi.dev[0].chn[i].stChnAttr.stIspOpt.stMaxSize.u32Height = g_height_align_8;
		ctx->vi.dev[0].chn[i].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
		ctx->vi.dev[0].chn[i].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
		ctx->vi.dev[0].chn[i].stChnAttr.stFrameRate.s32DstFrameRate = -1;
		ctx->vi.dev[0].chn[i].stChnAttr.stIspOpt.u32BufCount = ViBufCnt;
		ctx->vi.dev[0].chn[i].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
		ctx->vi.dev[0].chn[i].stChnAttr.u32Depth = 1;
	}

	/* venc params init */
	int32_t ret = 0, fps = 15, gop = 1;
	uint32_t venc_bitrate = 1200;
	uint32_t enCodecType = RK_VIDEO_ID_AVC;
	// uint32_t enCodecType = RK_VIDEO_ID_HEVC;

	ctx->venc.chn[0].u32Width = g_width_align_16;
	ctx->venc.chn[0].u32Height = g_height_align_8;
	ctx->venc.chn[1].u32Width = g_dst_width;
	ctx->venc.chn[1].u32Height = g_dst_height;
	for (int i = 0; i < 2; i++) {
		ctx->venc.chn[i].s32ChnId = i + 1;
		if (enCodecType == RK_VIDEO_ID_AVC) {
			ctx->venc.chn[i].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H264VBR;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32BitRate = venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate = venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32MinBitRate = 200;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32Gop = gop;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateDen = 1;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateDen = 1;
		} else if (enCodecType == RK_VIDEO_ID_HEVC) {
			ctx->venc.chn[i].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H265VBR;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32BitRate = venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate = venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32MinBitRate = 200;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32Gop = gop;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateDen = 1;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateDen = 1;
		}

		ctx->venc.chn[i].stChnAttr.stVencAttr.enType = enCodecType;
		ctx->venc.chn[i].stChnAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;
		if (ctx->venc.chn[i].enCodecType == RK_VIDEO_ID_AVC)
			ctx->venc.chn[i].stChnAttr.stVencAttr.u32Profile = H264E_PROFILE_HIGH;
		else if (ctx->venc.chn[i].enCodecType == RK_VIDEO_ID_HEVC)
			ctx->venc.chn[i].stChnAttr.stVencAttr.u32Profile = H265E_PROFILE_MAIN;

		ctx->venc.chn[i].stChnAttr.stVencAttr.u32PicWidth = ctx->venc.chn[i].u32Width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32PicHeight = ctx->venc.chn[i].u32Height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32VirWidth = ctx->venc.chn[i].u32Width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32VirHeight = ctx->venc.chn[i].u32Height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32MaxPicWidth = ctx->venc.chn[i].u32Width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32MaxPicHeight = ctx->venc.chn[i].u32Height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32BufSize = ctx->venc.chn[i].u32Width * ctx->venc.chn[i].u32Height / 2;

		ctx->venc.chn[i].stChnAttr.stVencAttr.u32StreamBufCnt = VencBufCnt;
		ctx->venc.chn[i].stChnAttr.stVencAttr.enMirror = MIRROR_NONE;

		ctx->venc.chn[i].stVencChnRefBufShare.bEnable = true;

		if (ctx->venc.chn[i].enCodecType == RK_VIDEO_ID_AVC) {
			ctx->venc.chn[i].stRcParam.s32FirstFrameStartQp = 28;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MinQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MaxQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MinIQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MaxIQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMinQp = 25;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMinIQp = 24;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMaxQp = 41;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMaxIQp = 35;
		} else if (ctx->venc.chn[i].enCodecType == RK_VIDEO_ID_HEVC) {
			ctx->venc.chn[i].stRcParam.s32FirstFrameStartQp = 28;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MinQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MaxQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MinIQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MaxIQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMinQp = 25;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMinIQp = 24;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMaxQp = 41;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMaxIQp = 35;
		}

		ctx->venc.chn[i].stRecvParam.s32RecvPicNum = -1;
	}

	/* VPSS parameters init Start */
	ctx->vpss.u32DstWidth = g_dst_width;
	ctx->vpss.u32DstHeight = g_dst_height;
	ctx->vpss.u32SrcWidth = g_width_align_16;
	ctx->vpss.u32SrcHeight = g_height_align_8;
	ctx->vpss.stVpssGrpAttr.u32MaxW = 4096; // unused
	ctx->vpss.stVpssGrpAttr.u32MaxH = 4096; // unused
	ctx->vpss.stVpssGrpAttr.enPixelFormat = RK_FMT_YUV420SP; // unused
	ctx->vpss.stVpssGrpAttr.enCompressMode = COMPRESS_MODE_NONE; // unused
	ctx->vpss.stVpssGrpAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vpss.stVpssGrpAttr.stFrameRate.s32DstFrameRate = -1;

	ctx->vpss.stVpssChnAttr.enChnMode = VPSS_CHN_MODE_USER;
	ctx->vpss.stVpssChnAttr.enDynamicRange = DYNAMIC_RANGE_SDR8; // unused
	ctx->vpss.stVpssChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vpss.stVpssChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vpss.stVpssChnAttr.stFrameRate.s32DstFrameRate = -1;
	ctx->vpss.stVpssChnAttr.u32Width = ctx->vpss.u32DstWidth;
	ctx->vpss.stVpssChnAttr.u32Height = ctx->vpss.u32DstHeight;
	ctx->vpss.stVpssChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vpss.stVpssChnAttr.u32Depth = 1;
	ctx->vpss.stVpssChnAttr.bFlip = false;
	ctx->vpss.stVpssChnAttr.bMirror = false;
	ctx->vpss.stVpssChnAttr.u32FrameBufCnt = VpssBufCnt;
}

static void psram_init(void)
{
	writel(0x01000000, 0x20080300);
	writel(0x70070000, 0x20080800);
	writel(0x80000, 0x201B0804);
	writel(0x80000, 0x201C0804);
	writel(0x0fff0444, 0x201B0000);
	writel(0x0fff0444, 0x201B0004);
	writel(0x3f3f0000, 0x201B0200);
	writel(0x3f3f0101, 0x201B0100);
	writel(0x003f0001, 0x201B0104);
	writel(0x3f3f0101, 0x201B0108);
	writel(0x003f0001, 0x201B010c);
	writel(0x00660066, 0x201B0300);
	writel(0x00660066, 0x201B0400);
	writel(0, 0x205C005c);
	writel(2, 0x205C0000);
	writel(0x1004023, 0x205C0034);
	writel(0x35, 0x205C0100);
	writel(0x2a02, 0x205C0000);
	writel(0x72a0, 0x205C0058);
	writel(0x46eb, 0x205C0054);
	writel(0x4038, 0x205C0050);
	writel(1, 0x205C005c);
}

static void* mmap_memory_to_viraddr(off_t phy_addr, size_t size)
{
	void *vir_addr, *vir_addr_align_4k;
	int mem_fd, vir_addr_offset;

	if((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0)
	{
		ao_record_service_err("Open [/dev/mem] failed! reason[%s]\n", strerror(errno));
		exit(-1);
	}

	vir_addr_align_4k = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phy_addr);
	vir_addr_offset = phy_addr & MMAP_MASK;
	vir_addr = vir_addr_align_4k + vir_addr_offset;

	close(mem_fd);
	return vir_addr;
}

static void *muxer_proc_thread(void *arg)
{
	int ret = 0, loopCount = 0, MuxerId = 0;
	const char *OutputFmt = "mp4";
	char NormalMuxerFilePath[128] = "";
	char PreRecordMuxerFilePath[128] = "";
	char Mp4FilePath[128] = "";
	VideoParam stVideo = {0};
	MUXER_BUF_CELL_S cell = {0};
	uint32_t filesize = 0, bit_rate = 2000, pts_interval = 0;
	bool muxer_proc_thread_quit = 0;
	FILE *fp = NULL;

	sprintf(NormalMuxerFilePath, "%sNormal_Muxer.bin", g_RecordFilePath);
	sprintf(PreRecordMuxerFilePath, "%sPre-Record_Muxer.bin", g_RecordFilePath);
	sprintf(Mp4FilePath, "%sRecord.mp4", g_RecordFilePath);

	switch (g_PreRecordInfo.fps) {
		case PRE_RECORD_FPS_1:
			pts_interval = 1000000 / PRE_RECORD_FPS_1;
			break;
		case PRE_RECORD_FPS_2:
			pts_interval = 1000000 / PRE_RECORD_FPS_2;
			break;
		case PRE_RECORD_FPS_3:
			pts_interval = 1000000 / PRE_RECORD_FPS_3;
			break;
		case PRE_RECORD_FPS_4:
			pts_interval = 1000000 / PRE_RECORD_FPS_4;
			break;
		case PRE_RECORD_FPS_5:
			pts_interval = 1000000 / PRE_RECORD_FPS_5;
			break;
		default:
			ao_record_service_info("warming unsupport Pre-Record fps\n");
			break;
	}
	stVideo.width = g_dst_width;
	stVideo.height = g_dst_height;
	stVideo.bit_rate = bit_rate;
	stVideo.frame_rate_den = 1;
	stVideo.frame_rate_num = 15;
	stVideo.profile = H264E_PROFILE_HIGH;
	stVideo.level = 41;
	stVideo.frag_keyframe = 0;
	memcpy(stVideo.codec, "H.264", strlen("H.264"));
	ret = rkmuxer_init(MuxerId,
			   (char *)OutputFmt,
			   Mp4FilePath, &stVideo,
			   NULL);
	if (ret) {
		ao_record_service_err("rkmuxer_init[%d] failed! ret [0x%08x]\n", MuxerId, ret);
		exit(1);
	}
	ao_record_service_dbg("rkmuxer_init success\n");

	while (!muxer_proc_thread_quit) {
		if (!g_ShareMemory->is_write_file_end || !g_process_end) {
			usleep(1000000);
			continue;
		}

		sprintf(g_cmd, "cp /mnt/sdcard/venc0_with_head.bin %sNormal_Muxer.bin", g_RecordFilePath);
		execute_cmd(g_cmd);
		execute_cmd("sync");

		/* Pre-Record process */
		fp = fopen(PreRecordMuxerFilePath, "rb");
		if (fp == NULL) {
			ao_record_service_err("open file %s failed! reason [%s]\n", PreRecordMuxerFilePath, strerror(errno));
			exit(-1);
		}
		fseek(fp, 0, SEEK_END);
		filesize = ftell(fp);
		ao_record_service_info("[Pre-Record mode] The %s file size is %d\n", PreRecordMuxerFilePath, filesize);
		fseek(fp, 0, SEEK_SET);
		cell.buf = malloc(g_max_frame_size);
		memset(&g_PreRecordHeadInfo, 0, sizeof(StreamPacketHead_S));
		while (g_PreRecordHeadInfo.frame_next_addr < filesize) {
			/* Read header for muxer */
			ret = fread(&g_PreRecordHeadInfo, 1 , sizeof(StreamPacketHead_S), fp);
			if (ret != sizeof(StreamPacketHead_S)) {
				ao_record_service_err("read file %s size [%d] failed! reason [%s]\n",
						      PreRecordMuxerFilePath, sizeof(StreamPacketHead_S), strerror(errno));
				exit(1);
			}
			ao_record_service_dbg("[Pre-Record mode] frame_size [%d] cur_addr [%d], next_addr [%d]\n",
					      g_PreRecordHeadInfo.frame_size,
					      g_PreRecordHeadInfo.frame_cur_addr,
					      g_PreRecordHeadInfo.frame_next_addr);

			/* Read Pre-Record stream to Muxer buffer */
			ret = fread(cell.buf, 1, g_PreRecordHeadInfo.frame_size, fp);
			if (ret != g_PreRecordHeadInfo.frame_size) {
				ao_record_service_err("read file %s size [%d] failed! reason [%s]\n",
						      PreRecordMuxerFilePath, g_PreRecordHeadInfo.frame_size, strerror(errno));
				exit(1);
			}
			cell.size = g_PreRecordHeadInfo.frame_size;
			cell.pts = loopCount * pts_interval;
			cell.isKeyFrame = 1;
			ao_record_service_info("[Pre-Record mode] Muxer id [%d] loopCount [%d] buf [%p] size [%d] key [%d] pts [%ld] \n",
					       MuxerId, loopCount, cell.buf, cell.size, cell.isKeyFrame, cell.pts);

			/*
			 * When the rkmuxer deinit, then all data in the buf will be processed and save to dstFile
			 * isKeyFrame: The frame is I frame or not
			 */
			ret = rkmuxer_write_video_frame(MuxerId, cell.buf,
							cell.size, cell.pts, cell.isKeyFrame);
			if (ret) {
				ao_record_service_err("[Pre-Record mode] Muxer[%d] write failed! ret [0x%08x]\n", MuxerId, ret);
			}
			loopCount++;
		}

		/* Normal process */
		fp = fopen(NormalMuxerFilePath, "rb");
		if (fp == NULL) {
			ao_record_service_err("open file %s failed! reason [%s]\n", NormalMuxerFilePath, strerror(errno));
			exit(-1);
		}
		fseek(fp, 0, SEEK_END);
		filesize = ftell(fp);
		ao_record_service_info("[Normal mode] The %s file size is %d\n", NormalMuxerFilePath, filesize);
		fseek(fp, 0, SEEK_SET);
		cell.buf = malloc(g_ShareMemory->max_frame_size);
		while (g_NormalHeadInfo.frame_next_addr < filesize) {
			/* Read header for muxer */
			ret = fread(&g_NormalHeadInfo, 1 , sizeof(StreamPacketHead_S), fp);
			if (ret != sizeof(StreamPacketHead_S)) {
				ao_record_service_err("read file %s size [%d] failed! reason [%s]\n",
						      NormalMuxerFilePath, sizeof(StreamPacketHead_S), strerror(errno));
				exit(1);
			}
			ao_record_service_dbg("[Normal mode] frame_size [%d] cur_addr [%d], next_addr [%d]\n",
					      g_NormalHeadInfo.frame_size,
					      g_NormalHeadInfo.frame_cur_addr,
					      g_NormalHeadInfo.frame_next_addr);

			/* Read Normal stream to Muxer buffer */
			ret = fread(cell.buf, 1, g_NormalHeadInfo.frame_size, fp);
			if (ret != g_NormalHeadInfo.frame_size) {
				ao_record_service_err("read file %s size [%d] failed! reason [%s]\n",
						      NormalMuxerFilePath, g_NormalHeadInfo.frame_size, strerror(errno));
				exit(1);
			}
			cell.size = g_NormalHeadInfo.frame_size;
			cell.pts = loopCount * 66000;
			if ((loopCount - 1) % 30 == 0) { //todo get gop in this case gop is 30
				cell.isKeyFrame = 1;
			} else {
				cell.isKeyFrame = 0;
			}
			if (loopCount == 0)
				cell.isKeyFrame = 1;
			ao_record_service_info("[Normal mode] Muxer id [%d] loopCount [%d] buf [%p] size [%d] key [%d] pts [%ld] \n",
					       MuxerId, loopCount, cell.buf, cell.size, cell.isKeyFrame, cell.pts);
			ret = rkmuxer_write_video_frame(MuxerId, cell.buf,
							cell.size, cell.pts, cell.isKeyFrame);
			if (ret) {
				ao_record_service_err("[Normal mode] Muxer[%d] write failed! ret [0x%08x]\n", MuxerId, ret);
			}
			loopCount++;
		}
		rkmuxer_deinit(MuxerId);
		if (cell.buf)
			free(cell.buf);
		if (fp)
			fclose(fp);

		if (g_ShareMemory->is_write_file_end && g_process_end) {
			muxer_proc_thread_quit = 1;
		}
	}
}

static void* get_meta_params(struct meta_info *handle) {
	int app_param_offset, meta_size;
	off_t metaAddr;
	void *metaVirmem = NULL, *appVirAddr = NULL, *SensorInitVirAddr;
	struct app_param_info *AppParam = NULL;
	struct sensor_init_cfg *SensorInitParam = NULL;

	meta_size = (int)get_cmd_val("meta_part_size", 16);
	metaAddr = (off_t)get_cmd_val("meta_load_addr", 16);

	metaVirmem = mmap_memory_to_viraddr(metaAddr, (size_t)meta_size);
	if (metaVirmem != MAP_FAILED) {
		SensorInitVirAddr = metaVirmem + SENSOR_INIT_OFFSET;
		handle->sensor_init = *(struct sensor_init_cfg *)(SensorInitVirAddr);

		app_param_offset = (int)get_cmd_val(RK_APP_PARAM_OFFSET, 16);
		appVirAddr = metaVirmem + app_param_offset;
		handle->app_params = *(struct app_param_info *)(appVirAddr);

		return metaVirmem;
	} else {
		ao_record_service_err("meta addr mmap fail\n");
		return metaVirmem;
	}
}

static void exposure_convert(uint32_t reg_time, uint32_t reg_gain)
{
	ao_record_service_info("reg gain [0x%08x] time [0x%08x]\n", reg_gain, reg_time);
	/* gain */
	float dbUnit = 0.094;
	g_real_gain = pow(10, (float)reg_gain * dbUnit / 20.0f);
	/* time
	 * real_time = (reg_time - C0 * vts - C1) / C2 * hts / pclk / 1000000
	 * pclk(MHz) = vts * hts * fps (rtt MainAIQ value)
	 * vts * fps = pclk / hts = constant value so use vts * fps
	 */
	float timeC0 = 0; //float timeC0 = pConfig->stSensorInfo.Time2Reg.fCoeff[0];
	float timeC1 = 0; //float timeC1 = pConfig->stSensorInfo.Time2Reg.fCoeff[1];
	float timeC2 = 1; //float timeC2 = pConfig->stSensorInfo.Time2Reg.fCoeff[2];
	// float timeC3 = pConfig->stSensorInfo.Time2Reg.fCoeff[3];
	//g_real_time = (((float)reg_time - 0.0 * 3200.0 - 0.0) / 1.0 /*- timeC3*/) *
	//		3000.0 / (5.0 * 3000.0 * 3200.0);
	g_real_time = (float)reg_time / (5.0 * 6668.0);
	ao_record_service_info("real [time gain] [%f %f]\n", g_real_time, g_real_gain);
}

static void ShareMemoryInit(void)
{
	key_t key;
	int shmid;
	char KeyPath[30] = "";

	sprintf(KeyPath, "/tmp/");
	// Get the descriptor of share memory
	key = ftok(KeyPath, 0x03);
	if (key == -1) {
		ao_record_service_err("key ftok error! reason [%s]\n", strerror(errno));
		exit(-1);
	}
	ao_record_service_dbg("key %d keypath %s\n", key, KeyPath);
	// Create share memory
	shmid = shmget(key, SHARE_MEMORY_BUF_SIZE, IPC_CREAT | 0666);
	if (shmid == -1) {
		ao_record_service_err("shmget failed! key [%d] keypath %s reason [%s]\n", key, KeyPath, strerror(errno));
		exit(-1);
	}
	// Link share memory to effective address
	g_ShareMemory = (ShmInfo_S *)shmat(shmid, 0, 0);
}

static void CreateDir(void)
{
	uint32_t power_on_seq = 0;
	int32_t ret = 0;

	while (1) {
		power_on_seq++;
		sprintf(g_YuvFilePath, "/mnt/sdcard/%d/yuv/", power_on_seq);
		if(!access(g_YuvFilePath, F_OK)) {
			continue;
		}
		sprintf(g_RawFilePath, "/mnt/sdcard/%d/raw/", power_on_seq);
		if(!access(g_RawFilePath, F_OK)) {
			continue;
		}
		sprintf(g_RecordFilePath, "/mnt/sdcard/%d/record/", power_on_seq);
		if(!access(g_RecordFilePath, F_OK)) {
			continue;
		}

		ret = mkdirs(g_YuvFilePath);
		if (ret) {
			ao_record_service_err("mkdir %s error! reason [%s]\n", g_YuvFilePath, strerror(errno));
			exit(1);
		}
		ret = mkdirs(g_RawFilePath);
		if (ret) {
			ao_record_service_err("mkdir %s error! reason [%s]\n", g_RawFilePath, strerror(errno));
			exit(1);
		}
		ret = mkdirs(g_RecordFilePath);
		if (ret) {
			ao_record_service_err("mkdir %s error! reason [%s]\n", g_RecordFilePath, strerror(errno));
			exit(1);
		}
		ao_record_service_dbg("power on seq %d\n", power_on_seq);
		break;
	}
}

static void GetPreRecordInfo(PreRecordInfo_S *PreRecordInfo)
{
	AMP_SHM_S *ImageInfo = NULL;

	ImageInfo = malloc(sizeof(AMP_SHM_S));
	read_mem(0x210FFF80, (char *)ImageInfo, sizeof(AMP_SHM_S));

	if (ImageInfo->log_magic != 0xdeadbeef) {
		ao_record_service_err("invalid psram data! exit\n");
		exit(-1);
	}

	PreRecordInfo->spi2ahb_success = ImageInfo->spi2ahb_success;
	PreRecordInfo->spi2ahb_error = ImageInfo->spi2ahb_error;
	PreRecordInfo->fps = ImageInfo->ctrl.fps;
	PreRecordInfo->width = ImageInfo->pr_frame.width;
	PreRecordInfo->height = ImageInfo->pr_frame.height;
	PreRecordInfo->sink_start_addr = ImageInfo->sink_start_addr;

	if (PreRecordInfo->spi2ahb_success <= MAX_PSRAM_FRAMES_COUNT) {
		PreRecordInfo->raw_frames_count = PreRecordInfo->spi2ahb_success;
	} else {
		PreRecordInfo->raw_frames_count = MAX_PSRAM_FRAMES_COUNT;
		PreRecordInfo->raw_frames_start_seq = PreRecordInfo->spi2ahb_success % MAX_PSRAM_FRAMES_COUNT;
	}
	ao_record_service_info("[spi2ahb_success spi2ahb_error raw_frames_count] [%d %d]\n",
			       PreRecordInfo->spi2ahb_success, PreRecordInfo->spi2ahb_error);
	ao_record_service_info("[width height fps] [%d %d %d]\n",
			       PreRecordInfo->width, PreRecordInfo->height, PreRecordInfo->fps);
	ao_record_service_info("[raw_frames_count raw_frames_start_seq] [%d %d]\n",
			       PreRecordInfo->raw_frames_count, PreRecordInfo->raw_frames_start_seq);
	if (PreRecordInfo->spi2ahb_success == 0) {
		ao_record_service_err("No data in psram! exit\n");
		exit(-1);
	}
	if (ImageInfo != NULL)
		free(ImageInfo);
}

static void offline_aiq_stop()
{
	rk_aiq_uapi2_sysctl_stop(g_aiq_ctx, false);
	rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx);
}

int main(int argc, char **argv) {
	int32_t ret;
	void *metaVirmem = NULL;;
	MPI_CTX_S ctx = {0};
	uint32_t meta_size = 0;

	struct meta_info handle = {0};

	long long t_init_start = 0, t_data_process_start = 0, t_process_start = 0;
	long long t_init_end = 0, t_data_process_end = 0, t_process_end = 0;

	t_init_start = getCurrentTimeUs();
	t_process_start = getCurrentTimeUs();

	/*
	 * Use 4kbytes share memory to transfer message between ao_record_demo and ao_record_service
	 *
	 * The information is show as follows:
	 * 1. The ISP parameters of first frame in full resolution mode
	 *    [r gr gb b] wbgain
	 *    [gain time] exp
	 * 2. max frame size for muxer process
	 * 3. file process end descriptor in ao_record_demo to assure the muxer process after all frames
	 *    have been processed and writed to file
	 */
	ShareMemoryInit();

	psram_init();

	GetPreRecordInfo(&g_PreRecordInfo);

	/* get the last pre record frame's exposure info from meta */
	meta_size = (uint32_t)get_cmd_val("meta_part_size", 16);
	metaVirmem = get_meta_params(&handle);
	if (metaVirmem == MAP_FAILED) {
		ao_record_service_err("get_meta_params failed! metaVirmem addr [%p]\n", metaVirmem);
		goto __FAILED;
	}
	exposure_convert(handle.app_params.pr_exp_time, handle.app_params.pr_exp_gain);

	CreateDir();

	mpi_params_init(&ctx);

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}
	offline_aiq_start();
	ao_record_service_dbg("offline_aiq_start successful\n");
	ret = vi_offline_init(&ctx.vi);
	if (ret) {
		ao_record_service_err("vi init failed! ret [0x%08x]\n", ret);
		return -1;
	}
	ao_record_service_dbg("vi_offline_init successful\n");
	ret = venc_init(&ctx.venc);
	if (ret) {
		ao_record_service_err("venc init failed! ret [0x%08x]\n", ret);
		return -1;
	}
	ao_record_service_info("venc_init successful\n");
	ret = vi_bind_venc();
	if (ret) {
		ao_record_service_err("VI dev 0 chn 0 bind VENC dev 0 chn 0 failed! ret [0x%08x]\n", ret);
		return -1;
	}

	if (g_rga_en) {
		ret = vpss_init(&ctx.vpss);
		if (ret) {
			ao_record_service_err("vpss init failed! ret [0x%08x]\n", ret);
			return -1;
		}
		ret = vi_bind_vpss();
		if (ret) {
			ao_record_service_err("VI dev 0 chn 0 bind VPSS grp 0 chn 0 failed! ret [0x%08x]\n", ret);
			return -1;
		}
		ret = vpss_bind_venc();
		if (ret) {
			ao_record_service_err("VPSS grp 0 chn 0 bind VENC dev 0 chn 0 failed! ret [0x%08x]\n", ret);
			return -1;
		}
	}
	rgn_init();

	t_init_end = getCurrentTimeUs();
	ao_record_service_info("Module initialization time [%f]ms\n", (t_init_end - t_init_start) / 1000.f);
	t_data_process_start = getCurrentTimeUs();

	pthread_t RawProcess;
	pthread_create(&RawProcess, RK_NULL, send_raw_frame_thread, NULL);

	/* get yuv frame for sr process or debug */
	//pthread_t GetYuvFrame;
	//pthread_create(&GetYuvFrame, RK_NULL, get_yuv_frame_thread, NULL);

	pthread_t GetPreRecordSmallStream;
	pthread_create(&GetPreRecordSmallStream, RK_NULL, get_pre_record_small_stream_thread, NULL);

	pthread_t GetPreRecordLargeStream;
	if (g_rga_en)
		pthread_create(&GetPreRecordLargeStream, RK_NULL, get_pre_record_large_stream_thread, NULL);

	pthread_t MuxerProc;
	pthread_create(&MuxerProc, RK_NULL, muxer_proc_thread, NULL);

	pthread_join(RawProcess, RK_NULL);
	//pthread_join(GetYuvFrame, RK_NULL);
	pthread_join(GetPreRecordSmallStream, RK_NULL);
	if (g_rga_en)
		pthread_join(GetPreRecordLargeStream, RK_NULL);
	pthread_join(MuxerProc, RK_NULL);

	t_data_process_end = getCurrentTimeUs();
	ao_record_service_info("The image process cost time [%f]ms\n", (t_data_process_end - t_data_process_start) / 1000.f);
	t_process_end = getCurrentTimeUs();
	ao_record_service_info("The whole process ao_record_service cost time [%f]ms\n", (t_process_end - t_process_start) / 1000.f);
	sprintf(g_cmd, "cp /mnt/sdcard/venc0.bin %sNormal_Large_Video.bin", g_RecordFilePath);
	execute_cmd(g_cmd);
	sprintf(g_cmd, "cat %sPre-Record_Large_Video.bin %sNormal_Large_Video.bin > %sFull_Video.bin",
		g_RecordFilePath, g_RecordFilePath, g_RecordFilePath);
	execute_cmd(g_cmd);
	execute_cmd("sync");

	/*
	 * Pre-record and full resolution image have been processed
	 * could remove sd card to view record
	 */
	execute_cmd(" /usr/bin/tinyplay /oem/usr/share/image_process_end_2ch.wav -D 0 -d 0");

__FAILED:
	if (g_rga_en) {
		vi_unbind_vpss();
		vpss_unbind_venc();
		vpss_deinit();
	}
	ret = vi_unbind_venc();
	if (ret) {
		ao_record_service_err("vi_unbind_venc failed! ret [0x%08x]\n", ret);
		return ret;
	}
	ret = venc_deinit(&ctx.venc);
	if (ret) {
		ao_record_service_err("venc_deinit failed! ret [0x%08x]\n", ret);
		return ret;
	}
	ret = vi_offline_deinit(&ctx.vi);
	if (ret) {
		ao_record_service_err("vi_deinit failed! ret [0x%08x]\n", ret);
		return ret;
	}

	offline_aiq_stop();

	if (metaVirmem != MAP_FAILED)
		munmap(metaVirmem, meta_size);
	ao_record_service_info("main service exit main\n");
	return 0;
}
