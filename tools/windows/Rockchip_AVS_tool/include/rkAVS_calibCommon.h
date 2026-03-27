#pragma once
#ifndef __AVS_CALIB_PUBLIC_H__
#define __AVS_CALIB_PUBLIC_H__

#include <stdint.h>
#define MAX_CAMERA_NUM 8
/*
* @enum    rkAVS_CALIB_STATUS_E
* @brief   the return status of function
*/
typedef enum rkAVS_CALIB_STATUS_E
{
	RK_AVS_CALIB_STATUS_EOF = -1,									/**< error of function inside */
	RK_AVS_CALIB_STATUS_OK = 0,										/**< run successfully */
	RK_AVS_CALIB_STATUS_FILE_READ_ERROR,							/**< error: fail to read file */
	RK_AVS_CALIB_STATUS_FILE_WRITE_ERROR,							/**< error: fail to write file */
	RK_AVS_CALIB_STATUS_INVALID_PARAM,								/**< error: invalid parameter */
	RK_AVS_CALIB_STATUS_ALLOC_FAILED,								/**< error: fail to alloc buffer */
	RK_AVS_CALIB_STATUS_BUTT										/**< reserved fields */
}AVS_CALIB_STATUS_E;

/*
* @enum    rkAVS_CALIB_IMAGE_FORMAT_E
* @brief   Specify the image format.
* @note    Have gray, rgb, yuvnv12.
*/
typedef enum rkAVS_CALIB_IMAGE_FORMAT_E {
	RK_AVS_IMAGE_FORMAT_TYPE_GRAY = 0,								/**<gray format*/
	RK_AVS_IMAGE_FORMAT_TYPE_RGB = 1,								/**<rgb format*/
	RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12 = 2,							/**<yuvnv12 format*/
} AVS_CALIB_IMAGE_FORMAT_E;

/*
* @enum    rkAVS_CALIB_IMAGE_PARAMS_S
* @brief   calibration image params.
*/
typedef struct rkAVS_CALIB_IMAGE_PARAMS_S
{
	uint32_t u32ImageWidth;											/**<image width*/
	uint32_t u32ImageHeight;										/**<image height*/
	uint32_t u32ImageStride;										/**<image stride*/
	AVS_CALIB_IMAGE_FORMAT_E eImageFormat;							/**<image format*/
}AVS_CALIB_IMAGE_PARAMS_S;

/*
* @enum    rkAVS_CALIB_IMAGE_PARAMS_S
* @brief   calibration image data.
*/
typedef struct rkAVS_CALIB_IMAGE_DATA_S
{
	AVS_CALIB_IMAGE_PARAMS_S stImageParams;                         /**<image params*/        
	uint8_t* pu8ImageData;											/**<image data*/    
}AVS_CALIB_IMAGE_DATA_S;
#endif // !__AVS_CALIB_PUBLIC_H__