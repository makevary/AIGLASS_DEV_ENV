#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <pthread.h>
#include <signal.h>
#include <stdbool.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/poll.h>
#include <time.h>
#include <unistd.h>

#include "rk_debug.h"
#include "rk_defines.h"
#include "rk_mpi_adec.h"
#include "rk_mpi_aenc.h"
#include "rk_mpi_ai.h"
#include "rk_mpi_ao.h"
#include "rk_mpi_avs.h"
#include "rk_mpi_cal.h"
#include "rk_mpi_ivs.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_rgn.h"
#include "rk_mpi_sys.h"
#include "rk_mpi_tde.h"
#include "rk_mpi_vdec.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vi.h"
#include "rk_mpi_vo.h"
#include "rk_mpi_avs.h"

#define CHN1_WIDTH 1280
#define CHN1_HEIGHT 360

static FILE *venc0_file;
static FILE *venc1_file;
static bool quit = false;
static RK_S32 g_s32FrameCnt = -1;
static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

RK_U64 TEST_COMM_GetNowUs() {
	struct timespec time = {0, 0};
	clock_gettime(CLOCK_MONOTONIC, &time);
	return (RK_U64)time.tv_sec * 1000000 + (RK_U64)time.tv_nsec / 1000; /* microseconds */
}

static void *GetMediaBuffer0(void *arg) {
	(void)arg;
	printf("========%s========\n", __func__);
	void *pData = RK_NULL;
	int loopCount = 0;
	int s32Ret;

	VENC_STREAM_S stFrame;
	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	while (!quit) {
		s32Ret = RK_MPI_VENC_GetStream(0, &stFrame, -1);
		if (s32Ret == RK_SUCCESS) {
			if (venc0_file) {
				pData = RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
				fwrite(pData, 1, stFrame.pstPack->u32Len, venc0_file);
				fflush(venc0_file);
			}
			RK_U64 nowUs = TEST_COMM_GetNowUs();

			RK_LOGD("chn:0, loopCount:%d enc->seq:%d wd:%d pts=%lld delay=%lldus\n",
				loopCount, stFrame.u32Seq, stFrame.pstPack->u32Len,
				stFrame.pstPack->u64PTS, nowUs - stFrame.pstPack->u64PTS);

			s32Ret = RK_MPI_VENC_ReleaseStream(0, &stFrame);
			if (s32Ret != RK_SUCCESS) {
				RK_LOGE("RK_MPI_VENC_ReleaseStream fail %x", s32Ret);
			}
			loopCount++;
		} else {
			RK_LOGE("RK_MPI_VENC_GetChnFrame fail %x", s32Ret);
		}

		if ((g_s32FrameCnt >= 0) && (loopCount > g_s32FrameCnt))
			quit = true;
	}

	if (venc0_file)
		fclose(venc0_file);

	free(stFrame.pstPack);
	return NULL;
}

static void *GetMediaBuffer1(void *arg) {
	(void)arg;
	printf("========%s========\n", __func__);
	void *pData = RK_NULL;
	int loopCount = 0;
	int s32Ret;

	VENC_STREAM_S stFrame;
	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	while (!quit) {
		s32Ret = RK_MPI_VENC_GetStream(1, &stFrame, 1000);
		if (s32Ret == RK_SUCCESS) {
			if (venc1_file) {
				pData = RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
				fwrite(pData, 1, stFrame.pstPack->u32Len, venc1_file);
				fflush(venc1_file);
			}
			RK_U64 nowUs = TEST_COMM_GetNowUs();

			RK_LOGD("chn:1, loopCount:%d enc->seq:%d wd:%d pts=%lld delay=%lldus\n",
				loopCount, stFrame.u32Seq, stFrame.pstPack->u32Len,
				stFrame.pstPack->u64PTS, nowUs - stFrame.pstPack->u64PTS);

			s32Ret = RK_MPI_VENC_ReleaseStream(1, &stFrame);
			if (s32Ret != RK_SUCCESS) {
				RK_LOGE("RK_MPI_VENC_ReleaseStream fail %x", s32Ret);
			}
			loopCount++;
		} else {
			RK_LOGE("RK_MPI_VENC_GetChnFrame fail %x", s32Ret);
		}
	}

	if (venc1_file)
		fclose(venc1_file);

	free(stFrame.pstPack);
	return NULL;
}

