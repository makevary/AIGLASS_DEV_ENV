
/*
 * Copyright 2021 Rockchip Electronics Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <sys/poll.h>
#include <unistd.h>
#include <time.h>
#include "utils.h"
#include "font_factory.h"
#include "sample_comm_rgn.h"

static int fill_text(osd_data_s *data) {
	if (data->text.font_path == NULL) {
		RK_LOGE("font_path is NULL\n");
		return -1;
	}
	set_font_color(data->text.font_color);
	draw_argb8888_text(data->buffer, data->width, data->height, data->text.wch);
	return 0;
}

static int generate_date_time(wchar_t *result, const int r_size, char *append) {
	char time_str[64];
	time_t curtime;
	curtime = time(0);
	// strftime(time_str, sizeof(time_str), "%Y-%m-%d %A %H:%M:%S", localtime(&curtime));
	strftime(time_str, sizeof(time_str), "%Y-%m-%d_%H:%M:%S", localtime(&curtime));
	if (append)
		sprintf(time_str + strlen(time_str), "%s", append);
	return swprintf(result, r_size, L"%s", time_str);
}

static int generate_strings(wchar_t *result, const int r_size, char* osd_strings, char *append) {
	char tmp_str[64];
	time_t curtime;
	curtime = time(0);
	// strftime(time_str, sizeof(time_str), "%Y-%m-%d %A %H:%M:%S", localtime(&curtime));
	sprintf(tmp_str, "%s", osd_strings);
	if (append)
		sprintf(tmp_str + strlen(tmp_str), "%s", append);
	return swprintf(result, r_size, L"%s", tmp_str);
}

RK_S32 SAMPLE_COMM_RGN_CreateChn(SAMPLE_RGN_CTX_S *ctx) {
	RK_S64 s64TimeStart;
	RK_S64 s64TimeEnd;
	RK_S32 s32Ret = RK_SUCCESS;

	switch (ctx->stRgnAttr.enType) {
	case OVERLAY_RGN: {
		ctx->stRgnAttr.enType = OVERLAY_RGN;
		ctx->stRgnAttr.unAttr.stOverlay.enPixelFmt = (PIXEL_FORMAT_E)ctx->u32BmpFormat;
		ctx->stRgnAttr.unAttr.stOverlay.stSize.u32Width = ctx->stRegion.u32Width;
		ctx->stRgnAttr.unAttr.stOverlay.stSize.u32Height = ctx->stRegion.u32Height;

		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = OVERLAY_RGN;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32BgAlpha = ctx->u32BgAlpha;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32FgAlpha = ctx->u32FgAlpha;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32Layer = ctx->u32Layer;

		//if (!ctx->bDrawBmpManual) {
		//	s32Ret = test_rgn_load_bmp(ctx);
		//	if (s32Ret != RK_SUCCESS) {
		//		RK_LOGE("test_rgn_load_bmp failure:%#X", s32Ret);
		//		return s32Ret;
		//	}
		//}
	} break;
	case COVER_RGN: {
		ctx->stRgnAttr.enType = COVER_RGN;
		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = COVER_RGN;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Width = ctx->stRegion.u32Width;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Height = ctx->stRegion.u32Height;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.u32Color = ctx->u32Color;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.u32Layer = ctx->u32Layer;
	} break;
	case MOSAIC_RGN: {
		ctx->stRgnAttr.enType = MOSAIC_RGN;
		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = MOSAIC_RGN;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.u32Width = ctx->stRegion.u32Width;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.u32Height =
		    ctx->stRegion.u32Height;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.enBlkSize = MOSAIC_BLK_SIZE_64;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.u32Layer = ctx->u32Layer;
	} break;
	default:
		RK_LOGE("unsupport type %d.", ctx->stRgnAttr.enType);
		return RK_FAILURE;
	}

	s32Ret = RK_MPI_RGN_Create(ctx->rgnHandle, &ctx->stRgnAttr);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_RGN_Create (%d) failed with %#x!", ctx->rgnHandle, s32Ret);
		return RK_FAILURE;
	}
#if defined(RV1126)
	if (ctx->u32BmpFormat == RK_FMT_8BPP) {
		ctx->stRgnAttr.unAttr.stOverlay.u32ClutNum = CLUT_TABLE_8BPP_NUM;
		memcpy(ctx->stRgnAttr.unAttr.stOverlay.u32Clut, clut_table_8bpp,
		       sizeof(ctx->stRgnAttr.unAttr.stOverlay.u32Clut[0]) * CLUT_TABLE_8BPP_NUM);
		s32Ret = RK_MPI_RGN_SetAttr(ctx->rgnHandle, &ctx->stRgnAttr);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_RGN_SetAttr (%d) failed with %#x!", ctx->rgnHandle, s32Ret);
			return RK_FAILURE;
		}
	}
#endif

	s32Ret = RK_MPI_RGN_AttachToChn(ctx->rgnHandle, &ctx->stMppChn, &ctx->stRgnChnAttr);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_RGN_AttachToChn (%d) failed with %#x!", ctx->rgnHandle, s32Ret);
		return RK_FAILURE;
	}

	if (ctx->stRgnAttr.enType == OVERLAY_RGN && !ctx->bDrawBmpManual) {
		// s64TimeStart = mpi_test_utils_get_now_us();

		s32Ret = RK_MPI_RGN_SetBitMap(ctx->rgnHandle, &ctx->stBitmap);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_RGN_SetBitMap failed with %#x!", s32Ret);
			if (RK_NULL != ctx->stBitmap.pData) {
				free(ctx->stBitmap.pData);
				ctx->stBitmap.pData = NULL;
			}
			return RK_FAILURE;
		}

		if (RK_NULL != ctx->stBitmap.pData) {
			free(ctx->stBitmap.pData);
			ctx->stBitmap.pData = NULL;
		}

		// s64TimeEnd = mpi_test_utils_get_now_us();
		// RK_LOGI("Handle:%d, space time %lld us, load bmp success!",
		// ctx->rgnHandle, s64TimeEnd -
		// s64TimeStart);
	}

	s32Ret =
	    RK_MPI_RGN_GetDisplayAttr(ctx->rgnHandle, &ctx->stMppChn, &ctx->stRgnChnAttr);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_RGN_GetDisplayAttr (%d)) failed with %#x!", ctx->rgnHandle,
		        s32Ret);
		return RK_FAILURE;
	}

	switch (ctx->stRgnAttr.enType) {
	case OVERLAY_RGN: {
		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = OVERLAY_RGN;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32BgAlpha = ctx->u32BgAlpha;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32FgAlpha = ctx->u32FgAlpha;
		ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32Layer = ctx->u32Layer;
		RK_LOGE("resize the overlay region %d to <%d, %d> BgAlpha %d "
		        "FgAlpha%d, color<0x%x>",
		        ctx->rgnHandle, ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32X,
		        ctx->stRgnChnAttr.unChnAttr.stOverlayChn.stPoint.s32Y,
		        ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32BgAlpha,
		        ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32FgAlpha,
		        ctx->stRgnChnAttr.unChnAttr.stOverlayChn.u32Layer);
	} break;
	case COVER_RGN: {
		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = COVER_RGN;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Width = ctx->stRegion.u32Width;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Height = ctx->stRegion.u32Height;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.u32Color = ctx->u32Color;
		ctx->stRgnChnAttr.unChnAttr.stCoverChn.u32Layer = ctx->u32Layer;
		RK_LOGE("resize the cover region %d to <%d, %d, %d, %d>, color<0x%x>",
		        ctx->rgnHandle, ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32X,
		        ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.s32Y,
		        ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Width,
		        ctx->stRgnChnAttr.unChnAttr.stCoverChn.stRect.u32Height,
		        ctx->stRgnChnAttr.unChnAttr.stCoverChn.u32Color);
	} break;
	case MOSAIC_RGN: {
		ctx->stRgnChnAttr.bShow = RK_TRUE;
		ctx->stRgnChnAttr.enType = MOSAIC_RGN;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.s32X = ctx->stRegion.s32X;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.s32Y = ctx->stRegion.s32Y;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.u32Width = ctx->stRegion.u32Width;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.stRect.u32Height =
		    ctx->stRegion.u32Height;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.enBlkSize = MOSAIC_BLK_SIZE_64;
		ctx->stRgnChnAttr.unChnAttr.stMosaicChn.u32Layer = ctx->u32Layer;
	} break;
	default:
		RK_LOGE("unsupport type %d.", ctx->stRgnAttr.enType);
		return RK_FAILURE;
	}

	s32Ret =
	    RK_MPI_RGN_SetDisplayAttr(ctx->rgnHandle, &ctx->stMppChn, &ctx->stRgnChnAttr);
	if (RK_SUCCESS != s32Ret) {
		RK_LOGE("RK_MPI_RGN_SetDisplayAttr (%d)) failed with %#x!", ctx->rgnHandle,
		        s32Ret);
		return RK_FAILURE;
	}

	if (ctx->st_osd_data.enable) {
		int normalized_screen_width = WEB_VIEW_RECT_W;
		int normalized_screen_height = WEB_VIEW_RECT_H;
		int video_width = ctx->stRegion.u32Width;
		int video_height = ctx->stRegion.u32Height;
		double x_rate = (double)video_width / (double)normalized_screen_width;
		double y_rate = (double)video_height / (double)normalized_screen_height;
		// init
		ctx->st_osd_data.enable = 1;
		ctx->st_osd_data.origin_x = UPALIGNTO16((int)(16 * x_rate));
		ctx->st_osd_data.origin_y = UPALIGNTO16((int)(16 * y_rate));
		ctx->st_osd_data.text.font_size = 64;
		ctx->st_osd_data.text.font_color = 0x808080;
		ctx->st_osd_data.text.color_inverse = 1;
		ctx->st_osd_data.text.font_path = FONT_PATH;
		s32Ret =
		    create_font(ctx->st_osd_data.text.font_path, ctx->st_osd_data.text.font_size);
		if (s32Ret != 0) {
			RK_LOGE("Failed create font!\n");
			return RK_FAILURE;
		}
	}
	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_RGN_DrawOsd(SAMPLE_RGN_CTX_S *ctx, RK_FLOAT Fps) {
	RK_S32 s32Ret = RK_SUCCESS;

	BITMAP_S stBitmap;
	time_t rawtime;
	struct tm *cur_time_info;
	static int last_time_sec;
	int wchar_cnt;
	char osd_append_char[128];
	char pre_record_char[128] = "Pre-Record Video";

	if (!ctx->st_osd_data.enable) {
		RK_LOGE("st_osd_data.enable must be enable\n");
		return RK_FAILURE;
	}
	time(&rawtime);
	cur_time_info = localtime(&rawtime);
	if (cur_time_info->tm_sec == last_time_sec)
		return s32Ret;
	else
		last_time_sec = cur_time_info->tm_sec;
	// generate time string.
	RK_LOGD("Fps %.1f\n", (float)Fps);
	sprintf(osd_append_char, " %.1fFPS", (float)Fps);
	wchar_cnt = generate_strings(ctx->st_osd_data.text.wch, MAX_WCH_BYTE, pre_record_char, osd_append_char);
	RK_LOGD("wchar_cnt = %d\n", wchar_cnt);
	if (wchar_cnt <= 0) {
		RK_LOGE("generate_date_time error\n");
		return -1;
	}
	// calculate really buffer size and allocate buffer for time string.
	ctx->st_osd_data.width =
	    UPALIGNTO16(wstr_get_actual_advance_x(ctx->st_osd_data.text.wch));
	ctx->st_osd_data.height = UPALIGNTO16(ctx->st_osd_data.text.font_size);
	ctx->st_osd_data.size =
	    ctx->st_osd_data.width * ctx->st_osd_data.height * 4; // BGRA8888 4byte
	ctx->st_osd_data.buffer = malloc(ctx->st_osd_data.size);
	RK_LOGD("ctx->st_osd_data.width %d, ctx->st_osd_data.height = %d, "
	        "ctx->st_osd_data.size = %d\n",
	        ctx->st_osd_data.width, ctx->st_osd_data.height, ctx->st_osd_data.size);
	memset(ctx->st_osd_data.buffer, 0xff, ctx->st_osd_data.size);
	// draw font in buffer
	fill_text(&ctx->st_osd_data);
	// set bitmap
	stBitmap.enPixelFormat = RK_FMT_ARGB8888;
	stBitmap.u32Width = ctx->st_osd_data.width;
	stBitmap.u32Height = ctx->st_osd_data.height;
	stBitmap.pData = (RK_VOID *)ctx->st_osd_data.buffer;
	s32Ret = RK_MPI_RGN_SetBitMap(ctx->rgnHandle, &stBitmap);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_RGN_SetBitMap failed with %#x\n", s32Ret);
	free(ctx->st_osd_data.buffer);
	return s32Ret;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
