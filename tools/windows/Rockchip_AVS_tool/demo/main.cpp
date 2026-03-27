#include "rkAVS_calibCoreApp.h"
#include <opencv2/opencv.hpp>
#include <string>
#include <fstream>
#include <sstream>
#ifdef _WIN32
#include <time.h>
#else
#include <sys/time.h>
#endif
#define USE_EXE 1
void help()
{
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);
	printf("************Avs calib tool input params help**************\n");
	printf("                 -h: input params help\n");
	printf("                 -m: when m = 0 select model calib,m = 1 select product calib,m = 2 select product verify,m = 3 select find points\n");
	printf("                 -c: config path\n");
}

//保存产线标定筛选参数
int saveCheckParams(std::string saveThreshPath, AVS_STEREO_CALIB_CHECK_S* stereoCalibCheck)
{
	std::ofstream fout(saveThreshPath);
	if (!fout)
	{
		std::cout << "Open save_thresh_path fail!" << std::endl;
		return 0;
	}
	else
	{
		fout << "leftInternalRms: " << stereoCalibCheck->stRms.f32LeftInternalRms << std::endl;
		fout << "rightInternalRms: " << stereoCalibCheck->stRms.f32RightInternalRms << std::endl;
		fout << "externalRms: " << stereoCalibCheck->stRms.f32StereoExternalRms << std::endl;
		fout << "euler_angles_x: " << stereoCalibCheck->stPose.f32RotationAngle[0] << std::endl;
		fout << "euler_angles_y: " << stereoCalibCheck->stPose.f32RotationAngle[1] << std::endl;
		fout << "euler_angles_z: " << stereoCalibCheck->stPose.f32RotationAngle[2] << std::endl;
		fout << "t_x: " << stereoCalibCheck->stPose.f32Translation[0] << std::endl;
		fout << "t_y: " << stereoCalibCheck->stPose.f32Translation[1] << std::endl;
		fout << "t_z: " << stereoCalibCheck->stPose.f32Translation[2] << std::endl;
		//fout << "is_calib_succeed: " << is_succ << std::endl;
	}
	fout.close();
	return 1;
}
bool readBinParams(std::string image_path, char* output_params, uint64_t length)
{
	std::ifstream fin;
	//读取raw图
	fin.open(image_path, std::ios::binary);
	if (!fin) {
		std::cerr << "open failed: " << image_path << std::endl;
		return false;
	}
	// read函数读取（拷贝）流中的length各字节到buffer
	fin.read((char*)output_params, length);
	fin.close();
	return true;
}

bool writeBinParams(std::string image_path, char* output_params, uint64_t length)
{
	std::ofstream fout;
	//读取raw图
	fout.open(image_path, std::ios::binary);
	if (!fout) {
		std::cerr << "open failed: " << image_path << std::endl;
		return false;
	}
	// read函数读取（拷贝）流中的length各字节到buffer
	fout.write((char*)output_params, length);
	fout.close();
	return true;
}

//模型标定读取配置文件
int readCalibModelConfig(std::string readPath, std::vector<std::string>& stringData, std::vector<int32_t>& int32Data)
{
	std::string stringLine;
	std::ifstream ifs(readPath, std::ifstream::in);
	if (ifs.fail())
	{
		std::cout << "read calib model config fail!" << std::endl;
	}
	int32_t lineNum = 0;
	int32_t valueData = 0;
	while (getline(ifs, stringLine))
	{
		std::stringstream ss(stringLine);
		std::string stringUnit;
		std::getline(ss, stringUnit, ' ');
		std::getline(ss, stringUnit, ' ');
		if (lineNum < 3)
		{
			stringData.push_back(stringUnit);
		}
		else
		{
			valueData = atoi(stringUnit.c_str());
			int32Data.push_back(valueData);
		}
		lineNum++;
	}
	ifs.close();
	return 0;
}
//产线标定读取配置文件
int readCalibProdectConfig(std::string readPath, std::vector<std::string>& stringData, std::vector<int32_t>& int32Data)
{
	std::string stringLine;
	std::ifstream ifs(readPath, std::ifstream::in);
	if (ifs.fail())
	{
		std::cout << "read calib product config fail!" << std::endl;
	}
	int32_t lineNum = 0;
	int32_t valueData = 0;
	while (getline(ifs, stringLine))
	{
		std::stringstream ss(stringLine);
		std::string stringUnit;
		std::getline(ss, stringUnit, ' ');
		std::getline(ss, stringUnit, ' ');
		if (lineNum < 4)
		{
			stringData.push_back(stringUnit);
		}
		else
		{
			valueData = atoi(stringUnit.c_str());
			int32Data.push_back(valueData);
		}
		lineNum++;
	}
	ifs.close();
	return 0;
}