static RK_S32 test_venc_init(int chnId, int width, int height, RK_CODEC_ID_E enType) {
	printf("================================%s==================================\n",
	       __func__);
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_ATTR_S stAttr;
	memset(&stAttr, 0, sizeof(VENC_CHN_ATTR_S));

	stAttr.stVencAttr.enType = enType;
	stAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;
	stAttr.stRcAttr.enRcMode = VENC_RC_MODE_H264CBR;
	stAttr.stRcAttr.stH264Cbr.u32BitRate = 10 * 1024;
	stAttr.stRcAttr.stH264Cbr.u32Gop = 60;
	stAttr.stVencAttr.u32PicWidth = width;
	stAttr.stVencAttr.u32PicHeight = height;
	stAttr.stVencAttr.u32VirWidth = width;
	stAttr.stVencAttr.u32VirHeight = height;
	stAttr.stVencAttr.u32StreamBufCnt = 2;
	stAttr.stVencAttr.u32BufSize = width * height * 3 / 2;

	RK_MPI_VENC_CreateChn(chnId, &stAttr);

	memset(&stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
	stRecvParam.s32RecvPicNum = -1;
	RK_MPI_VENC_StartRecvFrame(chnId, &stRecvParam);

	return 0;
}

int vi_dev_init() {
	printf("%s\n", __func__);
	int ret = 0;
	int devId = 0;
	int pipeId = devId;

	VI_DEV_ATTR_S stDevAttr;
	VI_DEV_BIND_PIPE_S stBindPipe;
	memset(&stDevAttr, 0, sizeof(stDevAttr));
	memset(&stBindPipe, 0, sizeof(stBindPipe));
	// 0. get dev config status
	ret = RK_MPI_VI_GetDevAttr(devId, &stDevAttr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		// 0-1.config dev
		ret = RK_MPI_VI_SetDevAttr(devId, &stDevAttr);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_SetDevAttr %x\n", ret);
			return -1;
		}
	} else {
		printf("RK_MPI_VI_SetDevAttr already\n");
	}
	// 1.get dev enable status
	ret = RK_MPI_VI_GetDevIsEnable(devId);
	if (ret != RK_SUCCESS) {
		// 1-2.enable dev
		ret = RK_MPI_VI_EnableDev(devId);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_EnableDev %x\n", ret);
			return -1;
		}
		// 1-3.bind dev/pipe
		stBindPipe.u32Num = 1;
		stBindPipe.PipeId[0] = pipeId;
		ret = RK_MPI_VI_SetDevBindPipe(devId, &stBindPipe);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_SetDevBindPipe %x\n", ret);
			return -1;
		}
	} else {
		printf("RK_MPI_VI_EnableDev already\n");
	}

	return 0;
}

int vi_chn_init(int channelId, int width, int height) {
	printf("================================%s==================================\n",
	       __func__);
	int ret;
	int buf_cnt = 2;
	// VI init
	VI_CHN_ATTR_S vi_chn_attr;
	memset(&vi_chn_attr, 0, sizeof(vi_chn_attr));
	vi_chn_attr.stIspOpt.u32BufCount = buf_cnt;
	vi_chn_attr.stIspOpt.enMemoryType =
		VI_V4L2_MEMORY_TYPE_DMABUF; // VI_V4L2_MEMORY_TYPE_MMAP;
	vi_chn_attr.stSize.u32Width = width;
	vi_chn_attr.stSize.u32Height = height;
	vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
	vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE; // COMPRESS_AFBC_16x16;
	vi_chn_attr.u32Depth = 0; //0, get fail, 1 - u32BufCount, can get, if bind to other device, must be < u32BufCount
	ret = RK_MPI_VI_SetChnAttr(0, channelId, &vi_chn_attr);
	ret |= RK_MPI_VI_EnableChn(0, channelId);
	if (ret) {
		printf("ERROR: create VI error! ret=%d\n", ret);
		return ret;
	}

	return ret;
}

