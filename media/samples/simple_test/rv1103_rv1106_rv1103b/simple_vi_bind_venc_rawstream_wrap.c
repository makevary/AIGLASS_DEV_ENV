#include <errno.h>
#include <pthread.h>
#include <signal.h>
#include <stdbool.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/poll.h>
#include <time.h>
#include <unistd.h>
#include <stdatomic.h>
#include <sys/prctl.h>

#ifdef RV1126_RV1109
#include <rk_aiq_user_api_camgroup.h>
#include <rk_aiq_user_api_imgproc.h>
#include <rk_aiq_user_api_sysctl.h>
#else
#include <rk_aiq_user_api2_camgroup.h>
#include <rk_aiq_user_api2_imgproc.h>
#include <rk_aiq_user_api2_sysctl.h>
#endif

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
#include "rk_mpi_vpss.h"

#define RK_MAX(a, b) ((a) > (b) ? (a) : (b))
#define RK_ARRAY_ELEMS(a) (sizeof(a) / sizeof((a)[0]))

typedef struct {
	RK_U32 u32PipeId;
	RK_U32 u32ChnId;
	RK_U32 u32InWidth;
	RK_U32 u32InHeight;
	RK_U32 u32OutWidth;
	RK_U32 u32OutHeight;
	RK_U32 u32MaxWidth;
	RK_U32 u32MaxHeight;
	RK_BOOL bEnableWrap;
	RK_U32 u32WrapLine;
	RK_U32 u32Framerate;
	RK_U32 u32DstFramerate;
	VI_RAW_MEMORY_TYPE_E enMemMode;
	RK_U32 u32BufCnt;
	RK_U32 u32PipeMbCnt;
	RK_BOOL bMirror;
	RK_BOOL bFlip;
	FILE *fp;
	pthread_t tid;
} TEST_VI_CFG_S;

typedef struct {
	RK_U32 u32ChnId;
	RK_U32 u32Width;
	RK_U32 u32Height;
	RK_S32 s32FrameCnt;
	RK_CODEC_ID_E enCodecType;
	RK_BOOL bEnableWrap;
	RK_U32 u32WrapLine;
	RK_U32 u32Bitrate;
	RK_U32 u32Framerate;
	RK_U32 u32BufSize;
	FILE *fp;
	pthread_t tid;
} TEST_VENC_CFG_S;

typedef enum {
	TEST_OFFLINE_MODE = 0,
	TEST_ONLINE_MODE
} TEST_LINE_MODE;

typedef struct {
	RK_U32 u32CamNum;
	TEST_LINE_MODE firstMode;
	TEST_LINE_MODE secondMode;
	TEST_VI_CFG_S stViCtx[2];
	TEST_VENC_CFG_S stVencCtx[2];
} TEST_CTX_S;

#define MAX_AIQ_CTX 2
static rk_aiq_sys_ctx_t *g_aiq_ctx[MAX_AIQ_CTX];
rk_aiq_working_mode_t g_WDRMode[MAX_AIQ_CTX];
static atomic_int g_sof_cnt = 0;
static atomic_bool g_should_quit = false;

static TEST_CTX_S stTestCtx;
static bool quit = false;

static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

RK_U64 TEST_COMM_GetNowUs() {
	struct timespec time = {0, 0};
	clock_gettime(CLOCK_MONOTONIC, &time);
	return (RK_U64)time.tv_sec * 1000000 + (RK_U64)time.tv_nsec / 1000; /* microseconds */
}

static int vi_pipe_init(TEST_VI_CFG_S *pViCfg) {
	int ret;
	VI_PIPE_ATTR_S stPipeAttr;

	memset(&stPipeAttr, 0, sizeof(stPipeAttr));
	stPipeAttr.u32MaxW = pViCfg->u32InWidth;
	stPipeAttr.u32MaxH = pViCfg->u32InHeight;
	stPipeAttr.enPixFmt = RK_FMT_RGB_BAYER_SBGGR_10BPP;
	stPipeAttr.enMemMode = pViCfg->enMemMode;
	ret = RK_MPI_VI_CreatePipe(pViCfg->u32PipeId, &stPipeAttr);
	if (ret != RK_SUCCESS) {
		printf("RK_MPI_VI_CreatePipe[%d] failed: %x\n", pViCfg->u32PipeId, ret);
		return -1;
	}

	return 0;
}


//根据不同的channel来选择不同的vi节点
static int vi_dev_init(int devId) {
	printf("%s\n", __func__);
	int ret = 0;
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
			printf("RK_MPI_VI_SetDevAttr[%d] failed: %x\n", devId, ret);
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
			printf("RK_MPI_VI_EnableDev[%d] %x\n", devId, ret);
			return -1;
		}

		// 1-3.bind dev/pipe
		stBindPipe.u32Num = 1;
		stBindPipe.PipeId[0] = pipeId;
		ret = RK_MPI_VI_SetDevBindPipe(devId, &stBindPipe);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_SetDevBindPipe[%d] %x\n", devId, ret);
			return -1;
		}
	} else {
		printf("RK_MPI_VI_EnableDev already\n");
	}

	return 0;
}

static int vi_chn_init(TEST_VI_CFG_S *pViCfg) {
	int ret = 0;
	VI_CHN_ATTR_S stViChnAttr;
	VI_CHN_BUF_WRAP_S stViWrap;

	printf("enter vi_chn_init[%d, %d]\n", pViCfg->u32PipeId, pViCfg->u32ChnId);

	memset(&stViChnAttr, 0, sizeof(VI_CHN_ATTR_S));
	stViChnAttr.stIspOpt.u32BufCount = pViCfg->u32BufCnt;
	stViChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF; // VI_V4L2_MEMORY_TYPE_MMAP;
	stViChnAttr.stSize.u32Width = pViCfg->u32OutWidth;
	stViChnAttr.stSize.u32Height = pViCfg->u32OutHeight;
	stViChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	stViChnAttr.stFrameRate.s32SrcFrameRate = pViCfg->u32Framerate;
	stViChnAttr.stFrameRate.s32DstFrameRate = pViCfg->u32DstFramerate;
	stViChnAttr.bMirror = pViCfg->bMirror;
	stViChnAttr.bFlip = pViCfg->bFlip;

	stViChnAttr.stIspOpt.stMaxSize.u32Width = pViCfg->u32MaxWidth;
	stViChnAttr.stIspOpt.stMaxSize.u32Height = pViCfg->u32MaxHeight;
	stViChnAttr.u32Depth = 0; //0, get fail, 1 - u32BufCount, can get, if bind to other device, must be < u32BufCount

	if (stTestCtx.u32CamNum > 1 && pViCfg->bEnableWrap) {
		stViChnAttr.stShareBufChn.enModId = RK_ID_VI;
		stViChnAttr.stShareBufChn.s32DevId = stTestCtx.stViCtx[0].u32PipeId;
		stViChnAttr.stShareBufChn.s32ChnId = stTestCtx.stViCtx[0].u32ChnId;
		stViChnAttr.enAllocBufType = pViCfg->u32PipeId? VI_ALLOC_BUF_TYPE_CHN_SHARE : VI_ALLOC_BUF_TYPE_INTERNAL;
	}

	printf("vi[%d, %d] enAllocBufType: %d, stShareBufChn.s32ChnId: %d\n",
					pViCfg->u32PipeId, pViCfg->u32ChnId, stViChnAttr.enAllocBufType, stViChnAttr.stShareBufChn.s32ChnId);

	ret = RK_MPI_VI_SetChnAttr(pViCfg->u32PipeId, pViCfg->u32ChnId, &stViChnAttr);
	if (ret) {
		printf("ERROR: VI set channel attribute fail, ret=%d\n", ret);
		return ret;
	}

	// set wrap mode attr
	memset(&stViWrap, 0, sizeof(VI_CHN_BUF_WRAP_S));
	if (pViCfg->bEnableWrap) {
		if ((stTestCtx.u32CamNum == 1) && (pViCfg->u32WrapLine < 64 || pViCfg->u32WrapLine > pViCfg->u32OutHeight)) {
			printf("wrap mode buffer line must between [64, %d], u32WrapLine: %d\n", pViCfg->u32OutHeight, pViCfg->u32WrapLine);
			return -1;
		}

		stViWrap.bEnable = RK_TRUE;
		stViWrap.u32BufLine = pViCfg->u32WrapLine;
		stViWrap.u32WrapBufferSize = stViWrap.u32BufLine * pViCfg->u32OutWidth * 3 / 2; // nv12 (w * wrapLine *3 / 2)
		printf("set channel: %d wrap line: %d, wrapBuffSize = %d\n", pViCfg->u32ChnId, pViCfg->u32WrapLine, stViWrap.u32WrapBufferSize);
		ret = RK_MPI_VI_SetChnWrapBufAttr(pViCfg->u32PipeId, pViCfg->u32ChnId, &stViWrap);
		if (ret) {
			printf("ERROR: RK_MPI_VI_SetChnWrapBufAttr failed: %x\n", ret);
			return ret;
		}
	}

	ret = RK_MPI_VI_EnableChn(pViCfg->u32PipeId, pViCfg->u32ChnId);
	if (ret) {
		printf("ERROR: RK_MPI_VI_EnableChn failed: %x\n", ret);
		return ret;
	}

	printf("vi dev:%d channle:%d enable success\n", pViCfg->u32PipeId, pViCfg->u32ChnId);
	return ret;
}