//多目产线标定读取配置文件
int readMultiCalibProdectConfig(std::string readPath, std::vector<std::string>& stringData, std::vector<int32_t>& int32Data)
{
	std::string stringLine;
	std::ifstream ifs(readPath, std::ifstream::in);
	if (ifs.fail())
	{
		std::cout << "read calib product config fail!" << std::endl;
	}
	int32_t lineNum = 0;
	int32_t valueData = 0;
	while (getline(ifs, stringLine))
	{
		std::stringstream ss(stringLine);
		std::string stringUnit;
		std::getline(ss, stringUnit, ' ');
		std::getline(ss, stringUnit, ' ');
		if (lineNum < 4)
		{
			stringData.push_back(stringUnit);
		}
		else
		{
			valueData = atoi(stringUnit.c_str());
			int32Data.push_back(valueData);
		}
		lineNum++;
	}
	ifs.close();
	return 0;
}

//角点提取读取配置文件
int readFindPointsConfig(std::string readPath, std::vector<std::string>& stringData, std::vector<int32_t>& int32Data)
{
	std::string stringLine;
	std::ifstream ifs(readPath, std::ifstream::in);
	if (ifs.fail())
	{
		std::cout << "read calib product config fail!" << std::endl;
	}
	int32_t lineNum = 0;
	int32_t valueData = 0;
	while (getline(ifs, stringLine))
	{
		std::stringstream ss(stringLine);
		std::string stringUnit;
		std::getline(ss, stringUnit, ' ');
		std::getline(ss, stringUnit, ' ');
		if (lineNum < 2)
		{
			stringData.push_back(stringUnit);
		}
		else
		{
			valueData = atoi(stringUnit.c_str());
			int32Data.push_back(valueData);
		}
		lineNum++;
	}
	ifs.close();
	return 0;
}


//产线标定读取配置文件
int readMultiCalibProdectConfig(std::string readPath, std::vector<std::string>& stringData, std::vector<int32_t>& int32Data, int32_t s32CamNum, int32_t isRingCalib)
{
	std::string stringLine;
	std::ifstream ifs(readPath, std::ifstream::in);
	if (ifs.fail())
	{
		std::cout << "read calib product config fail!" << std::endl;
	}
	int32_t lineNum = 0;
	int32_t valueData = 0;
	int32_t stringNum = (s32CamNum - 1) * 2 + 1;
	if (isRingCalib)
		stringNum += 2;
	while (getline(ifs, stringLine))
	{
		std::stringstream ss(stringLine);
		std::string stringUnit;
		std::getline(ss, stringUnit, ' ');
		std::getline(ss, stringUnit, ' ');
		if (lineNum < stringNum)
		{
			stringData.push_back(stringUnit);
		}
		else
		{
			valueData = atoi(stringUnit.c_str());
			int32Data.push_back(valueData);
		}
		lineNum++;
	}
	ifs.close();
	return 0;
}

