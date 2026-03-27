cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(cvr_app)

option(SOC_RV1106  "Compile for RV1106  CVR" OFF)
option(SOC_RV1126  "Compile for RV1126  CVR" OFF)
option(SOC_RV1103B "Compile for RV1103B CVR" OFF)

option(ENABLE_REMOTE_CONFIG "Remote configuration function" ON)

add_definitions(
		-Wall -g -O3 -ggdb -gdwarf -funwind-tables -rdynamic
		-Wno-unused-function
		-Wno-unused-parameter -D_GNU_SOURCE
		)

link_directories(${RK_PROJECT_PATH_MEDIA})
include_directories(
		${PROJECT_SOURCE_DIR}
		${PROJECT_SOURCE_DIR}/src
		)

if(USE_RKAIQ)
	add_definitions(-DRKAIQ)
endif()

if(ENABLE_REMOTE_CONFIG)
	add_definitions(-DREMOTE_COFNIG)
endif()

if(USE_LVGL)
	add_definitions(-DUSE_LVGL)
endif()

if(USE_RKAUTO)
	add_definitions(-DRKAUTO)
endif()

if(USE_RKAUDIO)
	add_definitions(-DRKAUDIO)
endif()

if(USE_RKFASTBOOT)
	add_definitions(-DRKFASTBOOT)
endif()

if(USE_FILECACHE)
	add_definitions(-DFILE_CACHE)
endif()

if(USE_RKAOV)
	add_definitions(-DUSE_RKAOV)
endif()

if (
	SOC_RV1106 OR
	SOC_RV1103B
	)
	add_definitions(-DUI_PHY_KEY)
	add_definitions(-DUI_RKADK_ENGINE)
endif()

if (
	SOC_RV1126
	)
	add_definitions(-DUI_VO_INTF_MIPI)
endif()

if(SOC_RV1106)
	add_definitions(-DPLATFORM_RV1106)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1106_1103/  ISP_SRC)
	include_directories(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1106_1103/)
elseif(SOC_RV1103B)
	add_definitions(-DPLATFORM_RV1103B)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1103b/  ISP_SRC)
	include_directories(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1103b/)
elseif(SOC_RV1126)
	add_definitions(-DPLATFORM_RV1126)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1126/  ISP_SRC)
	include_directories(${PROJECT_SOURCE_DIR}/src/mpu/isp/rv1126/)
endif()

aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/isp/  ISP_SRC)

aux_source_directory(${PROJECT_SOURCE_DIR}/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/utils/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/core/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/app/   SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/net/  SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/param/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/disp/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/record/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/rtsp/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/photo/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/sys/  SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/osd/  SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/player/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/storage/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/algorithm/  SRCS)

file(GLOB_RECURSE CONFIG_SRC ${PROJECT_SOURCE_DIR}/src/conf/*)

if(USE_RKAUTO)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/algorithm/auto/  SRCS)
endif()

if(USE_RKAUDIO)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/algorithm/audio/  SRCS)
endif()

if(USE_RKAOV)
aux_source_directory(${PROJECT_SOURCE_DIR}/src/mpu/aov/  SRCS)
endif()

if(USE_LVGL)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/lvgl/  SRCS)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/lvgl/common   SRCS)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/lvgl/drivers  SRCS)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/lvgl/porting  SRCS)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/ui/common  SRCS)
if(SOC_RV1106 OR SOC_RV1103B)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/ui/480x320  SRCS)
elseif(SOC_RV1126)
	aux_source_directory(${PROJECT_SOURCE_DIR}/src/ui/1280x720  SRCS)
endif()
endif()

add_executable(cvr_app ${SRCS} ${ISP_SRC} ${CONFIG_SRC})

if(USE_RKAUTO)
	target_link_libraries(cvr_app rockauto rknnmrt_rockauto)
endif()

if(USE_RKAUDIO)
	target_link_libraries(cvr_app rkaudio_vqe rkaudio_common rknnmrt)
endif()

if(USE_LVGL)
	target_link_libraries(cvr_app lvgl png)
endif()

if(SOC_RV1106 OR SOC_RV1103B)
	target_link_libraries(cvr_app rockit_full jpeg)
elseif(SOC_RV1126)
	target_link_libraries(cvr_app rockit)
endif()

target_link_libraries(
			cvr_app rkadk rkaudio rga rkmuxer
			iconv rtsp z freetype rkfsmk drm
			rkdemuxer rkaiq pthread
			)

if(USE_LVGL)
	install(DIRECTORY res/sound DESTINATION share/res/)
	install(DIRECTORY res/conf DESTINATION share/res/)
	install(PROGRAMS res/font/PuHuiTi.ttf DESTINATION share/res/font/)
	if(SOC_RV1106 OR SOC_RV1103B)
		file(GLOB STRING_FILES ${PROJECT_SOURCE_DIR}/res/string/rv1106_1103/*)
		install(FILES ${STRING_FILES} DESTINATION share/res/string/)

		file(GLOB ICON_FILES ${PROJECT_SOURCE_DIR}/res/ui/rv1106_1103/*)
		install(FILES ${ICON_FILES} DESTINATION share/res/ui/)
	elseif(SOC_RV1126)
		file(GLOB STRING_FILES ${PROJECT_SOURCE_DIR}/res/string/rv1126_1109/*)
		install(FILES ${STRING_FILES} DESTINATION share/res/string/)

		file(GLOB ICON_FILES ${PROJECT_SOURCE_DIR}/res/ui/rv1126_1109/*)
		install(FILES ${ICON_FILES} DESTINATION share/res/ui/)
	endif()
else()
	install(DIRECTORY res/conf DESTINATION share/res/)
	install(PROGRAMS res/font/PuHuiTi_Tiny.ttf DESTINATION share/res/font/)
endif()

install(TARGETS cvr_app DESTINATION "bin")
install(PROGRAMS RkLunch.sh DESTINATION bin)
install(PROGRAMS RkLunch-stop.sh DESTINATION bin)

if(ENABLE_REMOTE_CONFIG)
	add_subdirectory(tools/remote_config)
endif()
add_subdirectory(tools/sound)
add_subdirectory(tools/ntp)