static RK_S32 venc_chn_init(TEST_VENC_CFG_S *pVencCfg) {
	int ret;
	VENC_CHN_ATTR_S stVencChnAttr;
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_BUF_WRAP_S stVencChnBufWrap;
	VENC_RC_MODE_E enRcMode = VENC_RC_MODE_BUTT;

	memset(&stVencChnAttr, 0, sizeof(VENC_CHN_ATTR_S));

	RK_U32 u32GopSize = 30; //pVencCfg->u32Framerate;

	stVencChnAttr.stVencAttr.enType = pVencCfg->enCodecType;
	stVencChnAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;

	if (pVencCfg->enCodecType == RK_VIDEO_ID_AVC) {
		enRcMode = VENC_RC_MODE_H264CBR;
		stVencChnAttr.stRcAttr.stH264Cbr.u32BitRate = pVencCfg->u32Bitrate;
		stVencChnAttr.stRcAttr.stH264Cbr.u32Gop = u32GopSize;
		stVencChnAttr.stRcAttr.stH264Cbr.fr32DstFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stH264Cbr.fr32DstFrameRateNum = pVencCfg->u32Framerate;
		stVencChnAttr.stRcAttr.stH264Cbr.u32SrcFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stH264Cbr.u32SrcFrameRateNum = pVencCfg->u32Framerate;
	} else if (pVencCfg->enCodecType == RK_VIDEO_ID_HEVC) {
		enRcMode = VENC_RC_MODE_H265CBR;
		stVencChnAttr.stRcAttr.stH265Cbr.u32BitRate = pVencCfg->u32Bitrate;
		stVencChnAttr.stRcAttr.stH265Cbr.u32Gop = u32GopSize;
		stVencChnAttr.stRcAttr.stH265Cbr.fr32DstFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stH265Cbr.fr32DstFrameRateNum = pVencCfg->u32Framerate;
		stVencChnAttr.stRcAttr.stH265Cbr.u32SrcFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stH265Cbr.u32SrcFrameRateNum = pVencCfg->u32Framerate;
	} else if (pVencCfg->enCodecType == RK_VIDEO_ID_MJPEG) {
		enRcMode = VENC_RC_MODE_MJPEGCBR;
		stVencChnAttr.stRcAttr.stMjpegCbr.u32BitRate = pVencCfg->u32Bitrate;
		stVencChnAttr.stRcAttr.stMjpegCbr.fr32DstFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stMjpegCbr.fr32DstFrameRateNum = pVencCfg->u32Framerate;
		stVencChnAttr.stRcAttr.stMjpegCbr.u32SrcFrameRateDen = 1;
		stVencChnAttr.stRcAttr.stMjpegCbr.u32SrcFrameRateNum = pVencCfg->u32Framerate;
	}

	stVencChnAttr.stRcAttr.enRcMode = enRcMode;
	stVencChnAttr.stVencAttr.u32MaxPicWidth = pVencCfg->u32Width;
	stVencChnAttr.stVencAttr.u32MaxPicHeight = pVencCfg->u32Height;
	stVencChnAttr.stVencAttr.u32PicWidth = pVencCfg->u32Width;
	stVencChnAttr.stVencAttr.u32PicHeight = pVencCfg->u32Height;
	stVencChnAttr.stVencAttr.u32VirWidth = pVencCfg->u32Width;
	stVencChnAttr.stVencAttr.u32VirHeight = pVencCfg->u32Height;
	stVencChnAttr.stVencAttr.u32StreamBufCnt = 5;
	stVencChnAttr.stVencAttr.u32BufSize = pVencCfg->u32BufSize;
	ret = RK_MPI_VENC_CreateChn(pVencCfg->u32ChnId, &stVencChnAttr);
	if (ret) {
		printf("RK_MPI_VENC_CreateChn[%d] fialed: %x\n", pVencCfg->u32ChnId, ret);
		return -1;
	}

	if (pVencCfg->bEnableWrap) {
		memset(&stVencChnBufWrap, 0, sizeof(stVencChnBufWrap));
		if ((stTestCtx.u32CamNum == 1) && (pVencCfg->u32WrapLine < 64 || pVencCfg->u32WrapLine > pVencCfg->u32Height)) {
			printf("wrap mode buffer line must between [64, %d], u32WrapLine: %d\n", pVencCfg->u32Height, pVencCfg->u32WrapLine);
			RK_MPI_VENC_DestroyChn(pVencCfg->u32ChnId);
			return -1;
		}

		stVencChnBufWrap.bEnable = RK_TRUE;
		stVencChnBufWrap.u32BufLine = pVencCfg->u32WrapLine;
		printf("set venc channel wrap line: %d\n", stVencChnBufWrap.u32BufLine);

		ret = RK_MPI_VENC_SetChnBufWrapAttr(pVencCfg->u32ChnId, &stVencChnBufWrap);
		if (ret)
			printf("RK_MPI_VENC_SetChnBufWrapAttr[%d] failed: %x\n", pVencCfg->u32ChnId, ret);
	}

	memset(&stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
	stRecvParam.s32RecvPicNum = pVencCfg->s32FrameCnt;
	ret = RK_MPI_VENC_StartRecvFrame(pVencCfg->u32ChnId, &stRecvParam);
	if (ret)
		printf("RK_MPI_VENC_StartRecvFrame[%d] failed: %x\n", pVencCfg->u32ChnId, ret);

	return RK_SUCCESS;
}

static void *send_raw_frame(void *arg) {
	RK_S32 ret = RK_SUCCESS;
	RK_S32 waitTime = 3000;
	RK_S32 loopCount = 0;
	VIDEO_FRAME_INFO_S stViFrame = {0};
	PIC_BUF_ATTR_S pstBufAttr = {0};
	MB_PIC_CAL_S pstPicCal = {0};
	MB_POOL_CONFIG_S stMbPoolCfg = {0};
	MB_POOL mbPool = MB_INVALID_POOLID;
	TEST_VI_CFG_S *pstViCfg = (TEST_VI_CFG_S *)arg;
	RK_U64 timeInterval = 0;
	if (pstViCfg->u32Framerate != -1)
		timeInterval = 1000000 / pstViCfg->u32Framerate;
	else
		timeInterval = 0;
	memset(&stViFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
	memset(&pstBufAttr, 0, sizeof(PIC_BUF_ATTR_S));
	memset(&pstPicCal, 0, sizeof(MB_PIC_CAL_S));
	memset(&stMbPoolCfg, 0, sizeof(MB_POOL_CONFIG_S));
	prctl(PR_SET_NAME, "send_raw");
	pstBufAttr.u32Width = pstViCfg->u32InWidth;
	pstBufAttr.u32Height = pstViCfg->u32InHeight;
	pstBufAttr.enCompMode = COMPRESS_MODE_NONE;
	pstBufAttr.enPixelFormat = RK_FMT_RGB_BAYER_SBGGR_10BPP;
	ret = RK_MPI_CAL_COMM_GetPicBufferSize(&pstBufAttr, &pstPicCal);
	if (ret != RK_SUCCESS) {
		printf("RK_MPI_CAL_TDE_GetPicBufferSize[%d, %d] failure: %x\n", pstViCfg->u32PipeId, pstViCfg->u32ChnId, ret);
		return RK_NULL;
	}

	printf("per buff size: %d\n", pstPicCal.u32MBSize);
	stMbPoolCfg.u64MBSize = pstPicCal.u32MBSize;
	stMbPoolCfg.u32MBCnt = pstViCfg->u32PipeMbCnt;
	stMbPoolCfg.enAllocType = MB_ALLOC_TYPE_DMA;
	stMbPoolCfg.bPreAlloc = RK_TRUE;
	mbPool = RK_MPI_MB_CreatePool(&stMbPoolCfg);
	if (mbPool == MB_INVALID_POOLID)
		printf("RK_MPI_MB_CreatePool[%d, %d] failure\n", pstViCfg->u32PipeId, pstViCfg->u32ChnId);

	while (!quit) {
		stViFrame.stVFrame.pMbBlk = RK_MPI_MB_GetMB(mbPool, pstPicCal.u32MBSize, RK_TRUE);
		if (stViFrame.stVFrame.pMbBlk == MB_INVALID_HANDLE) {
			usleep(1000);
			continue;
		}

		stViFrame.stVFrame.u32Width = pstBufAttr.u32Width;
		stViFrame.stVFrame.u32Height = pstBufAttr.u32Height;
		stViFrame.stVFrame.u32VirWidth = pstPicCal.u32VirWidth;
		stViFrame.stVFrame.u32VirHeight = pstPicCal.u32VirHeight;
		stViFrame.stVFrame.u32TimeRef = loopCount;
		stViFrame.stVFrame.u64PTS = loopCount * timeInterval;
		stViFrame.stVFrame.enPixelFormat = RK_FMT_RGB_BAYER_SBGGR_10BPP;
		stViFrame.stVFrame.enCompressMode = COMPRESS_MODE_NONE;

		if (pstViCfg->fp) {
			ret = fread(RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk), 1, pstPicCal.u32MBSize, pstViCfg->fp);
			//if (ret != pstPicCal.u32MBSize)
			//	printf("read raw data, ret = %d, pstPicCal.u32MBSize = %d, errno[%d, %s]\n", ret, pstPicCal.u32MBSize, errno, strerror(errno));

			ret = fseek(pstViCfg->fp, 0, SEEK_SET);
			if (ret)
				printf("fseek failed[%d] errno[%d, %s]", ret, errno, strerror(errno));
		} else {
			memset(RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk), 0, pstPicCal.u32MBSize);
		}

		RK_MPI_SYS_MmzFlushCache(stViFrame.stVFrame.pMbBlk, RK_FALSE);
		ret = RK_MPI_VI_PipeSendFrame(pstViCfg->u32PipeId, &stViFrame, waitTime);
		if (ret != RK_SUCCESS)
			printf("RK_MPI_VI_PipeSendFrame[%d, %d] failure:%x\n", pstViCfg->u32PipeId, pstViCfg->u32ChnId, ret);
		else
			printf("+++ %d: send pipe success[%d, %d], pts: %lld\n", loopCount, pstViCfg->u32PipeId, pstViCfg->u32ChnId, stViFrame.stVFrame.u64PTS);

		loopCount++;
		RK_MPI_MB_ReleaseMB(stViFrame.stVFrame.pMbBlk);
		stViFrame.stVFrame.pMbBlk = RK_NULL;
		if (timeInterval)
			usleep(timeInterval / 2);
	}

	RK_MPI_MB_DestroyPool(mbPool);
	printf("Exit send raw frame thread[%d, %d]\n", pstViCfg->u32PipeId, pstViCfg->u32ChnId);
	return NULL;
}