//模型标定Demo
int calibModelDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readCalibModelConfig(configPath, stringData, int32Data);
	std::string input_calib_image_path = stringData[0]; //标定图像所在路径
	std::string output_calib_result_path = stringData[1] + "rk_" + std::to_string(int32Data[0]) + "_camera_result.xml";
	std::string input_image_format = stringData[2];  //标定图像后缀名
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);
	//初始化参数
	AVS_CALIB_MODEL_CONFIG_S stInputParams;
	//相机规格
	stInputParams.stCameraParams.u32CameraFov = int32Data[2];
	stInputParams.stCameraParams.u32CameraNum = int32Data[0];
	switch (int32Data[1])
	{
	case 0:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_PINHOLE;
		break;
	case 1:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_OMN;
		break;
	case 2:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_FISHEYE;
		break;
	default:
		std::cout << "RK_AVS_CALIB: CameraType error!" << std::endl;
		return 1;
	}
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[3];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[4];
	stInputParams.stBoardParams.u32SquareSize = int32Data[5];
	//图像规格
	stInputParams.pcImageNameFormat = input_image_format.c_str();
	switch (int32Data[9])
	{
	case 0:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		break;
	case 1:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		break;
	case 2:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}
	stInputParams.stImageParams.u32ImageHeight = int32Data[7];
	stInputParams.stImageParams.u32ImageWidth = int32Data[6];
	if (stInputParams.stImageParams.eImageFormat == RK_AVS_IMAGE_FORMAT_TYPE_RGB)
		stInputParams.stImageParams.u32ImageStride = stInputParams.stImageParams.u32ImageWidth * 3;
	else
		stInputParams.stImageParams.u32ImageStride = int32Data[8];
	//输入输出路径
	stInputParams.pcInputPath = input_calib_image_path.c_str();
	stInputParams.pcOutputPath = output_calib_result_path.c_str();
	//功能开关
	stInputParams.u32IsSaveCornersImage = int32Data[10];
	stInputParams.u32UseAccurateMode = int32Data[11];
	//模型标定
	AVS_STEREO_CALIB_CHECK_S stStereoCheckParams;
	rkAVS_calibModel(&stInputParams, &stStereoCheckParams);
	//保存产线筛选参数
	std::string saveCheckPath = stringData[1] + "modelCheckParams.txt";
	saveCheckParams(saveCheckPath, &stStereoCheckParams);
	return 0;
}


//产线标定Demo
int stereoCalibProdDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readCalibProdectConfig(configPath, stringData, int32Data);
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);

	//初始化参数
	AVS_STEREO_CALIB_CONFIG_S stInputParams;
	//相机规格
	stInputParams.stCameraParams.u32CameraNum = int32Data[0];
	stInputParams.stCameraParams.u32CameraFov = int32Data[2];
	switch (int32Data[1])
	{
	case 0:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_PINHOLE;
		break;
	case 1:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_OMN;
		break;
	case 2:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_FISHEYE;
		break;
	default:
		std::cout << "RK_AVS_CALIB: CameraType error!" << std::endl;
		return 1;
	}
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[3];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[4];
	stInputParams.stBoardParams.u32SquareSize = int32Data[5];
	//图像读取路径
	std::string leftImagePath = stringData[0];
	std::string rightImagePath = stringData[1];
	//图像规格
	uint8_t* leftImage;
	uint8_t* rightImage;
	cv::Mat leftImageMat, rightImageMat;
	int32_t leftDataSize, rightDataSize;
	for (int32_t cam = 0; cam < stInputParams.stCameraParams.u32CameraNum; cam++)
	{
		stInputParams.stImageData[cam].stImageParams.u32ImageWidth = int32Data[6 + cam * 3];
		stInputParams.stImageData[cam].stImageParams.u32ImageHeight = int32Data[7 + cam * 3];
		stInputParams.stImageData[cam].stImageParams.u32ImageStride = int32Data[8 + cam * 3];
	}
	switch (int32Data[12])
	{
	case 0:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		leftImageMat = cv::imread(leftImagePath, 0);
		rightImageMat = cv::imread(rightImagePath, 0);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		break;
	case 1:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		leftImageMat = cv::imread(leftImagePath, 1);
		rightImageMat = cv::imread(rightImagePath, 1);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		break;
	case 2:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		leftDataSize = stInputParams.stImageData[0].stImageParams.u32ImageStride * stInputParams.stImageData[0].stImageParams.u32ImageHeight * 3 / 2;
		rightDataSize = stInputParams.stImageData[1].stImageParams.u32ImageStride * stInputParams.stImageData[1].stImageParams.u32ImageHeight * 3 / 2;
		leftImageMat = cv::Mat(stInputParams.stImageData[0].stImageParams.u32ImageHeight * 3 / 2, stInputParams.stImageData[0].stImageParams.u32ImageStride, CV_8UC1);
		rightImageMat = cv::Mat(stInputParams.stImageData[1].stImageParams.u32ImageHeight * 3 / 2, stInputParams.stImageData[1].stImageParams.u32ImageStride, CV_8UC1);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		readBinParams(leftImagePath, (char*)leftImage, leftDataSize);
		readBinParams(rightImagePath, (char*)rightImage, rightDataSize);
		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}

	//功能开关
	stInputParams.u32IsSaveCornersImage = int32Data[13];
	stInputParams.u32UseAccurateMode = int32Data[14];
	//输入种子文件路径
	stInputParams.pcTorrentPath = stringData[3].c_str();
	//输入输出路径
	std::string calibResultPath = stringData[2] + "rk_2_camera_result.xml";
	stInputParams.pcCalibResultPath = calibResultPath.c_str();

	//读取图像
	stInputParams.stImageData[0].pu8ImageData = leftImage;
	stInputParams.stImageData[1].pu8ImageData = rightImage;

	//计时函数
