/*
 * Copyright (c) 2023 Rockchip, Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include "libsock.h"

#include <ctype.h>
#include <arpa/inet.h>
#include <endian.h>
#include <errno.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
struct s_fixedpt {
    uint16_t intpart;
    uint16_t fracpart;
};

struct l_fixedpt {
    uint32_t intpart;
    uint32_t fracpart;
};

struct ntphdr {
#if __BYTE_ORDER == __BID_ENDIAN
    uint32_t ntp_li : 2;
    uint32_t ntp_vn : 3;
    uint32_t ntp_mode : 3;
#endif
#if __BYTE_ORDER == __LITTLE_ENDIAN
    uint32_t ntp_mode : 3;
    uint32_t ntp_vn : 3;
    uint32_t ntp_li : 2;
#endif
    uint8_t ntp_stratum;
    uint8_t ntp_poll;
    int8_t ntp_precision;
    struct s_fixedpt ntp_rtdelay;
    struct s_fixedpt ntp_rtdispersion;
    uint32_t ntp_refid;
    struct l_fixedpt ntp_refts;
    struct l_fixedpt ntp_orits;
    struct l_fixedpt ntp_recvts;
    struct l_fixedpt ntp_transts;
};

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define VERSION_3 3
#define VERSION_4 4

#define MODE_CLIENT 3
#define MODE_SERVER 4

#define NTP_LI 0
#define NTP_VN VERSION_3
#define NTP_MODE MODE_CLIENT
#define NTP_STRATUM 0
#define NTP_POLL 4
#define NTP_PRECISION -6

#define NTP_HLEN 48

#define NTP_PORT 123

#define TIMEOUT 10

#define BUFSIZE 1500

#define JAN_1970 0x83aa7e80

#define NTP_CONV_FRAC32(x) (uint64_t)((x) * ((uint64_t)1 << 32))
#define NTP_REVE_FRAC32(x) ((double)((double)(x) / ((uint64_t)1 << 32)))

#define NTP_CONV_FRAC16(x) (uint32_t)((x) * ((uint32_t)1 << 16))
#define NTP_REVE_FRAC16(x) ((double)((double)(x) / ((uint32_t)1 << 16)))

#define USEC2FRAC(x) ((uint32_t)NTP_CONV_FRAC32((x) / 1000000.0))
#define FRAC2USEC(x) ((uint32_t)NTP_REVE_FRAC32((x)*1000000.0))

#define NTP_LFIXED2DOUBLE(x)                                                                       \
    ((double)(ntohl(((struct l_fixedpt *)(x))->intpart) - JAN_1970 +                               \
              FRAC2USEC(ntohl(((struct l_fixedpt *)(x))->fracpart)) / 1000000.0))

/**********************
 *   STATIC FUNCTIONS
 **********************/
static bool validate_number(char *str) {
    while (*str) {
        if (!isdigit(*str)) {
            return false;
        }
        str++;
    }
    return true;
}

static bool is_ip_address(const char *ip) {
    char ip_tmp[SOCK_ADDR_LEN];
    int32_t num, dots = 0;
    char *ptr;
    strcpy(ip_tmp, ip);

    if (ip_tmp == NULL) {
        return false;
    }
    /*  cut the string using dot delimiter */
    ptr = strtok(ip_tmp, ".");

    if (ptr == NULL) {
        return false;
    }

    while (ptr) {
        /* check whether the sub string is holding only number or not */
        if (!validate_number(ptr)) {
            return false;
        }

        /* convert substring to number */
        num = atoi(ptr);
        if (num >= 0 && num <= 255) {
            ptr = strtok(NULL, ".");
            if (ptr != NULL)
                dots++;
        }
        else {
            return false;
        }
    }

    if (dots != 3) {
        return false;
    }

    return true;
}

