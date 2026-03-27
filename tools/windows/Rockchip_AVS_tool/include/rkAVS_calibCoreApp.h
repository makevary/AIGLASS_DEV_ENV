#pragma once
#ifdef __cplusplus
extern "C" {
#endif

#if defined _WIN32 || defined __CYGWIN__
#ifdef BUILDING_DLL
#ifdef __GNUC__
#define DLL_PUBLIC __attribute__ ((dllexport))
#else
	// Note: actually gcc seems to also supports this syntax.
#define DLL_PUBLIC __declspec(dllexport)
#endif
#else
#ifdef __GNUC__
#define DLL_PUBLIC __attribute__ ((dllimport))
#else
	// Note: actually gcc seems to also supports this syntax.
#define DLL_PUBLIC
#endif
#define DLL_LOCAL
#endif
#else
#if __GNUC__ >= 4
#define DLL_PUBLIC __attribute__ ((visibility ("default")))
#define DLL_LOCAL  __attribute__ ((visibility ("hidden")))
#else
#define DLL_PUBLIC
#define DLL_LOCAL
#endif
#endif

#include <stdint.h>
#include <rkAVS_calibCommon.h>
	/*
	* @enum    rkAVS_CALIB_CAMERA_TYPE_E
	* @brief   Specify the camera type.
	* @note    Have pin hole, CMei, fisheye.
	*/
	typedef enum rkAVS_CALIB_CAMERA_TYPE_E {
		AVS_CAMERA_TYPE_PINHOLE = 0,											/**< PIN HOLE*/
		AVS_CAMERA_TYPE_OMN = 1,												/**< CMei*/
		AVS_CAMERA_TYPE_FISHEYE = 2,											/**<fisheye*/
	} AVS_CALIB_CAMERA_TYPE_E;


	/*
	* @enum    rkAVS_CALIB_BOARD_PARAMS_S
	* @brief   chess board params.
	*/
	typedef struct rkAVS_CALIB_BOARD_PARAMS_S
	{
		uint32_t u32BoardWidth;													/**<coners number of board width*/
		uint32_t u32BoardHeight;												/**<coners number of board height*/
		uint32_t u32SquareSize;													/**<square size*/
	}AVS_CALIB_BOARD_PARAMS_S;


	/*
	* @enum    rkAVS_CALIB_CAMERA_PARAMS_S
	* @brief   camera params.
	*/
	typedef struct rkAVS_CALIB_CAMERA_PARAMS_S
	{
		uint32_t u32CameraNum;													/**<camera numbers*/
		uint32_t u32CameraFov;													/**<camea fov*/
		AVS_CALIB_CAMERA_TYPE_E eCameraType;									/**<camera type*/
	}AVS_CALIB_CAMERA_PARAMS_S;


	/*
	* @enum    rkAVS_CALIB_MODEL_CONFIG_S
	* @brief  input params.
	*/
	typedef struct rkAVS_CALIB_MODEL_CONFIG_S
	{	
		AVS_CALIB_IMAGE_PARAMS_S stImageParams;									/**<image params*/
		AVS_CALIB_BOARD_PARAMS_S stBoardParams;									/**<board params*/
		AVS_CALIB_CAMERA_PARAMS_S stCameraParams;								/**<camera params*/
		uint32_t u32IsSaveCornersImage;											/**<is save corners image*/
		uint32_t u32UseAccurateMode;											/**<optimize by stitch*/
		const char* pcInputPath;												/**<calibration images path*/
		const char* pcOutputPath;                                               /**<calibration result path*/
		const char* pcImageNameFormat;											/**<image name format .yuv, .png, .jpg, .bmp*/
	}AVS_CALIB_MODEL_CONFIG_S;


	/*
	* @enum    rkAVS_STEREO_CALIB_CONFIG_S
	* @brief  input params.
	*/
	typedef struct rkAVS_STEREO_CALIB_CONFIG_S
	{
		AVS_CALIB_IMAGE_DATA_S stImageData[MAX_CAMERA_NUM];						/**<image params*/
		AVS_CALIB_BOARD_PARAMS_S stBoardParams;									/**<board params*/
		AVS_CALIB_CAMERA_PARAMS_S stCameraParams;								/**<camera params*/
		uint32_t u32IsSaveCornersImage;											/**<is save corners image*/
		uint32_t u32UseAccurateMode;											/**<optimize by stitch*/
		const char* pcTorrentPath;												/**<model calibration result path*/
		const char* pcCalibResultPath;											/**<calibration result path*/
	}AVS_STEREO_CALIB_CONFIG_S;


	/*
	* @enum   rkAVS_CALIB_FIND_POINTS_S
	* @brief  input params.
	*/
	typedef struct rkAVS_CALIB_FIND_POINTS_S
	{
		AVS_CALIB_IMAGE_DATA_S stImageData;										/**<image params*/
		AVS_CALIB_BOARD_PARAMS_S stBoardParams;									/**<board params*/
		const char* pcPointsImagePath;											/**<points image save path*/
	}AVS_CALIB_FIND_POINTS_S;

	/*
	* @enum    rkAVS_STEREO_CALIB_RMS_S
	* @brief  output params.
	*/
	typedef struct rkAVS_STEREO_CALIB_RMS_S
	{
		float f32LeftInternalRms;												/**<left camera internal rms*/
		float f32RightInternalRms;												/**<right camera internal rms*/
		float f32StereoExternalRms;												/**<external rms*/
	}AVS_STEREO_CALIB_RMS_S;


	/*
	* @enum    rkAVS_STEREO_CALIB_POSE_S
	* @brief  output params.
	*/
	typedef struct rkAVS_STEREO_CALIB_POSE_S
	{
		float f32RotationAngle[3];												/**<rotation*/
		float f32Translation[3];												/**<translation*/
	}AVS_STEREO_CALIB_POSE_S;


	/*
	* @enum    rkAVS_STEREO_CALIB_CHECK_S
	* @brief  output params.
	*/
	typedef struct rkAVS_STEREO_CALIB_CHECK_S
	{
		AVS_STEREO_CALIB_POSE_S stPose;											/**<external params*/
		AVS_STEREO_CALIB_RMS_S stRms;                                           /**<calibration rms*/
	}AVS_STEREO_CALIB_CHECK_S;


	/*
	* @enum    rkAVS_MULTI_PRODUCT_CONFIG_S
	* @brief  input params.
	*/
	typedef struct rkAVS_MULTI_PRODUCT_CONFIG_S
	{
		AVS_CALIB_IMAGE_PARAMS_S stImageParams;									/**<image params*/
		AVS_CALIB_BOARD_PARAMS_S stBoardParams;									/**<board params*/
		AVS_CALIB_CAMERA_PARAMS_S stCameraParams;								/**<camera params*/
		uint32_t u32IsRing;														/**<ring 0-1-2-3-4-0*/
		uint32_t u32IsVerify;													/**<verify calibration params*/
		uint32_t u32MultiProMode;												/**<multi product calibration mode*/
		uint32_t u32IsSaveCornersImage;											/**<is save corners image*/
		const char* pcInputPath;												/**<calibration images path*/
		const char* pcImageNameFormat;											/**<image name format .yuv, .png, .jpg, .bmp*/
		const char* pcTorrentPath;												/**<model calibration result path*/
		const char* pcCalibResultPath;											/**<calibration result path*/
	}AVS_MULTI_PRODUCT_CONFIG_S;

	DLL_PUBLIC int32_t rkAVS_getCalibVersion(char avsToolVersion[128]);
	DLL_PUBLIC int32_t rkAVS_findPoints(AVS_CALIB_FIND_POINTS_S* psInputParams);
	DLL_PUBLIC int32_t rkAVS_calibModel(AVS_CALIB_MODEL_CONFIG_S* psInputParams, AVS_STEREO_CALIB_CHECK_S* stStereoCheckParams);
	DLL_PUBLIC int32_t rkAVS_calibProductStereo(AVS_STEREO_CALIB_CONFIG_S* psInputParams, AVS_STEREO_CALIB_CHECK_S* stStereoCheckParams);
	DLL_PUBLIC int32_t rkAVS_calibProductMulti(AVS_MULTI_PRODUCT_CONFIG_S* psInputParams, AVS_STEREO_CALIB_CHECK_S* stMultiCheckParams);
	DLL_PUBLIC int32_t rkAVS_verifyProductStereo(AVS_STEREO_CALIB_CONFIG_S* psInputParams, float* stereoRms);
#ifdef __cplusplus
} /* extern "C" { */
#endif