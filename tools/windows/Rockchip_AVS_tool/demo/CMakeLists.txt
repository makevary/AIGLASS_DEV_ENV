# CMakeList.txt: rkAVS_calibrationDemo 的 CMake 项目，在此处包括源代码并定义
# 项目特定的逻辑。
#
cmake_minimum_required (VERSION 3.8)
project ("rkAVS_calibDemo")

# OpenCV相关
if(MSVC)
	#set(OpenCV_DIR "//172.16.4.246/ShareData/users/xuda/3rd_party/opencv_vc15_x64_release/x64/vc15/lib/")  # NAS上OpenCV版本：OpenCV 4.5.0
	set(OpenCV_DIR "D:/SoftwareCatalogue/Opencv4.5.1/build/")  # 本地OpenCV版本：OpenCV 4.3.0
else(NOT MSVC)
	add_definitions(-Dcv=RKCV)
	if(GENERATE_LIB_FOR_1106)
		set(OpenCV_DIR "/home/xuda/rv1106/opencv/out_for_rv1106/lib/cmake/opencv4/")  # 指定OpenCV的.cmake文件所在路径
		set(OpenCV_LIB_PATH "/home/xuda/rv1106/opencv/out_for_rv1106/lib/")  # 指定OpenCV的lib文件路径
	else(NOT GENERATE_LIB_FOR_1106)
		set(OpenCV_DIR "/home/lmp/rv1126_toolchain/opencv/out_for_rv1126/lib/cmake/opencv4/")  # 指定OpenCV的.cmake文件所在路径
		set(OpenCV_LIB_PATH "/home/lmp/rv1126_toolchain/opencv/out_for_rv1126/lib/")  # 指定OpenCV的lib文件路径
	endif(GENERATE_LIB_FOR_1106)	
endif(MSVC)
find_package(OpenCV 4 REQUIRED)
if(OpenCV_FOUND)
	message(STATUS "The OpenCV lib is found!")
	message(STATUS "OpenCV library status:")
	message(STATUS "    version: ${OpenCV_VERSION}")
	message(STATUS "    libraries: ${OpenCV_LIBS}")
	message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")
endif(OpenCV_FOUND)
include_directories(${OpenCV_INCLUDE_DIRS})

# 编译可执行文件
include_directories(./)
aux_source_directory(./ demoCppDir)
add_executable(${PROJECT_NAME} ${demoCppDir})

# 链接子项目的库
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} rkAVS_calibCore)

