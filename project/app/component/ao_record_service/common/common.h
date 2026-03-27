#ifndef __RK_COMMON_H_
#define __RK_COMMON_H_

#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/mman.h>

#define CMD_BUF_SIZE                               1024
#define AO_RECORD_SERVICE_DEBUG_PRINT              0
#define SHARE_MEMORY_BUF_SIZE                      1024

#define MMAP_PAGE_SIZE                             (4096) //MMAP_PAGE_SIZE = 4K
#define MMAP_MASK                                  (MMAP_PAGE_SIZE - 1) //MMAP_MASK = 0XFFF

#define ao_record_service_info(fmt, ...)           printf("ao_record_service "fmt"", ##__VA_ARGS__)
#define ao_record_service_err(fmt, ...)            printf("ao_record_service error "fmt"", ##__VA_ARGS__)
#if AO_RECORD_SERVICE_DEBUG_PRINT
#include <stdio.h>
#define ao_record_service_dbg(fmt, ...)            printf("ao_record_service "fmt"", ##__VA_ARGS__)
#else
#define ao_record_service_dbg(fmt, ...)
#endif

long get_cmd_val(const char *string, int len);
void execute_cmd(char *cmd);
void writel(uint32_t val, uint32_t phy_addr);
void read_mem(uint32_t phy_addr, char *data, uint32_t len);
uint32_t readl(const uint32_t phy_addr);

#endif
