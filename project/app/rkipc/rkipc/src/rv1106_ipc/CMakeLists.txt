cmake_minimum_required(VERSION 3.5)

set(AI_CORE_SDK_DIR ${PROJECT_SOURCE_DIR}/../../../../InternalProjects/ai_core/ai_glass_sdk)

include_directories(${PROJECT_SOURCE_DIR}/./include
					${CMAKE_SYSROOT}/usr/include/rkaiq/
					${CMAKE_SYSROOT}/usr/include/rkaiq/uAPI
					${CMAKE_SYSROOT}/usr/include/rkaiq/uAPI2
					${CMAKE_SYSROOT}/usr/include/rkaiq/algos
					${CMAKE_SYSROOT}/usr/include/rkaiq/common
					${CMAKE_SYSROOT}/usr/include/rkaiq/xcore
					${CMAKE_SYSROOT}/usr/include/rkaiq/iq_parser
					${CMAKE_SYSROOT}/usr/include/rkaiq/iq_parser_v2
					${CMAKE_SYSROOT}/usr/include/libdrm
					${WPA_SUPPLICANT_INCLUDE_DIRS}
					${AI_CORE_SDK_DIR}/include
					)

set(AI_CORE_SDK_SRCS
	${AI_CORE_SDK_DIR}/src/ai_audio.c
	${AI_CORE_SDK_DIR}/src/ai_ipc.c)

aux_source_directory(./ SRCS)
aux_source_directory(video SRCS)
aux_source_directory(server SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/ SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/audio/rv1106 SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/socket_server SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/param SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/system SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/rtsp SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/rtmp SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/osd SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/roi SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/network SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/storage SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/rockiva SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/event SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/region_clip SRCS)
aux_source_directory(${PROJECT_SOURCE_DIR}/common/venc SRCS)

include_directories(video
					server
					${PROJECT_SOURCE_DIR}/common
					${PROJECT_SOURCE_DIR}/common/audio/rv1106
					${PROJECT_SOURCE_DIR}/common/socket_server
					${PROJECT_SOURCE_DIR}/common/rtsp
					${PROJECT_SOURCE_DIR}/common/rtmp
					${PROJECT_SOURCE_DIR}/common/param
					${PROJECT_SOURCE_DIR}/common/system
					${PROJECT_SOURCE_DIR}/common/osd
					${PROJECT_SOURCE_DIR}/common/osd/freetype2
					${PROJECT_SOURCE_DIR}/common/roi
					${PROJECT_SOURCE_DIR}/common/network
					${PROJECT_SOURCE_DIR}/common/storage
					${PROJECT_SOURCE_DIR}/common/rockiva
					${PROJECT_SOURCE_DIR}/common/event
					${PROJECT_SOURCE_DIR}/common/region_clip
					${PROJECT_SOURCE_DIR}/common/venc
					)

message(STATUS "RK_APP_CHIP is ${RK_APP_CHIP}")
if(RK_APP_CHIP STREQUAL "rv1103b")
	add_definitions(-DRKIPC_RV1103B)
	aux_source_directory(${PROJECT_SOURCE_DIR}/common/isp/rv1103b SRCS)
	include_directories(${PROJECT_SOURCE_DIR}/common/isp/rv1103b)
else()
	aux_source_directory(${PROJECT_SOURCE_DIR}/common/isp/rv1106 SRCS)
	include_directories(${PROJECT_SOURCE_DIR}/common/isp/rv1106)
endif()

link_directories(${PROJECT_SOURCE_DIR}/lib/arm-rockchip830-linux-uclibcgnueabihf)

#add_definitions(-g -ggdb)
# add_definitions(-Os)

# add_definitions(-fsanitize=address -g -ggdb -gdwarf -funwind-tables -rdynamic -O0)
# add_definitions(-fno-stack-protector -fno-omit-frame-pointer -fsanitize-recover=address)
# link_libraries(asan)

add_executable(${PROJECT_NAME} ${SRCS})
target_sources(${PROJECT_NAME} PRIVATE ${AI_CORE_SDK_SRCS})
target_link_libraries(${PROJECT_NAME} pthread rockit rockchip_mpp rkaiq rtsp rkaudio_detect rkaudio_vqe wpa_client m rkmuxer freetype rockiva iconv rknnmrt rga stdc++ rksysutils rkaudio)

add_executable(rkipc_ctrl tools/rkipc_ctrl.c ${PROJECT_SOURCE_DIR}/common/socket_server/socket.c)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
install(TARGETS rkipc_ctrl RUNTIME DESTINATION bin)
if(RK_APP_CHIP STREQUAL "rv1103b")
	install(FILES rkipc-1920x1080-rv1103b.ini DESTINATION share RENAME "rkipc-1920x1080.ini")
	install(FILES rkipc-2304x1296-rv1103b.ini DESTINATION share RENAME "rkipc-2304x1296.ini")
	install(FILES rkipc-2560x1440-rv1103b.ini DESTINATION share RENAME "rkipc-2560x1440.ini")
	install(FILES rkipc-2688x1520-rv1103b.ini DESTINATION share RENAME "rkipc-2688x1520.ini")
	install(FILES rkipc-2880x1616-rv1103b.ini DESTINATION share RENAME "rkipc-2880x1616.ini")
	install(FILES rkipc-3840x2160-rv1103b.ini DESTINATION share RENAME "rkipc-3840x2160.ini")
else()
	install(FILES rkipc-1920x1080.ini DESTINATION share)
	install(FILES rkipc-2304x1296.ini DESTINATION share)
	install(FILES rkipc-2560x1440.ini DESTINATION share)
	install(FILES rkipc-2688x1520.ini DESTINATION share)
	install(FILES rkipc-2880x1616.ini DESTINATION share)
	install(FILES rkipc-3840x2160.ini DESTINATION share)
endif()
install(FILES ../../common/speaker_test.wav DESTINATION share)
install(PROGRAMS RkLunch.sh DESTINATION bin)
install(PROGRAMS RkLunch-stop.sh DESTINATION bin)
install(FILES ${PROJECT_SOURCE_DIR}/common/osd/image.bmp DESTINATION share)
install(FILES ${PROJECT_SOURCE_DIR}/common/osd/simsun_en.ttf DESTINATION share)
install(FILES ${PROJECT_SOURCE_DIR}/lib/arm-rockchip830-linux-uclibcgnueabihf/libwpa_client.so DESTINATION lib)

# ai-core、guard 程序和 PCM 音频文件现已统一在 project/build.sh 中管理
# Install PCM audio files to /oem/usr/bin/resources
# file(GLOB PCM_FILES "${CMAKE_CURRENT_SOURCE_DIR}/resources/*.pcm")
# if(PCM_FILES)
#       install(FILES ${PCM_FILES} DESTINATION bin/resources)
# endif()

# Install custom programs to /oem/usr/bin
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/ai-core DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/guard DESTINATION bin)

# Bluetooth 二进制文件现已统一在 project/build.sh 中管理，这里屏蔽以避免冲突
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/bluetoothd DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/dbus-daemon DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/bluealsa DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/bluealsa-aplay DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/rk_hciattach DESTINATION bin)
# install(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/resources/bt_service DESTINATION bin)
