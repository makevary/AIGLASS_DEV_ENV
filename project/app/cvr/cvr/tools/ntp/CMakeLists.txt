cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(cvr_ntp_tool)

add_definitions(-Wall -g -O0 -ggdb -gdwarf -funwind-tables -rdynamic -Wno-unused-parameter -D_GNU_SOURCE)

#--------------------------
# cvr ntp tool
#--------------------------
set(NTP_SRC
    ${CMAKE_SOURCE_DIR}/src/utils/rk_signal.c
    ${CMAKE_SOURCE_DIR}/src/net/libsock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ntp.c
)
add_executable(cvr_ntp_tool ${NTP_SRC})
target_link_libraries(cvr_ntp_tool pthread)
target_include_directories(cvr_ntp_tool PRIVATE ${CMAKE_SOURCE_DIR}/src/utils/)
target_include_directories(cvr_ntp_tool PRIVATE ${CMAKE_SOURCE_DIR}/src/net/)
install(TARGETS cvr_ntp_tool DESTINATION "bin")