int test_avs_init(RK_S32 s32GrpId, RK_U32 u32Width, RK_U32 u32Height, RK_U32 u32AvsWidth, RK_U32 u32AvsHeight, RK_U32 u32Mode) {
	RK_S32 s32Ret = RK_FAILURE;
	AVS_GRP_ATTR_S stAvsGrpAttr;
	AVS_CHN_ATTR_S stAvsChnAttr[AVS_MAX_CHN_NUM];
	RK_CHAR *pAvsCalibFilePath = "/oem/usr/share/avs_calib/calib_file.xml";

	if (!u32Mode) {
		if (access(pAvsCalibFilePath, F_OK)) {
			RK_LOGE("%s not exist!", pAvsCalibFilePath);
			return s32Ret;
		}
	}

	memset(&stAvsGrpAttr, 0, sizeof(stAvsGrpAttr));
	stAvsGrpAttr.enMode = u32Mode; // 0: blend 1: no blend
	stAvsGrpAttr.u32PipeNum = 2;
	stAvsGrpAttr.stGainAttr.enMode = AVS_GAIN_MODE_AUTO;
	stAvsGrpAttr.stOutAttr.enPrjMode = AVS_PROJECTION_EQUIRECTANGULAR;
	stAvsGrpAttr.stOutAttr.stSize.u32Width = u32Width;
	stAvsGrpAttr.stOutAttr.stSize.u32Height = u32Height;
	stAvsGrpAttr.bSyncPipe = RK_FALSE;
	stAvsGrpAttr.stFrameRate.s32SrcFrameRate = -1;
	stAvsGrpAttr.stFrameRate.s32DstFrameRate = -1;
	stAvsGrpAttr.stInAttr.enParamSource = AVS_PARAM_SOURCE_CALIB;
	stAvsGrpAttr.stInAttr.stCalib.pCalibFilePath = pAvsCalibFilePath;
	stAvsGrpAttr.stInAttr.stSize.u32Width = u32Width;
	stAvsGrpAttr.stInAttr.stSize.u32Height = u32Height;
	stAvsGrpAttr.stOutAttr.fDistance = 5.0;

	s32Ret = RK_MPI_AVS_CreateGrp(s32GrpId, &stAvsGrpAttr);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_AVS_CreateGrp failed with %#x!\n", s32Ret);
		return s32Ret;
	}

	memset(&stAvsChnAttr, 0, sizeof(stAvsChnAttr));
	stAvsChnAttr[0].enCompressMode = COMPRESS_MODE_NONE;
	stAvsChnAttr[0].stFrameRate.s32SrcFrameRate = -1;
	stAvsChnAttr[0].stFrameRate.s32DstFrameRate = -1;
	stAvsChnAttr[0].u32Depth = 0;
	stAvsChnAttr[0].u32FrameBufCnt = 3;
	stAvsChnAttr[0].u32Width = u32AvsWidth;
	stAvsChnAttr[0].u32Height = u32AvsHeight;
	stAvsChnAttr[0].enDynamicRange = DYNAMIC_RANGE_SDR8;
	stAvsChnAttr[1].enCompressMode = COMPRESS_MODE_NONE;
	stAvsChnAttr[1].stFrameRate.s32SrcFrameRate = -1;
	stAvsChnAttr[1].stFrameRate.s32DstFrameRate = -1;
	stAvsChnAttr[1].u32Depth = 0;
	stAvsChnAttr[1].u32FrameBufCnt = 3;
	stAvsChnAttr[1].u32Width = CHN1_WIDTH;
	stAvsChnAttr[1].u32Height = CHN1_HEIGHT;
	stAvsChnAttr[1].enDynamicRange = DYNAMIC_RANGE_SDR8;
	for (RK_S32 chnIndex = 0; chnIndex < AVS_MAX_CHN_NUM; chnIndex++) {
		if (stAvsChnAttr[chnIndex].u32Width &&
		    stAvsChnAttr[chnIndex].u32Height) {
			s32Ret = RK_MPI_AVS_SetChnAttr(s32GrpId, chnIndex,
						       &stAvsChnAttr[chnIndex]);
			if (RK_SUCCESS != s32Ret) {
				RK_LOGE("RK_MPI_AVS_SetChnAttr failed with %#x!\n", s32Ret);
				return s32Ret;
			}

			s32Ret = RK_MPI_AVS_EnableChn(s32GrpId, chnIndex);
			if (RK_SUCCESS != s32Ret) {
				RK_LOGE("RK_MPI_AVS_EnableChn failed with %#x!\n", s32Ret);
				return s32Ret;
			}
		}
	}

	s32Ret = RK_MPI_AVS_StartGrp(s32GrpId);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_AVS_StartGrp failed with %#x!\n", s32Ret);
		return s32Ret;
	}

	return 0;
}