static void *get_venc_stream(void *arg) {
	RK_S32 s32Ret;
	RK_S32 loopCount = 0;
	void *pData = RK_NULL;
	VENC_PACK_S stPack;
	VENC_STREAM_S stFrame;
	RK_U64 u64prepts = 0;
	prctl(PR_SET_NAME, "get_venc_stream");
	TEST_VENC_CFG_S *pstVencCfg = (TEST_VENC_CFG_S *)arg;

	stFrame.pstPack = &stPack;
	while (!quit) {
		s32Ret = RK_MPI_VENC_GetStream(pstVencCfg->u32ChnId, &stFrame, 5000);
		if (s32Ret == RK_SUCCESS) {
			if (pstVencCfg->fp) {
				pData = RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
				fwrite(pData, 1, stFrame.pstPack->u32Len, pstVencCfg->fp);
				fflush(pstVencCfg->fp);
			}
			RK_U64 nowUs = TEST_COMM_GetNowUs();

			printf("--- %d, chn:%d, seq:%d, len:%d, pts=%lld, diff=%lld, delay=%lldus\n",
				loopCount, pstVencCfg->u32ChnId, stFrame.u32Seq, stFrame.pstPack->u32Len,
				stFrame.pstPack->u64PTS, stFrame.pstPack->u64PTS - u64prepts, nowUs - stFrame.pstPack->u64PTS);

			u64prepts = stFrame.pstPack->u64PTS;
			s32Ret = RK_MPI_VENC_ReleaseStream(pstVencCfg->u32ChnId, &stFrame);
			if (s32Ret != RK_SUCCESS)
				printf("RK_MPI_VENC_ReleaseStream[%d] failed: %x\n", pstVencCfg->u32ChnId, s32Ret);

			loopCount++;
		} else {
			printf("RK_MPI_VENC_GetStream[%d] timeout: %x\n", pstVencCfg->u32ChnId, s32Ret);
		}

		if ((pstVencCfg->s32FrameCnt >= 0) && (loopCount >= pstVencCfg->s32FrameCnt)) {
			quit = true;
			break;
		}
	}

	printf("Exit get venc[%d] stream thread\n", pstVencCfg->u32ChnId);
	system("cat /proc/vcodec/enc/venc_info | grep -A 2 RealFps");
	return NULL;
}

