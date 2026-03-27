cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(sound_tool)

#--------------------------
# cvr sound tool
#--------------------------
if(SOC_RV1126)
install(PROGRAMS asound.state DESTINATION "bin")
install(PROGRAMS alsactl DESTINATION "bin")
install(PROGRAMS amixer DESTINATION "bin")
install(FILES libasound.so.2 DESTINATION "lib")
install(FILES asound.conf DESTINATION "root/etc")
endif()