#ifdef _WIN32
	clock_t startTime, endTime, timeAll;
	startTime = clock();
#else
	struct timeval startTime, endTime;// 秒+微妙
	time_t timeAll, timeAll_us;
	gettimeofday(&startTime, NULL);
#endif
	/***********************************************产线拼接*************************************************/
	AVS_STEREO_CALIB_CHECK_S stStereoCheckParams;
	int32_t status = rkAVS_calibProductStereo(&stInputParams, &stStereoCheckParams);
	if (status)
	{
		printf("rkAVS_calibProductStrreo fail!\n");
	}
	else
	{
		printf("rkAVS_calibProductStrreo OK!\n");
	}
#ifdef _WIN32
	endTime = clock();
	timeAll = endTime - startTime;
	printf("rkAVS_calibProductStrreo: %d ms\n", timeAll);
#else
	gettimeofday(&endTime, NULL);
	timeAll_us = 1000000 * (endTime.tv_sec - startTime.tv_sec) + (endTime.tv_usec - startTime.tv_usec);
	printf("rkAVS_calibProductStrreo: %d us\n", timeAll_us);
#endif
	//保存产线筛选参数
	std::string saveCheckPath = stringData[2] + "productCheckParams.txt";
	saveCheckParams(saveCheckPath, &stStereoCheckParams);
	return 0;
}