static RK_CHAR optstr[] = "?::d:n:c:I:o:w:l:d:m:b:f:s:v:F:r:R:";
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\tNOTE: Only RV1106 and RV1103 support this demo.\n");
	printf("\t%s -I 0 --in_width 1920 --in_height 1080 --out_width 1920 --out_height 1080 -d /data -w 1 -l 540\n", name);
	printf("\t-a | --aiq: iq file path, Default: /etc/iqfiles\n");
	printf("\t-n | --camera_num: camera number, Default:1\n");
	printf("\t--iw: first sensor vi input width, Default:1920\n");
	printf("\t--ih: first sensor vi input height, Default:1080\n");
	printf("\t--ow: first sensor vi output width, Default:1920\n");
	printf("\t--oh: first sensor vi output height, Default:1080\n");
	printf("\t--buf_size: venc buffer size, Default:out_width * out_height\n");
	printf("\t--iw1: second sensor vi input width, Default:1920\n");
	printf("\t--ih1: second sensor vi input height, Default:1080\n");
	printf("\t--ow1: second sensor vi output width, Default:1920\n");
	printf("\t--oh2: second sensor vi output height, Default:1080\n");
	printf("\t--buf_size1: second sensor venc buffer size, Default:out_width_second * out_height_second\n");
	printf("\t--buf_cnt: Vi buf_cnt, Default:2\n");
	printf("\t--pipe_mb_cnt: Vi pipe mediabuffer cnt, Default:1\n");
	printf("\t--frame_cnt: frame number of output, Default:-1\n");
	printf("\t-I | --chnId: vi channel id, Default 0. "
	       "0:rkisp_mainpath,1:rkisp_selfpath,2:rkisp_bypasspath\n");
	printf("\t--devId: vi device id, Default: 0\n");
	printf("\t-v | --vencId: venc channel id, Default: 0\n");
	printf("\t-d | --dir: input/output file directory, Default: /data\n");
	printf("\t-w | --wrap: first sensor enable wrap mode, Default: 1\n");
	printf("\t-l | --wrap_line: config wrap line, Default: 540\n");
	printf("\t-W | --wrap1: second sensor enable wrap mode, Default: 1\n");
	printf("\t-L | --wrap_line1: config second sensor wrap line, Default: 540\n");
	printf("\t-c | --codec: encode type, Default: 8 (h264), Value: 8 (h264), 12 (h265), 9 (mjpeg)\n");
	printf("\t-m | --mode: first sensor test mode, Default: 0(offline), Value: 0(offline), 1(online)\n");
	printf("\t-M | --mode1: second sensor test mode, Default: 0(offline), Value: 0(offline), 1(online)\n");
	printf("\t-b | --bitrate, unit kbps, Default: 10*1024 kbps\n");
	printf("\t-f | --framerate, Default: 30\n");
	printf("\t-F | --framerate1, Default: 30\n");
	printf("\t-r | --Dstframerate, Default: 30\n");
	printf("\t-R | --Dstframerate1, Default: 30\n");
	printf("\t-s | --save, whether to save the output file, Default: save file\n");
	printf("\t--mirror, enable vi mirror\n");
	printf("\t--flip, enable vi flip\n");
	printf("\t--pipe_mem_mode, Default: 1. Value: 0(VI_RAW_MEM_COMPACT), 1(VI_RAW_MEM_WORD_LOW_ALIGN), 2(VI_RAW_MEM_WORD_HIGH_ALIGN)\n");
}
static const struct option long_options[] = {
	{"aiq", optional_argument, NULL, 'a'},
	{"camera_num", required_argument, NULL, 'n'},
	{"iw", required_argument, NULL, 'i' + 'w'},
	{"ih", required_argument, NULL, 'i' + 'h'},
	{"ow", required_argument, NULL, 'o' + 'w'},
	{"oh", required_argument, NULL, 'o' + 'h'},
	{"buf_size", required_argument, NULL, 'b' + 's'},
	{"iw1", required_argument, NULL, 'i' + 'w' + 's'},
	{"ih1", required_argument, NULL, 'i' + 'h' + 's'},
	{"ow1", required_argument, NULL, 'o' + 'w' + 's'},
	{"oh1", required_argument, NULL, 'o' + 'h' + 's'},
	{"buf_size1", required_argument, NULL, 'b' + 's' + 's'},
	{"frame_cnt", required_argument, NULL, 'f' + 'c'},
	{"chnId", required_argument, NULL, 'I'},
	{"devId", required_argument, NULL, 'd' + 'i'},
	{"vencId", required_argument, NULL, 'v'},
	{"dir", required_argument, NULL, 'd'},
	{"wrap", required_argument, NULL, 'w'},
	{"wrap_line", required_argument, NULL, 'l'},
	{"wrap1", required_argument, NULL, 'W'},
	{"wrap_line1", required_argument, NULL, 'L'},
	{"codec", required_argument, NULL, 'c'},
	{"mode", required_argument, NULL, 'm'},
	{"mode1", required_argument, NULL, 'M'},
	{"bitrate", required_argument, NULL, 'b'},
	{"framerate", required_argument, NULL, 'f'},
	{"framerate1", required_argument, NULL, 'F'},
	{"Dstframerate", required_argument, NULL, 'r'},
	{"Dstframerate1", required_argument, NULL, 'R'},
	{"save", required_argument, NULL, 's'},
	{"pipe_mem_mode", required_argument, NULL, 'p' + 'm'},
	{"buf_cnt", required_argument, NULL, 'b' + 'c'},
	{"pipe_mb_cnt", required_argument, NULL, 'p' + 'm' + 'c'},
	{"mirror", no_argument, NULL, 'm' + 'r' + 'r'},
	{"flip", no_argument, NULL, 'f' + 'p'},
	{"help", optional_argument, NULL, '?'},
	{NULL, 0, NULL, 0},
};

static XCamReturn SIMPLE_COMM_ISP_SofCb(rk_aiq_metas_t *meta) {
	g_sof_cnt++;
	if (g_sof_cnt <= 2)
		printf("=== %u ===\n", meta->frame_id);
	return XCAM_RETURN_NO_ERROR;
}

static XCamReturn SIMPLE_COMM_ISP_ErrCb(rk_aiq_err_msg_t *msg) {
	if (msg->err_code == XCAM_RETURN_BYPASS)
		g_should_quit = true;
	return XCAM_RETURN_NO_ERROR;
}

static RK_S32 SIMPLE_COMM_ISP_Init(RK_S32 CamId, rk_aiq_working_mode_t WDRMode, RK_BOOL MultiCam, const char *iq_file_dir) {
	if (CamId >= MAX_AIQ_CTX) {
		printf("%s : CamId is over 3\n", __FUNCTION__);
		return -1;
	}

	// char *iq_file_dir = "iqfiles/";
	setlinebuf(stdout);
	if (iq_file_dir == NULL) {
		printf("SIMPLE_COMM_ISP_Init : not start.\n");
		g_aiq_ctx[CamId] = NULL;
		return 0;
	}

	// must set HDR_MODE, before init
	g_WDRMode[CamId] = WDRMode;
	char hdr_str[16];
	snprintf(hdr_str, sizeof(hdr_str), "%d", (int)WDRMode);
	setenv("HDR_MODE", hdr_str, 1);

	rk_aiq_sys_ctx_t *aiq_ctx;
	rk_aiq_static_info_t aiq_static_info;

#ifdef RV1126_RV1109
	rk_aiq_uapi_sysctl_enumStaticMetas(CamId, &aiq_static_info);

	printf("ID: %d, sensor_name is %s, iqfiles is %s\n", CamId, aiq_static_info.sensor_info.sensor_name, iq_file_dir);

	aiq_ctx = rk_aiq_uapi_sysctl_init(aiq_static_info.sensor_info.sensor_name, iq_file_dir,
					SIMPLE_COMM_ISP_ErrCb, SIMPLE_COMM_ISP_SofCb);

	if (MultiCam)
		rk_aiq_uapi_sysctl_setMulCamConc(aiq_ctx, true);
#else
	rk_aiq_uapi2_sysctl_enumStaticMetas(CamId, &aiq_static_info);

	printf("ID: %d, sensor_name is %s, iqfiles is %s\n", CamId, aiq_static_info.sensor_info.sensor_name, iq_file_dir);

	aiq_ctx = rk_aiq_uapi2_sysctl_init(aiq_static_info.sensor_info.sensor_name, iq_file_dir,
					SIMPLE_COMM_ISP_ErrCb, SIMPLE_COMM_ISP_SofCb);

	if (MultiCam)
		rk_aiq_uapi2_sysctl_setMulCamConc(aiq_ctx, true);
#endif

	g_aiq_ctx[CamId] = aiq_ctx;
	return 0;
}