int test_avs_exit(RK_S32 s32GrpId) {
	RK_S32 chnIndex;
	RK_S32 s32Ret = RK_FAILURE;
	s32Ret = RK_MPI_AVS_StopGrp(s32GrpId);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_AVS_StopGrp failed with %#x!\n", s32Ret);
		return s32Ret;
	}

	for (chnIndex = 0; chnIndex < AVS_MAX_CHN_NUM; chnIndex++) {
		s32Ret = RK_MPI_AVS_DisableChn(s32GrpId, chnIndex);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_AVS_DisableChn failed with %#x!\n", s32Ret);
			return s32Ret;
		}
	}

	s32Ret = RK_MPI_AVS_DestroyGrp(s32GrpId);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_AVS_DestroyGrp failed with %#x!\n", s32Ret);
		return s32Ret;
	}

#if defined(RV1106) || defined(RV1103B)
	RK_MPI_SYS_WaitFreeMB();
#endif

	return 0;
}

static RK_CHAR optstr[] = "?::W:H:w:h:m:c:e:o:O:";

static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -W 1920 -H 1080 -w 3840 -h 1080 -m 2 -e h264 -o /tmp/venc0.h264 -O /tmp/venc1.h264\n", name);
	printf("\t-W | --width: VI width, Default:1920\n");
	printf("\t-H | --heght: VI height, Default:1080\n");
	printf("\t-w | --avs_width: AVS width, Default:3840\n");
	printf("\t-h | --avs_height: AVS height, Default:1080\n");
	printf("\t-m | --avs_mode: AVS mode, Default:2(hor non blend). 0(hor blend, need /oem/usr/share/avs_calib/calib_file.xml)\n");
	printf("\t-c | --frame_cnt: frame number of output, Default:-1\n");
	printf("\t-e | --encode: encode type, Default:h264, Value:h264, h265, mjpeg\n");
	printf("\t-o: output chn0 path, Default:NULL\n");
	printf("\t-O: output chn1 path, Default:NULL\n");
}

int main(int argc, char *argv[]) {
	RK_S32 s32Ret = RK_FAILURE;
	MPP_CHN_S stSrcChn, stAvsChn, stvencChn;

	RK_U32 u32Width = 1920;
	RK_U32 u32Height = 1080;
	RK_U32 u32AvsWidth = 3840;
	RK_U32 u32AvsHeight = 1080;
	RK_U32 u32Mode = 2;

	RK_CHAR *pOutPath = NULL;
	RK_CHAR *pOut1Path = NULL;
	RK_CODEC_ID_E enCodecType = RK_VIDEO_ID_AVC;
	RK_CHAR *pCodecName = "H264";
	int c;
	int ret = -1;

	while ((c = getopt(argc, argv, optstr)) != -1) {
		switch (c) {
		case 'W':
			u32Width = atoi(optarg);
			break;
		case 'H':
			u32Height = atoi(optarg);
			break;
		case 'w':
			u32AvsWidth = atoi(optarg);
			break;
		case 'h':
			u32AvsHeight = atoi(optarg);
			break;
		case 'm':
			u32Mode = atoi(optarg);
			break;
		case 'c':
			g_s32FrameCnt = atoi(optarg);
			break;
		case 'e':
			if (!strcmp(optarg, "h264")) {
				enCodecType = RK_VIDEO_ID_AVC;
				pCodecName = "H264";
			} else if (!strcmp(optarg, "h265")) {
				enCodecType = RK_VIDEO_ID_HEVC;
				pCodecName = "H265";
			} else if (!strcmp(optarg, "mjpeg")) {
				enCodecType = RK_VIDEO_ID_MJPEG;
				pCodecName = "MJPEG";
			} else {
				printf("ERROR: Invalid encoder type.\n");
				return -1;
			}
			break;
		case 'o':
			pOutPath = optarg;
			break;
		case 'O':
			pOut1Path = optarg;
			break;
		case '?':
		default:
			print_usage(argv[0]);
			return -1;
		}
	}

	printf("#CodecName:%s\n", pCodecName);
	printf("#INPUT Resolution: %dx%d\n", u32Width, u32Height);
	printf("#Avs Resolution: %dx%d\n", u32AvsWidth, u32AvsHeight);
	printf("#Avs mode: %d\n", u32Mode);
	printf("#Output Path: %s\n", pOutPath);
	printf("#Frame Count to save: %d\n", g_s32FrameCnt);

	if (pOutPath) {
		venc0_file = fopen(pOutPath, "w");
		if (!venc0_file) {
			printf("ERROR: open file: %s fail, exit\n", pOutPath);
			return 0;
		}
	}
	if (pOut1Path) {
		venc1_file = fopen(pOut1Path, "w");
		if (!venc1_file) {
			printf("ERROR: open file: %s fail, exit\n", pOut1Path);
			return 0;
		}
	}
	signal(SIGINT, sigterm_handler);

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		RK_LOGE("rk mpi sys init fail!");
		goto __FAILED;
	}

	vi_dev_init();
	vi_chn_init(0, u32Width, u32Height);
	vi_chn_init(1, u32Width, u32Height);
	if (test_avs_init(0, u32Width, u32Height, u32AvsWidth, u32AvsHeight, u32Mode))
		goto __FAILED;
	// venc  init
	test_venc_init(0, u32AvsWidth, u32AvsHeight, enCodecType);
	test_venc_init(1, CHN1_WIDTH, CHN1_HEIGHT, enCodecType);

	// bind vi to avs
	for (int i = 0; i < 2; i++) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = 0;
		stSrcChn.s32ChnId = i;

		stAvsChn.enModId = RK_ID_AVS;
		stAvsChn.s32DevId = 0;
		stAvsChn.s32ChnId = i;
		printf("====RK_MPI_SYS_Bind vi%d to avs%d====\n", i, i);
		s32Ret = RK_MPI_SYS_Bind(&stSrcChn, &stAvsChn);
		if (s32Ret != RK_SUCCESS) {
			printf("====RK_MPI_SYS_Bind vi%d to avs%d failed====\n", i, i);
			goto __FAILED;
		}
	}

	// bind avs to venc
	for (int i = 0; i < 2; i++) {
		stAvsChn.enModId = RK_ID_AVS;
		stAvsChn.s32DevId = 0;
		stAvsChn.s32ChnId = i;

		stvencChn.enModId = RK_ID_VENC;
		stvencChn.s32DevId = 0;
		stvencChn.s32ChnId = i;
		printf("====RK_MPI_SYS_Bind avs%d to venc%d====\n", i, i);
		s32Ret = RK_MPI_SYS_Bind(&stAvsChn, &stvencChn);
		if (s32Ret != RK_SUCCESS) {
			printf("====RK_MPI_SYS_Bind avs%d to venc%d failed====\n", i, i);
			goto __FAILED;
		}
	}

	pthread_t main_thread;
	pthread_create(&main_thread, NULL, GetMediaBuffer0, NULL);
	pthread_t sub_thread;
	pthread_create(&sub_thread, NULL, GetMediaBuffer1, NULL);

	while (!quit) {
		usleep(50000);
	}
	pthread_join(sub_thread, NULL);
	pthread_join(main_thread, NULL);
	ret = 0;