//产线标定验证Demo
int stereoVerifyProdDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readCalibProdectConfig(configPath, stringData, int32Data);
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);

	//初始化参数
	AVS_STEREO_CALIB_CONFIG_S stInputParams;
	//相机规格
	stInputParams.stCameraParams.u32CameraNum = int32Data[0];
	stInputParams.stCameraParams.u32CameraFov = int32Data[2];
	switch (int32Data[1])
	{
	case 0:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_PINHOLE;
		break;
	case 1:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_OMN;
		break;
	case 2:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_FISHEYE;
		break;
	default:
		std::cout << "RK_AVS_CALIB: CameraType error!" << std::endl;
		return 1;
	}
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[3];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[4];
	stInputParams.stBoardParams.u32SquareSize = int32Data[5];
	//图像读取路径
	std::string leftImagePath = stringData[0];
	std::string rightImagePath = stringData[1];
	//图像规格
	uint8_t* leftImage;
	uint8_t* rightImage;
	cv::Mat leftImageMat, rightImageMat;
	int32_t leftDataSize, rightDataSize;
	for (int32_t cam = 0; cam < stInputParams.stCameraParams.u32CameraNum; cam++)
	{
		stInputParams.stImageData[cam].stImageParams.u32ImageWidth = int32Data[6 + cam * 3];
		stInputParams.stImageData[cam].stImageParams.u32ImageHeight = int32Data[7 + cam * 3];
		stInputParams.stImageData[cam].stImageParams.u32ImageStride = int32Data[8 + cam * 3];
	}
	switch (int32Data[12])
	{
	case 0:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		leftImageMat = cv::imread(leftImagePath, 0);
		rightImageMat = cv::imread(rightImagePath, 0);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		break;
	case 1:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		leftImageMat = cv::imread(leftImagePath, 1);
		rightImageMat = cv::imread(rightImagePath, 1);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		break;
	case 2:
		stInputParams.stImageData[0].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		stInputParams.stImageData[1].stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		leftDataSize = stInputParams.stImageData[0].stImageParams.u32ImageStride * stInputParams.stImageData[0].stImageParams.u32ImageHeight * 3 / 2;
		rightDataSize = stInputParams.stImageData[1].stImageParams.u32ImageStride * stInputParams.stImageData[1].stImageParams.u32ImageHeight * 3 / 2;
		leftImageMat = cv::Mat(stInputParams.stImageData[0].stImageParams.u32ImageHeight * 3 / 2, stInputParams.stImageData[0].stImageParams.u32ImageStride, CV_8UC1);
		rightImageMat = cv::Mat(stInputParams.stImageData[1].stImageParams.u32ImageHeight * 3 / 2, stInputParams.stImageData[1].stImageParams.u32ImageStride, CV_8UC1);
		leftImage = leftImageMat.ptr<uint8_t>(0);
		rightImage = rightImageMat.ptr<uint8_t>(0);
		readBinParams(leftImagePath, (char*)leftImage, leftDataSize);
		readBinParams(rightImagePath, (char*)rightImage, rightDataSize);

		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}
	//功能开关
	stInputParams.u32IsSaveCornersImage = int32Data[13];
	stInputParams.u32UseAccurateMode = int32Data[14];
	//输入种子文件路径
	stInputParams.pcTorrentPath = NULL;
	//输入输出路径
	std::string calibResultPath = stringData[2] + "rk_2_camera_result.xml";           //标定参数所在的输入路径
	stInputParams.pcCalibResultPath = calibResultPath.c_str();

	//读取图像
	stInputParams.stImageData[0].pu8ImageData = leftImage;
	stInputParams.stImageData[1].pu8ImageData = rightImage;
	//模型标定

		//计时函数
#ifdef _WIN32
	clock_t startTime, endTime, timeAll;
	startTime = clock();
#else
	struct timeval startTime, endTime;// 秒+微妙
	time_t timeAll, timeAll_us;
	gettimeofday(&startTime, NULL);
#endif
	/***********************************************产线拼接*************************************************/
	float stVerifyRms;
	int32_t status = rkAVS_verifyProductStereo(&stInputParams, &stVerifyRms);
	if (status)
	{
		printf("rkAVS_calibProductStrreo fail!\n");
	}
#ifdef _WIN32
	endTime = clock();
	timeAll = endTime - startTime;
	printf("rkAVS_verifyProductStrreo: %d ms\n", timeAll);
#else
	gettimeofday(&endTime, NULL);
	timeAll_us = 1000000 * (endTime.tv_sec - startTime.tv_sec) + (endTime.tv_usec - startTime.tv_usec);
	printf("rkAVS_verifyProductStrreo: %d us\n", timeAll_us);
#endif
	printf("verify rms is: %f", stVerifyRms);
	return 0;
}