static RK_S32 SIMPLE_COMM_ISP_Run(RK_S32 CamId) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}

#ifdef RV1126_RV1109
	if (rk_aiq_uapi_sysctl_prepare(g_aiq_ctx[CamId], 0, 0, g_WDRMode[CamId])) {
		printf("rkaiq engine prepare failed !\n");
		g_aiq_ctx[CamId] = NULL;
		return -1;
	}
	printf("rk_aiq_uapi_sysctl_init/prepare succeed\n");

	if (rk_aiq_uapi_sysctl_start(g_aiq_ctx[CamId])) {
		printf("rk_aiq_uapi_sysctl_start  failed\n");
		return -1;
	}
	printf("rk_aiq_uapi_sysctl_start succeed\n");
#else
	if (rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx[CamId], 0, 0, g_WDRMode[CamId])) {
		printf("rkaiq engine prepare failed !\n");
		g_aiq_ctx[CamId] = NULL;
		return -1;
	}
	printf("rk_aiq_uapi2_sysctl_init/prepare succeed\n");

	if (rk_aiq_uapi2_sysctl_start(g_aiq_ctx[CamId])) {
		printf("rk_aiq_uapi2_sysctl_start  failed\n");
		return -1;
	}
	printf("rk_aiq_uapi2_sysctl_start succeed\n");
#endif
	return 0;
}

static RK_S32 SIMPLE_COMM_ISP_Stop(RK_S32 CamId) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init g_aiq_ctx[%d] = %p\n", __FUNCTION__, CamId, g_aiq_ctx[CamId]);
		return -1;
	}

#ifdef RV1126_RV1109
	printf("rk_aiq_uapi_sysctl_stop enter\n");
	rk_aiq_uapi_sysctl_stop(g_aiq_ctx[CamId], false);
	printf("rk_aiq_uapi_sysctl_deinit enter\n");
	rk_aiq_uapi_sysctl_deinit(g_aiq_ctx[CamId]);
	printf("rk_aiq_uapi_sysctl_deinit exit\n");
#else
	printf("rk_aiq_uapi2_sysctl_stop enter\n");
	rk_aiq_uapi2_sysctl_stop(g_aiq_ctx[CamId], false);
	printf("rk_aiq_uapi2_sysctl_deinit enter\n");
	rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx[CamId]);
	printf("rk_aiq_uapi2_sysctl_deinit exit\n");
#endif

	g_aiq_ctx[CamId] = NULL;
	return 0;
}

static void init_ctx_cfg() {
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VENC_CFG_S *pVencCfg = &stTestCtx.stVencCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];
	TEST_VENC_CFG_S *pVencCfg1 = &stTestCtx.stVencCtx[1];

	memset(&stTestCtx, 0, sizeof(TEST_CTX_S));

	stTestCtx.u32CamNum = 1;
	stTestCtx.firstMode = TEST_OFFLINE_MODE;
	stTestCtx.secondMode = TEST_OFFLINE_MODE;
	pViCfg->u32PipeId = 0;
	pViCfg->u32ChnId = 0;
	pViCfg->u32InWidth = 1920;
	pViCfg->u32InHeight = 1080;
	pViCfg->u32OutWidth = 1920;
	pViCfg->u32OutHeight = 1080;
	pViCfg->u32MaxWidth = pViCfg->u32OutWidth;
	pViCfg->u32MaxHeight = pViCfg->u32OutHeight;
	pViCfg->bEnableWrap = RK_TRUE;
	pViCfg->u32WrapLine = 540;
	pViCfg->u32Framerate = 30;
	pViCfg->u32DstFramerate = 30;
	pViCfg->enMemMode = VI_RAW_MEM_WORD_LOW_ALIGN;
	pViCfg->u32BufCnt = 2;
	pViCfg->u32PipeMbCnt = 1;

	pVencCfg->u32ChnId = 0;
	pVencCfg->enCodecType = RK_VIDEO_ID_AVC;
	pVencCfg->bEnableWrap = RK_TRUE;
	pVencCfg->u32WrapLine = 540;
	pVencCfg->s32FrameCnt = -1;
	pVencCfg->u32Width = 1920;
	pVencCfg->u32Height = 1080;
	pVencCfg->u32Bitrate = 10 * 1024;
	pVencCfg->u32Framerate = 30;

	memcpy(pViCfg1, pViCfg, sizeof(TEST_VI_CFG_S));
	memcpy(pVencCfg1, pVencCfg, sizeof(TEST_VENC_CFG_S));

	pViCfg1->u32PipeId = 1;
	pVencCfg1->u32ChnId = 1;
}

static void open_file(RK_U32 u32CamNum, const RK_CHAR *pfileDir, bool bSaveFile) {
	char inputPath[256], outputPath[256];
	const char *postfix = "h264";
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VENC_CFG_S *pVencCfg = &stTestCtx.stVencCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];
	TEST_VENC_CFG_S *pVencCfg1 = &stTestCtx.stVencCtx[1];

	if (stTestCtx.firstMode == TEST_OFFLINE_MODE) {
		memset(inputPath, 0, 256);
		sprintf(inputPath, "%s/%dx%d.raw", pfileDir, pViCfg->u32InWidth, pViCfg->u32InHeight);
		printf("#Input path: %s\n", inputPath);

		pViCfg->fp = fopen(inputPath, "rb");
		if (!pViCfg->fp)
			printf("open input file(%s) failed, errno[%d, %s]\n", inputPath, errno, strerror(errno));
	}

	if (pVencCfg->enCodecType == RK_VIDEO_ID_AVC)
		postfix = "h264";
	else if (pVencCfg->enCodecType == RK_VIDEO_ID_HEVC)
		postfix = "h265";
	else if (pVencCfg->enCodecType == RK_VIDEO_ID_JPEG)
		postfix = "jpg";
	else if (pVencCfg->enCodecType == RK_VIDEO_ID_MJPEG)
		postfix = "mjpg";
	else {
		printf("nonsupport codec type: %d\n", pVencCfg->enCodecType);
	}

	if (bSaveFile) {
		memset(outputPath, 0, 256);
		sprintf(outputPath, "%s/venc_chn%d_%dx%d_%d.%s", pfileDir, pVencCfg->u32ChnId,
			pVencCfg->u32Width, pVencCfg->u32Height, pVencCfg->u32WrapLine, postfix);
		printf("#Output path: %s\n", outputPath);

		pVencCfg->fp = fopen(outputPath, "w");
		if (!pVencCfg->fp)
			printf("open output file(%s) failed, errno[%d, %s]\n", outputPath, errno, strerror(errno));
	}

	if (u32CamNum == 2) {
		if (stTestCtx.secondMode == TEST_OFFLINE_MODE) {
			memset(inputPath, 0, 256);
			sprintf(inputPath, "%s/%dx%d.raw", pfileDir, pViCfg1->u32InWidth, pViCfg1->u32InHeight);
			printf("#Second input path: %s\n", inputPath);

			pViCfg1->fp = fopen(inputPath, "rb");
			if (!pViCfg1->fp)
				printf("open second input file(%s) failed, errno[%d, %s]\n", inputPath, errno, strerror(errno));
		}

		if (bSaveFile) {
			memset(outputPath, 0, 256);
			sprintf(outputPath, "%s/venc_chn%d_%dx%d_%d.%s", pfileDir, pVencCfg1->u32ChnId,
				pVencCfg1->u32Width, pVencCfg1->u32Height, pVencCfg1->u32WrapLine, postfix);
			printf("#Second output path: %s\n", outputPath);

			pVencCfg1->fp = fopen(outputPath, "w");
			if (!pVencCfg1->fp)
				printf("open second output file(%s) failed, errno[%d, %s]\n", outputPath, errno, strerror(errno));
		}
	}
}

