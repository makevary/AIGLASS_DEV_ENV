cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(cvr_remote_cfg_tool)

add_definitions(-Wall -g -O0 -ggdb -gdwarf -funwind-tables -rdynamic -Wno-unused-parameter -D_GNU_SOURCE)

#--------------------------
# cvr configuration tool
#--------------------------
add_executable(cvr_remote_cfg_tool cvr_remote_config_tool.c)
target_include_directories(cvr_remote_cfg_tool PRIVATE ${CMAKE_SOURCE_DIR}/src/app/)
install(TARGETS cvr_remote_cfg_tool DESTINATION "bin")
install(PROGRAMS cvr_auto_test.sh DESTINATION "bin")