__FAILED:

	// unbind avs to venc
	for (int i = 0; i < 2; i++) {
		stAvsChn.enModId = RK_ID_AVS;
		stAvsChn.s32DevId = 0;
		stAvsChn.s32ChnId = i;

		stvencChn.enModId = RK_ID_VENC;
		stvencChn.s32DevId = 0;
		stvencChn.s32ChnId = i;
		s32Ret = RK_MPI_SYS_UnBind(&stAvsChn, &stvencChn);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_SYS_UnBind fail %x", s32Ret);
		}
	}

	// unbind vi to avs
	for (int i = 0; i < 2; i++) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = 0;
		stSrcChn.s32ChnId = i;

		stAvsChn.enModId = RK_ID_AVS;
		stAvsChn.s32DevId = 0;
		stAvsChn.s32ChnId = i;

		s32Ret = RK_MPI_SYS_UnBind(&stSrcChn, &stAvsChn);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_SYS_UnBind fail %x", s32Ret);
		}
	}

	for (int i = 0; i < 2; i++) {
		s32Ret = RK_MPI_VI_DisableChn(0, i);
		RK_LOGE("RK_MPI_VI_DisableChn chn%d %x", i, s32Ret);
	}

	s32Ret = test_avs_exit(0);

	for (int i = 0; i < 2; i++) {
		s32Ret = RK_MPI_VENC_StopRecvFrame(i);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_StopRecvFrame fail %x", s32Ret);
		}
		s32Ret = RK_MPI_VENC_DestroyChn(i);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VDEC_DestroyChn fail %x", s32Ret);
		}
	}

	s32Ret = RK_MPI_VI_DisableDev(0);
	RK_LOGE("RK_MPI_VI_DisableDev %x", s32Ret);

	RK_LOGE("test running exit:%d", s32Ret);
	RK_MPI_SYS_Exit();

	return ret;
}