static void close_file(RK_U32 u32CamNum) {
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VENC_CFG_S *pVencCfg = &stTestCtx.stVencCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];
	TEST_VENC_CFG_S *pVencCfg1 = &stTestCtx.stVencCtx[1];

	if (pViCfg->fp) {
		printf("close vi[%d, %d] input file\n", pViCfg->u32PipeId, pViCfg->u32ChnId);
		fclose(pViCfg->fp);
	}

	if (pVencCfg->fp) {
		printf("close venc[%d] output file\n", pVencCfg->u32ChnId);
		fclose(pVencCfg->fp);
	}

	if (u32CamNum == 2) {
		if (pViCfg1->fp) {
		printf("close vi[%d, %d] input file\n", pViCfg1->u32PipeId, pViCfg1->u32ChnId);
			fclose(pViCfg1->fp);
		}

		if (pVencCfg1->fp) {
			printf("close venc[%d] output file\n", pVencCfg1->u32ChnId);
			fclose(pVencCfg1->fp);
		}
	}
}

static int init_all_vi_wrap(RK_U32 u32CamNum) {
	int ret;
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];

	if (stTestCtx.firstMode == TEST_ONLINE_MODE) {
		ret = vi_dev_init(pViCfg->u32PipeId);
		if (ret) {
			printf("vi_dev_init[%d] failed[%x]", pViCfg->u32PipeId, ret);
			return -1;
		}
	} else {
		ret = vi_pipe_init(pViCfg);
		if (ret) {
			printf("vi_pipe_init[%d] failed[%x]", pViCfg->u32PipeId, ret);
			return -1;
		}
	}
	printf("%d: pipe or dev init ok\n", pViCfg->u32PipeId);

	if (u32CamNum > 1) {
		if (stTestCtx.secondMode == TEST_ONLINE_MODE) {
			ret = vi_dev_init(pViCfg1->u32PipeId);
			if (ret) {
				printf("vi_dev_init[%d] failed[%x]", pViCfg1->u32PipeId, ret);
				return -1;
			}
		} else {
			ret = vi_pipe_init(pViCfg1);
			if (ret) {
				printf("vi_pipe_init[%d] failed[%x]", pViCfg1->u32PipeId, ret);
				return -1;
			}
		}
		printf("%d: pipe or dev init ok\n", pViCfg1->u32PipeId);
	}

	if (stTestCtx.firstMode == TEST_OFFLINE_MODE) {
		ret = RK_MPI_VI_StartPipe(pViCfg->u32PipeId);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_StartPipe[%d] failed: %x\n", pViCfg->u32PipeId, ret);
			return -1;
		}
		printf("%d: start pipe ok\n", pViCfg->u32PipeId);
	}

	if (u32CamNum > 1 && stTestCtx.secondMode == TEST_OFFLINE_MODE) {
		ret = RK_MPI_VI_StartPipe(pViCfg1->u32PipeId);
		if (ret != RK_SUCCESS) {
			printf("RK_MPI_VI_StartPipe[%d] failed: %x\n", pViCfg1->u32PipeId, ret);
			return -1;
		}
		printf("%d: start pipe ok\n", pViCfg1->u32PipeId);
	}

	ret = vi_chn_init(pViCfg);
	if (ret) {
		printf("vi_chn_init[%d, %d] failed[%x]", pViCfg->u32PipeId, pViCfg->u32ChnId, ret);
		return -1;
	}
	printf("vi chn[%d, %d] init ok\n", pViCfg->u32PipeId, pViCfg->u32ChnId);

	if (u32CamNum > 1) {
		ret = vi_chn_init(pViCfg1);
		if (ret) {
			printf("vi_chn_init[%d, %d] failed[%x]", pViCfg1->u32PipeId, pViCfg1->u32ChnId, ret);
			return -1;
		}
		printf("vi chn[%d, %d] init ok\n", pViCfg1->u32PipeId, pViCfg1->u32ChnId);
	}

	return 0;
}

static int deinit_all_vi_wrap(RK_U32 u32CamNum) {
	int ret = 0;
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];

	ret = RK_MPI_VI_DisableChn(pViCfg->u32PipeId, pViCfg->u32ChnId);
	printf("RK_MPI_VI_DisableChn[%d, %d]: %x\n", pViCfg->u32PipeId, pViCfg->u32ChnId, ret);

	if (u32CamNum > 1) {
		ret = RK_MPI_VI_DisableChn(pViCfg1->u32PipeId, pViCfg1->u32ChnId);
		printf("RK_MPI_VI_DisableChn[%d, %d]: %x\n", pViCfg1->u32PipeId, pViCfg1->u32ChnId, ret);
	}

	if (stTestCtx.firstMode == TEST_ONLINE_MODE) {
		ret = RK_MPI_VI_DisableDev(pViCfg->u32ChnId);
		printf("RK_MPI_VI_DisableDev[%d]: %x\n", pViCfg->u32ChnId, ret);
	} else {
		ret = RK_MPI_VI_StopPipe(pViCfg->u32PipeId);
		printf("RK_MPI_VI_StopPipe[%d]: %x\n", pViCfg->u32ChnId, ret);
		ret = RK_MPI_VI_DestroyPipe(pViCfg->u32PipeId);
		printf("RK_MPI_VI_DestroyPipe[%d]: %x\n", pViCfg->u32ChnId, ret);
	}

	if (u32CamNum > 1) {
		if (stTestCtx.secondMode == TEST_ONLINE_MODE) {
			ret = RK_MPI_VI_DisableDev(pViCfg1->u32ChnId);
			printf("RK_MPI_VI_DisableDev[%d]: %x\n", pViCfg1->u32ChnId, ret);
		} else {
			ret = RK_MPI_VI_StopPipe(pViCfg1->u32PipeId);
			printf("RK_MPI_VI_StopPipe[%d]: %x\n", pViCfg1->u32ChnId, ret);
			ret = RK_MPI_VI_DestroyPipe(pViCfg1->u32PipeId);
			printf("RK_MPI_VI_DestroyPipe[%d]: %x\n", pViCfg1->u32ChnId, ret);
		}
	}

	return ret;
}