static int32_t get_ntp_packet(void *buf, size_t *size) {
    struct ntphdr *ntp;
    struct timeval tv;

    if (!size || *size < NTP_HLEN)
        return -1;

    memset(buf, 0, *size);

    ntp = (struct ntphdr *)buf;
    ntp->ntp_li = NTP_LI;
    ntp->ntp_vn = NTP_VN;
    ntp->ntp_mode = NTP_MODE;
    ntp->ntp_stratum = NTP_STRATUM;
    ntp->ntp_poll = NTP_POLL;
    ntp->ntp_precision = NTP_PRECISION;

    gettimeofday(&tv, NULL);
    ntp->ntp_transts.intpart = htonl(tv.tv_sec + JAN_1970);
    ntp->ntp_transts.fracpart = htonl(USEC2FRAC(tv.tv_usec));

    *size = NTP_HLEN;

    return 0;
}

static double get_rrt(const struct ntphdr *ntp, const struct timeval *recvtv) {
    double t1, t2, t3, t4;

    t1 = NTP_LFIXED2DOUBLE(&ntp->ntp_orits);
    t2 = NTP_LFIXED2DOUBLE(&ntp->ntp_recvts);
    t3 = NTP_LFIXED2DOUBLE(&ntp->ntp_transts);
    t4 = recvtv->tv_sec + recvtv->tv_usec / 1000000.0;

    return (t4 - t1) - (t3 - t2);
}

static double get_offset(const struct ntphdr *ntp, const struct timeval *recvtv) {
    double t1, t2, t3, t4;

    t1 = NTP_LFIXED2DOUBLE(&ntp->ntp_orits);
    t2 = NTP_LFIXED2DOUBLE(&ntp->ntp_recvts);
    t3 = NTP_LFIXED2DOUBLE(&ntp->ntp_transts);
    t4 = recvtv->tv_sec + recvtv->tv_usec / 1000000.0;

    return ((t2 - t1) + (t3 - t4)) / 2;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t net_ntp_update(const char *ntp_server_addr) {
    int32_t ret = 0;
    char buf[BUFSIZE];
    size_t nbytes;
    int32_t maxfd1;
    fd_set readfds;
    double offset;
    struct timeval timeout, recvtv, tv;
    struct sock_connection *udp_connecn;

    if (true == is_ip_address(ntp_server_addr)) {
        udp_connecn = sock_udp_connect(ntp_server_addr, NTP_PORT);
    } else {
        struct sock_addr_list *ntp_addr_list;
        if (-1 == sock_gethostbyname(&ntp_addr_list, ntp_server_addr))
            return -1;

        for (struct sock_addr_list * p = ntp_addr_list; NULL != p; p = p->next) {
            udp_connecn = sock_udp_connect(ntp_addr_list->addr.ip_str, NTP_PORT);
            if (NULL != udp_connecn)
                break;
        }
        sock_freeaddrinfo(&ntp_addr_list);
    }

    if (NULL == udp_connecn) {
        printf("connect error\n");
        return -1;
    }

    nbytes = BUFSIZE;
    if (0 != get_ntp_packet(buf, &nbytes)) {
        printf("construct ntp request error\n");
        ret = -1;
        goto end;
    }

    if (-1 == sock_send(udp_connecn->fd, buf, nbytes)) {
        ret = -1;
        goto end;
    }

    FD_ZERO(&readfds);
    FD_SET(udp_connecn->fd, &readfds);
    maxfd1 = udp_connecn->fd + 1;

    timeout.tv_sec = TIMEOUT;
    timeout.tv_usec = 0;

    if (select(maxfd1, &readfds, NULL, NULL, &timeout) > 0) {
        if (FD_ISSET(udp_connecn->fd, &readfds)) {
            if (0 >= sock_recv(udp_connecn->fd, buf, BUFSIZE)) {
                printf("recv error\n");
                ret = -1;
                goto end;
            }

            //Calculate C/S time offset
            gettimeofday(&recvtv, NULL);
            offset = get_offset((struct ntphdr *)buf, &recvtv);

            //Update system time
            gettimeofday(&tv, NULL);
            tv.tv_sec += (int32_t)offset + 28800;
            tv.tv_usec += offset - (int32_t)offset;
            settimeofday(&tv, NULL);
        }
    }

end:
    sock_close(udp_connecn->fd);
    free(udp_connecn);
    return ret;
}