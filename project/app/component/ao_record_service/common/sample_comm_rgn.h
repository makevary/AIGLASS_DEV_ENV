#ifndef __SAMPLE_COMM_RGN_H__
#define __SAMPLE_COMM_RGN_H__

#include "rk_mpi_rgn.h"
#include "utils.h"
#include "font_factory.h"
#include "rk_mpi_sys.h"
#include "common.h"

#define WEB_VIEW_RECT_W 704
#define WEB_VIEW_RECT_H 480
#define MAX_WCH_BYTE 256

#define UPALIGNTO(value, align) ((value + align - 1) & (~(align - 1)))
#define UPALIGNTO2(value) UPALIGNTO(value, 2)
#define UPALIGNTO4(value) UPALIGNTO(value, 4)
#define UPALIGNTO16(value) UPALIGNTO(value, 16)
#define DOWNALIGNTO16(value) (UPALIGNTO(value, 16) - 16)
#define MULTI_UPALIGNTO16(grad, value) UPALIGNTO16((int)(grad * value))

/* rgn font path */
#define FONT_PATH					"/oem/usr/share/simsun_en.ttf"

typedef struct text_data {
	wchar_t wch[MAX_WCH_BYTE];
	unsigned int font_size;
	unsigned int font_color;
	unsigned int color_inverse;
	const char *font_path;
	char format[128];
} text_data_s;

typedef struct border_data {
	int color_index;
	int color_key;
	int thick;
	int display_style;
} border_data_s;

typedef struct osd_data {
	int type;
	union {
		const char *image;
		text_data_s text;
		border_data_s border;
	};
	int width;
	int height;
	unsigned char *buffer;
	unsigned int size;
	int origin_x;
	int origin_y;
	int enable;
} osd_data_s;

typedef struct _rkMpiRGNCtx {
	const char *srcFileBmpName;
	RK_BOOL bDrawBmpManual;
	RK_U32 u32BmpFormat;
	RK_U32 u32BgAlpha;
	RK_U32 u32FgAlpha;
	BITMAP_S stBitmap;
	MPP_CHN_S stMppChn;
	RECT_S stRegion;
	RK_U32 u32Color;
	RK_U32 u32Layer;
	RK_U64 u64LastUpdateTs; // record last update timestamp for osd
	RGN_HANDLE rgnHandle;
	RGN_ATTR_S stRgnAttr;
	RGN_CHN_ATTR_S stRgnChnAttr;
	osd_data_s st_osd_data;
} SAMPLE_RGN_CTX_S;


RK_S32 SAMPLE_COMM_RGN_CreateChn(SAMPLE_RGN_CTX_S *ctx);
RK_S32 SAMPLE_COMM_RGN_DrawOsd(SAMPLE_RGN_CTX_S *ctx, RK_FLOAT Fps);
//RK_S32 SAMPLE_COMM_RGN_DestroyChn(SAMPLE_RGN_CTX_S *ctx);

#endif