static int init_venc_wrap(TEST_VI_CFG_S *pViCfg, TEST_VENC_CFG_S *pVencCfg, TEST_LINE_MODE mode) {
	int ret = 0;
	MPP_CHN_S stSrcChn;
	MPP_CHN_S stDestChn;

	ret = venc_chn_init(pVencCfg);
	if (ret != RK_SUCCESS) {
		printf("create %d ch venc failed\n", pVencCfg->u32ChnId);
		return -1;
	}
	printf("venc chn[%d] init ok\n", pVencCfg->u32ChnId);

	ret = pthread_create(&pVencCfg->tid, NULL, get_venc_stream, pVencCfg);
	if (ret) {
		printf("Create get venc mb(%d) thread failed %d\n", pVencCfg->u32ChnId, ret);
		goto _FAILED;
	}

	// bind vi to venc
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = pViCfg->u32PipeId;
	stSrcChn.s32ChnId = pViCfg->u32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = pVencCfg->u32ChnId;
	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != RK_SUCCESS) {
		printf("vi[%d] bind venc[%d] ch venc failed\n", stSrcChn.s32ChnId, stDestChn.s32ChnId);
		goto _FAILED_1;
	}
	printf("vi[%d, %d] bind venc[%d] ok\n", pViCfg->u32PipeId, pViCfg->u32ChnId, pVencCfg->u32ChnId);

	if (mode == TEST_OFFLINE_MODE) {
		ret = pthread_create(&pViCfg->tid, NULL, send_raw_frame, pViCfg);
		if (ret) {
			printf("Create get venc mb(%d) thread failed %d\n", pViCfg->u32ChnId, ret);
			goto _FAILED;
		}
	}

	return 0;

_FAILED:
	if (pVencCfg->tid) {
		ret = pthread_join(pVencCfg->tid, NULL);
		if (ret)
			printf("Exit get venc[%d] mb thread failed!\n", pVencCfg->u32ChnId);
		else
			printf("Exit get venc[%d] mb thread ok\n", pVencCfg->u32ChnId);
		pVencCfg->tid = 0;
	}

	if (pViCfg->tid) {
		ret = pthread_join(pViCfg->tid, NULL);
		if (ret)
			printf("Exit send vi[%d] frame thread failed!\n", pViCfg->u32ChnId);
		else
			printf("Exit send vi[%d] frame thread ok\n", pViCfg->u32ChnId);
		pViCfg->tid = 0;
	}

	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	printf("RK_MPI_SYS_UnBind[%d, %d]: %x\n", stSrcChn.s32ChnId, stDestChn.s32ChnId, ret);

_FAILED_1:
	ret = RK_MPI_VENC_DestroyChn(pVencCfg->u32ChnId);
	printf("RK_MPI_VENC_DestroyChn[%d]: %x\n", pVencCfg->u32ChnId, ret);

	return -1;
}

static int deinit_venc_wrap(TEST_VI_CFG_S *pViCfg, TEST_VENC_CFG_S *pVencCfg, TEST_LINE_MODE mode) {
	int ret = 0;
	MPP_CHN_S stSrcChn;
	MPP_CHN_S stDestChn;

	if (pVencCfg->tid) {
		ret = pthread_join(pVencCfg->tid, NULL);
		if (ret)
			printf("Exit get venc[%d] mb thread failed!\n", pVencCfg->u32ChnId);
		else
			printf("Exit get venc[%d] mb thread ok\n", pVencCfg->u32ChnId);
		pVencCfg->tid = 0;
	}

	if (pViCfg->tid) {
		ret = pthread_join(pViCfg->tid, NULL);
		if (ret)
			printf("Exit send vi[%d] frame thread failed!\n", pViCfg->u32ChnId);
		else
			printf("Exit send vi[%d] frame thread ok\n", pViCfg->u32ChnId);
		pViCfg->tid = 0;
	}

	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = pViCfg->u32PipeId;
	stSrcChn.s32ChnId = pViCfg->u32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = pVencCfg->u32ChnId;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	printf("RK_MPI_SYS_UnBind[%d, %d]: %x\n", stSrcChn.s32ChnId, stDestChn.s32ChnId, ret);

	ret = RK_MPI_VENC_DestroyChn(pVencCfg->u32ChnId);
	printf("RK_MPI_VENC_DestroyChn[%d]: %x\n", pVencCfg->u32ChnId, ret);

	return ret;
}