//角点提取Demo
int findPointsDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readFindPointsConfig(configPath, stringData, int32Data);
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);

	//初始化参数
	AVS_CALIB_FIND_POINTS_S stInputParams;
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[0];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[1];
	stInputParams.stBoardParams.u32SquareSize = int32Data[2];
	//图像读取路径
	std::string srcImagePath = stringData[0];
	std::string dstImagePath = stringData[1];
	//图像规格
	uint8_t* pu8SrcImage;
	cv::Mat imageMat;
	int32_t dataSize;
	stInputParams.stImageData.stImageParams.u32ImageWidth = int32Data[3];
	stInputParams.stImageData.stImageParams.u32ImageHeight = int32Data[4];
	stInputParams.stImageData.stImageParams.u32ImageStride = int32Data[5];

	switch (int32Data[6])
	{
	case 0:
		stInputParams.stImageData.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		imageMat = cv::imread(srcImagePath, 0);
		pu8SrcImage = imageMat.ptr<uint8_t>(0);
		break;
	case 1:
		stInputParams.stImageData.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		imageMat = cv::imread(srcImagePath, 1);
		pu8SrcImage = imageMat.ptr<uint8_t>(0);
		break;
	case 2:
		stInputParams.stImageData.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		dataSize = stInputParams.stImageData.stImageParams.u32ImageStride * stInputParams.stImageData.stImageParams.u32ImageHeight * 3 / 2;	
		imageMat = cv::Mat(stInputParams.stImageData.stImageParams.u32ImageHeight * 3 / 2, stInputParams.stImageData.stImageParams.u32ImageStride, CV_8UC1);
		pu8SrcImage = imageMat.ptr<uint8_t>(0);
		readBinParams(srcImagePath, (char*)pu8SrcImage, dataSize);
		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}
	//输入输出路径
	stInputParams.pcPointsImagePath = dstImagePath.c_str();
	//读取图像
	stInputParams.stImageData.pu8ImageData = pu8SrcImage;

	//计时函数
#ifdef _WIN32
	clock_t startTime, endTime, timeAll;
	startTime = clock();
#else
	struct timeval startTime, endTime;// 秒+微妙
	time_t timeAll, timeAll_us;
	gettimeofday(&startTime, NULL);
#endif
	/***********************************************角点提取*************************************************/
	float stVerifyRms;
	int32_t status = rkAVS_findPoints(&stInputParams);
	if (status)
	{
		printf("rkAVS_calibFindPoints fail!\n");
	}
#ifdef _WIN32
	endTime = clock();
	timeAll = endTime - startTime;
	printf("rkAVS_calibFindPoints: %d ms\n", timeAll);
#else
	gettimeofday(&endTime, NULL);
	timeAll_us = 1000000 * (endTime.tv_sec - startTime.tv_sec) + (endTime.tv_usec - startTime.tv_usec);
	printf("rkAVS_verifyProductStrreo: %d us\n", timeAll_us);
#endif
	return 0;
}


int32_t multiProductCalibDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readMultiCalibProdectConfig(configPath, stringData, int32Data);
	std::string input_calib_image_path = stringData[0]; //标定图像所在路径
	std::string output_calib_result_path = stringData[1] + "rk_" + std::to_string(int32Data[0]) + "_camera_result.xml";
	std::string calib_torrent_path = stringData[2]; 
	std::string input_image_format = stringData[3];  //标定图像后缀名
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);
	//初始化参数
	AVS_MULTI_PRODUCT_CONFIG_S stInputParams;
	//相机规格
	stInputParams.stCameraParams.u32CameraFov = int32Data[2];
	stInputParams.stCameraParams.u32CameraNum = int32Data[0];
	switch (int32Data[1])
	{
	case 0:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_PINHOLE;
		break;
	case 1:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_OMN;
		break;
	case 2:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_FISHEYE;
		break;
	default:
		std::cout << "RK_AVS_CALIB: CameraType error!" << std::endl;
		return 1;
	}
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[3];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[4];
	stInputParams.stBoardParams.u32SquareSize = int32Data[5];
	//图像规格
	stInputParams.pcImageNameFormat = input_image_format.c_str();
	switch (int32Data[9])
	{
	case 0:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		break;
	case 1:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		break;
	case 2:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}
	stInputParams.stImageParams.u32ImageHeight = int32Data[7];
	stInputParams.stImageParams.u32ImageWidth = int32Data[6];
	if (stInputParams.stImageParams.eImageFormat == RK_AVS_IMAGE_FORMAT_TYPE_RGB)
		stInputParams.stImageParams.u32ImageStride = stInputParams.stImageParams.u32ImageWidth * 3;
	else
		stInputParams.stImageParams.u32ImageStride = int32Data[8];
	//输入输出路径
	stInputParams.pcInputPath = input_calib_image_path.c_str();
	stInputParams.pcCalibResultPath = output_calib_result_path.c_str();
	stInputParams.pcTorrentPath = calib_torrent_path.c_str();
	//功能开关
	stInputParams.u32IsSaveCornersImage = int32Data[10];
	stInputParams.u32MultiProMode = int32Data[11];
	stInputParams.u32IsRing = int32Data[12];
	stInputParams.u32IsVerify = int32Data[13];
	//多目产线标定
	AVS_STEREO_CALIB_CHECK_S stStereoCheckParams;
	rkAVS_calibProductMulti(&stInputParams, &stStereoCheckParams);
	//保存产线筛选参数
	std::string saveCheckPath = stringData[1] + "multiProductCheckParams.txt";
	saveCheckParams(saveCheckPath, &stStereoCheckParams);
	return 0;
}