int main(int argc, char *argv[]) {
	int c;
	const RK_CHAR *pfileDir = "/data";
	RK_CHAR *pIqfilesPath = NULL;
	TEST_VI_CFG_S *pViCfg = &stTestCtx.stViCtx[0];
	TEST_VENC_CFG_S *pVencCfg = &stTestCtx.stVencCtx[0];
	TEST_VI_CFG_S *pViCfg1 = &stTestCtx.stViCtx[1];
	TEST_VENC_CFG_S *pVencCfg1 = &stTestCtx.stVencCtx[1];
	bool bSaveFile = true;

	init_ctx_cfg();

	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		switch (c) {
		case 'a':
			pIqfilesPath = optarg;
			break;
		case 'n':
			stTestCtx.u32CamNum = atoi(optarg);
			break;
		case 's':
			bSaveFile = atoi(optarg);
			break;
		case 'v':
			pVencCfg->u32ChnId = atoi(optarg);
			break;
		case 'i' + 'w':
			pViCfg->u32InWidth = atoi(optarg);
			break;
		case 'i' + 'h':
			pViCfg->u32InHeight = atoi(optarg);
			break;
		case 'o' + 'w':
			pViCfg->u32OutWidth = atoi(optarg);
			pVencCfg->u32Width = pViCfg->u32OutWidth;
			break;
		case 'o' + 'h':
			pViCfg->u32OutHeight = atoi(optarg);
			pVencCfg->u32Height = pViCfg->u32OutHeight;
			break;
		case 'b' + 's':
			pVencCfg->u32BufSize = atoi(optarg);
			break;
		case 'i' + 'w' + 's':
			pViCfg1->u32InWidth = atoi(optarg);
			break;
		case 'i' + 'h' + 's':
			pViCfg1->u32InHeight = atoi(optarg);
			break;
		case 'o' + 'w' + 's':
			pViCfg1->u32OutWidth = atoi(optarg);
			pVencCfg1->u32Width = pViCfg1->u32OutWidth;
			break;
		case 'o' + 'h' + 's':
			pViCfg1->u32OutHeight = atoi(optarg);
			pVencCfg1->u32Height = pViCfg1->u32OutHeight;
			break;
		case 'b' + 's' + 's':
			pVencCfg1->u32BufSize = atoi(optarg);
			break;
		case 'p' + 'm':
			pViCfg->enMemMode = atoi(optarg);
			pViCfg1->enMemMode = pViCfg->enMemMode;
			break;
		case 'p' + 'm' + 'c':
			pViCfg->u32PipeMbCnt = atoi(optarg);
			pViCfg1->u32PipeMbCnt = pViCfg->u32PipeMbCnt;
			break;
		case 'b' + 'c':
			pViCfg->u32BufCnt = atoi(optarg);
			pViCfg1->u32BufCnt = pViCfg->u32BufCnt;
			break;
		case 'm' + 'r' + 'r':
			pViCfg->bMirror = RK_TRUE;
			pViCfg1->bMirror = pViCfg->bMirror;
			break;
		case 'f' + 'p':
			pViCfg->bFlip = RK_TRUE;
			pViCfg1->bFlip = pViCfg->bFlip;
			break;
		case 'I':
			pViCfg->u32ChnId = atoi(optarg);
			pViCfg1->u32ChnId = pViCfg->u32ChnId;
			break;
		case 'd' + 'i':
			pViCfg->u32PipeId = atoi(optarg);
			break;
		case 'c': // codec
			pVencCfg->enCodecType = atoi(optarg);
			pVencCfg1->enCodecType = pVencCfg->enCodecType;
			break;
		case 'b':
			pVencCfg->u32Bitrate = atoi(optarg);
			pVencCfg1->u32Bitrate = pVencCfg->u32Bitrate;
			break;
		case 'f' + 'c':
			pVencCfg->s32FrameCnt = atoi(optarg);
			pVencCfg1->s32FrameCnt = pVencCfg->s32FrameCnt;
			break;
		case 'd':
			pfileDir = optarg;
			break;
		case 'w':
			pViCfg->bEnableWrap = (RK_BOOL)atoi(optarg);
			pVencCfg->bEnableWrap = pViCfg->bEnableWrap;
			break;
		case 'W':
			pViCfg1->bEnableWrap = (RK_BOOL)atoi(optarg);
			pVencCfg1->bEnableWrap = pViCfg1->bEnableWrap;
			break;
		case 'l':
			pViCfg->u32WrapLine = atoi(optarg);
			pVencCfg->u32WrapLine = pViCfg->u32WrapLine;
			break;
		case 'L':
			pViCfg1->u32WrapLine = atoi(optarg);
			pVencCfg1->u32WrapLine = pViCfg1->u32WrapLine;
			break;
		case 'f':
			pViCfg->u32Framerate = atoi(optarg);
			break;
		case 'F':
			pViCfg1->u32Framerate =  atoi(optarg);
			break;
		case 'r':
			pViCfg->u32DstFramerate = atoi(optarg);
			pVencCfg->u32Framerate = pViCfg->u32DstFramerate;
			break;
		case 'R':
			pViCfg1->u32DstFramerate =  atoi(optarg);
			pVencCfg1->u32Framerate = pViCfg1->u32DstFramerate;
			break;
		case 'm':
			stTestCtx.firstMode = (TEST_LINE_MODE)atoi(optarg);
			break;
		case 'M':
			stTestCtx.secondMode = (TEST_LINE_MODE)atoi(optarg);
			break;
		case '?':
		default:
			print_usage(argv[0]);
			return -1;
		}
	}

	if (pVencCfg->u32BufSize == 0)
		pVencCfg->u32BufSize = pVencCfg->u32Width * pVencCfg->u32Height;

	if (pVencCfg1->u32BufSize == 0)
		pVencCfg1->u32BufSize = pVencCfg1->u32Width * pVencCfg1->u32Height;

	if (stTestCtx.u32CamNum == 2) {
		pViCfg->u32MaxWidth = pViCfg->u32OutWidth > pViCfg1->u32OutWidth ? pViCfg->u32OutWidth : pViCfg1->u32OutWidth;
		pViCfg->u32MaxHeight = pViCfg->u32OutHeight > pViCfg1->u32OutHeight ? pViCfg->u32OutHeight : pViCfg1->u32OutHeight;
		pViCfg1->u32MaxWidth = pViCfg->u32MaxWidth;
		pViCfg1->u32MaxHeight = pViCfg->u32MaxHeight;
	} else {
		pViCfg->u32MaxWidth = pViCfg->u32OutWidth;
		pViCfg->u32MaxHeight = pViCfg->u32OutHeight;
	}

	printf("#u32CamNum: %d, pViCfg->u32PipeId: %d, pViCfg->u32ChnId: %d, pViCfg1->u32PipeId: %d\n", stTestCtx.u32CamNum, pViCfg->u32PipeId, pViCfg->u32ChnId, pViCfg1->u32PipeId);
	printf("#pVencCfg->u32ChnId: %d, pVencCfg1->u32ChnId: %d\n", pVencCfg->u32ChnId, pVencCfg1->u32ChnId);
	printf("#enMemMode: %d, u32BufCnt: %d, u32PipeMbCnt: %d\n", pViCfg->enMemMode, pViCfg->u32BufCnt, pViCfg->u32PipeMbCnt);
	printf("#u32MaxWidth: %d, u32MaxHeight: %d\n", pViCfg->u32MaxWidth, pViCfg->u32MaxHeight);
	printf("#Resolution: In: %dx%d, Out: %dx%d\n", pViCfg->u32InWidth, pViCfg->u32InHeight, pViCfg->u32OutWidth, pViCfg->u32OutHeight);
	printf("#bWrapEn: %d, u32WrapLine: %d\n", pViCfg->bEnableWrap, pViCfg->u32WrapLine);
	printf("#u32BufSize: %d, second u32BufSize: %d\n", pVencCfg->u32BufSize, pVencCfg1->u32BufSize);
	printf("#Second resolution: In: %dx%d, Out: %dx%d\n", pViCfg1->u32InWidth, pViCfg1->u32InHeight, pViCfg1->u32OutWidth, pViCfg1->u32OutHeight);
	printf("#Second bWrapEn: %d, u32WrapLine: %d\n", pViCfg1->bEnableWrap, pViCfg1->u32WrapLine);
	printf("#enCodecType: %d, s32FrameCnt: %d, bitrate: %d\n", pVencCfg->enCodecType, pVencCfg->s32FrameCnt, pVencCfg->u32Bitrate);
	printf("#save file dir: %s, bSaveFile: %d\n", pfileDir, bSaveFile);
	printf("#firstMode: %d, secondMode: %d\n", stTestCtx.firstMode, stTestCtx.secondMode);

	signal(SIGINT, sigterm_handler);

	if (pIqfilesPath) {
#ifdef RKAIQ
		RK_BOOL bMultiCam = RK_FALSE;

		if (stTestCtx.u32CamNum == 2)
			bMultiCam = RK_TRUE;

		printf("ISP IQ file path: %s\n", pIqfilesPath);
		if (stTestCtx.firstMode == TEST_ONLINE_MODE) {
			SIMPLE_COMM_ISP_Init(pViCfg->u32PipeId, RK_AIQ_WORKING_MODE_NORMAL, bMultiCam, pIqfilesPath);
			SIMPLE_COMM_ISP_Run(pViCfg->u32PipeId);
		}

		if ((stTestCtx.secondMode == TEST_ONLINE_MODE) && (stTestCtx.u32CamNum == 2)) {
			SIMPLE_COMM_ISP_Init(pViCfg1->u32PipeId, RK_AIQ_WORKING_MODE_NORMAL, bMultiCam, pIqfilesPath);
			SIMPLE_COMM_ISP_Run(pViCfg1->u32PipeId);
		}
#endif
	}

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		printf("rk mpi sys init fail!");

		if (pIqfilesPath) {
			if (stTestCtx.firstMode == TEST_ONLINE_MODE)
				SIMPLE_COMM_ISP_Stop(pViCfg->u32PipeId);
			if ((stTestCtx.secondMode == TEST_ONLINE_MODE) && (stTestCtx.u32CamNum == 2))
				SIMPLE_COMM_ISP_Stop(pViCfg1->u32PipeId);
		}

		return -1;
	}

	open_file(stTestCtx.u32CamNum, pfileDir, bSaveFile);

	init_all_vi_wrap(stTestCtx.u32CamNum);
	init_venc_wrap(pViCfg, pVencCfg, stTestCtx.firstMode);

	if (stTestCtx.u32CamNum == 2)
		init_venc_wrap(pViCfg1, pVencCfg1, stTestCtx.secondMode);

	while (!quit) {
		usleep(50000);
	}

	deinit_venc_wrap(pViCfg, pVencCfg, stTestCtx.firstMode);
	if (stTestCtx.u32CamNum == 2)
		deinit_venc_wrap(pViCfg1, pVencCfg1, stTestCtx.secondMode);

	deinit_all_vi_wrap(stTestCtx.u32CamNum);
	close_file(stTestCtx.u32CamNum);

	if (pIqfilesPath) {
		if (stTestCtx.firstMode == TEST_ONLINE_MODE)
			SIMPLE_COMM_ISP_Stop(pViCfg->u32PipeId);
		if ((stTestCtx.secondMode == TEST_ONLINE_MODE) && (stTestCtx.u32CamNum == 2))
			SIMPLE_COMM_ISP_Stop(pViCfg1->u32PipeId);
	}

	RK_MPI_SYS_Exit();
	printf("Exit main\n");
	return 0;
}