int32_t multiProductVerifyDemo(std::string configPath)
{
	std::vector<std::string> stringData;
	std::vector<int32_t> int32Data;
	readMultiCalibProdectConfig(configPath, stringData, int32Data);
	std::string input_calib_image_path = stringData[0]; //标定图像所在路径
	std::string output_calib_result_path = stringData[1] + "rk_" + std::to_string(int32Data[0]) + "_camera_result.xml";
	std::string calib_torrent_path = stringData[1] + "rk_" + std::to_string(int32Data[0]) + "_camera_result.xml";
	std::string input_image_format = stringData[3];  //标定图像后缀名
	//获取版本信息
	char avsCalibVersion[128];
	rkAVS_getCalibVersion(avsCalibVersion);
	//初始化参数
	AVS_MULTI_PRODUCT_CONFIG_S stInputParams;
	//相机规格
	stInputParams.stCameraParams.u32CameraFov = int32Data[2];
	stInputParams.stCameraParams.u32CameraNum = int32Data[0];
	switch (int32Data[1])
	{
	case 0:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_PINHOLE;
		break;
	case 1:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_OMN;
		break;
	case 2:
		stInputParams.stCameraParams.eCameraType = AVS_CAMERA_TYPE_FISHEYE;
		break;
	default:
		std::cout << "RK_AVS_CALIB: CameraType error!" << std::endl;
		return 1;
	}
	//棋盘格规格
	stInputParams.stBoardParams.u32BoardWidth = int32Data[3];
	stInputParams.stBoardParams.u32BoardHeight = int32Data[4];
	stInputParams.stBoardParams.u32SquareSize = int32Data[5];
	//图像规格
	stInputParams.pcImageNameFormat = input_image_format.c_str();
	switch (int32Data[9])
	{
	case 0:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_GRAY;
		break;
	case 1:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_RGB;
		break;
	case 2:
		stInputParams.stImageParams.eImageFormat = RK_AVS_IMAGE_FORMAT_TYPE_YUVNV12;
		break;
	default:
		std::cout << "RK_AVS_CALIB: ImageFormate error!" << std::endl;
		return 1;
	}
	stInputParams.stImageParams.u32ImageHeight = int32Data[7];
	stInputParams.stImageParams.u32ImageWidth = int32Data[6];
	if (stInputParams.stImageParams.eImageFormat == RK_AVS_IMAGE_FORMAT_TYPE_RGB)
		stInputParams.stImageParams.u32ImageStride = stInputParams.stImageParams.u32ImageWidth * 3;
	else
		stInputParams.stImageParams.u32ImageStride = int32Data[8];
	//输入输出路径
	stInputParams.pcInputPath = input_calib_image_path.c_str();
	stInputParams.pcCalibResultPath = output_calib_result_path.c_str();
	stInputParams.pcTorrentPath = calib_torrent_path.c_str();
	//功能开关
	stInputParams.u32IsSaveCornersImage = int32Data[10];
	stInputParams.u32MultiProMode = int32Data[11];
	stInputParams.u32IsRing = int32Data[12];
	stInputParams.u32IsVerify = int32Data[13];
	//产线验证
	AVS_STEREO_CALIB_CHECK_S stStereoCheckParams;
	rkAVS_calibProductMulti(&stInputParams, &stStereoCheckParams);
	//保存产线筛选参数
	std::string saveCheckPath = stringData[1] + "multiVerifyCheckParams.txt";
	saveCheckParams(saveCheckPath, &stStereoCheckParams);
	return 0;
}
int main(int argc, char** argv)
{
#if USE_EXE
	cv::CommandLineParser parser(argc, argv,
		"{h||}{m||}{c||}");
	if (parser.has("h"))
	{
		help();
		return 0;
	}

	if (argc < 3)
	{
		printf("Input params not enough!\n");
		help();
		return 0;
	}

	if (!parser.has("m"))
	{
		printf("Please select calib mode!\n");
		return 0;
	}
	if (!parser.has("c"))
	{
		printf("Please input calib config path!\n");
		return 0;
	}

	int32_t calibMode = parser.get<int>("m");
	std::string configPath = parser.get<std::string>("c");
#else
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20240607_anke/calib_data/20240607_modelCalib/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20211123_calibration_data_3588/20231224_keda_model/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230614_dgModel/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230705_guangdianModel/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230615_hanhuiCalib/20230615_hanhuiModel_label0/calibModelConfig.txt";

	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20240619_chuangmiModel/calibModelConfig.txt";

	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20211123_calibration_data_3588/20240708_honghe_model/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20211123_calibration_data_3588/20211210_label11_calibration_data/calibModelConfig.txt";
	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/xuda/PanoramaDataset/rk_4_camera/No.01/calibModelConfig.txt";
	//int32_t calibMode = 4;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20211123_calibration_data_3588/20230526_camera4_productCalib/calibMultiProductConfig.txt";
	// 
	//int32_t calibMode = 5;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20211123_calibration_data_3588/20230526_camera4_productCalib/calibMultiVerifyConfig.txt";

	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20240125_tuokuoModel/calibModelConfig.txt";
	// 
	//int32_t calibMode = 2;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230227_algo11_productCalib/verifyProductConfig .txt";
	 
	int32_t calibMode = 1;
	std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20240826_chuangmiProduct/calibProductConfig.txt";

	//int32_t calibMode = 0;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230614_dgModelTest/calibModelConfig.txt";

	//int32_t calibMode = 1;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230614_dgProduct_1/calibProductConfig.txt";
	//int32_t calibMode = 1;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230615_hanhuiCalib/20230620_hanhuiProduct_label1/calibProductConfig.txt";
	//int32_t calibMode = 1;
	//std::string configPath = "H:/users/lmp/rk_panorama_stitch_data/20221123_calibration_data_1106/20230607_hanhui/calibProductConfig.txt";
#endif // USE_EXE
	if (calibMode ==0)
	{
		printf("This is a model calib sample!\n");
		calibModelDemo(configPath);
	}
	else if(calibMode == 1)
	{
		printf("This is a product calib sample!\n");
		stereoCalibProdDemo(configPath);
	}
	else if (calibMode == 2)
	{
		printf("This is a product calib verify sample!\n");
		stereoVerifyProdDemo(configPath);
	}
	else if (calibMode == 3)
	{
		printf("This is a find chessboard points sample!\n");
		findPointsDemo(configPath);
	}
	else if (calibMode == 4)
	{
		printf("This is a multi product calib sample!\n");
		multiProductCalibDemo(configPath);
	}
	else if (calibMode == 5)
	{
		printf("This is a multi product calib verify sample!\n");
		multiProductVerifyDemo(configPath);
	}
	return 0;
}

