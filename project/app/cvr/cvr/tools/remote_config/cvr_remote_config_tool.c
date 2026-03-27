/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
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

#include <netinet/in.h>    /* sockaddr_in{} and other Internet defns */
#include <arpa/inet.h>    /* inet(3) functions */
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/un.h>        /* for Unix domain sockets */

#include <remote_config.h>
/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
#ifdef USE_LVGL
static char optstr[] = "i:r:t:c:u:ahpdf";
#else
static char optstr[] = "i:r:t:c:ahpdfA";
#endif
/**********************
 *      MACROS
 **********************/
#define UNIXSTR_PATH   "/tmp/unix.str"    /* Unix domain stream */

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void print_usage(const char *name);
static ssize_t writen(int32_t fd, const void *vptr, size_t n);

static void print_usage(const char *name) {
    printf("usage example:\n");
    printf("\t-r: Set the recording resolution, eg:-r \n"
            "\t\t0: 1280*720; 1: 1920*1080; 2: 2304*1296; 3: 2560*1440\n"
            "\t\t4: 2688*1520; 5: 2560*1600; 6: 2880*1620\n");
    printf("\t-t: Set recording type. 0: Normal video type, 1: Time Lapse Type\n");
    printf("\t-d: Destroy and create record\n");
    printf("\t-c: Set video codec type. 0: H264, 1: H265\n");
    printf("\t-a: Trigger collision warning\n");
    printf("\t-p: Take pictures\n");
    printf("\t-i: Camera id, Default 0\n");
    printf("\t-A: Aov mode switch\n");
#ifdef USE_LVGL
    printf("\t-u: Switch UI. 0: Main UI, 1: System settings UI\n");
#endif
    printf("\t-f: Tf card format\n");
}

static ssize_t writen(int32_t fd, const void *vptr, size_t n) {
    size_t         nleft;
    ssize_t        nwritten;
    const char    *ptr = NULL;

    ptr = vptr;
    nleft = n;
    while (nleft > 0) {
        if ( (nwritten = write(fd, ptr, nleft)) <= 0) {
            if (nwritten < 0 && errno == EINTR)
                nwritten = 0;        /* and call write() again */
            else
                return(-1);            /* error */
        }

        nleft -= nwritten;
        ptr   += nwritten;
    }

    return n;
}

int32_t main(int32_t argc, char **argv) {
    int32_t            sockfd;
    int32_t            c;
    struct sockaddr_un servaddr;
    REMOTE_CONFIG_PARAM_S param;

    memset(&param, 0, sizeof(param));
    param.cam_id = 0;
    param.alarm = false;
    param.take_photo = false;
    param.reset_record = false;
    param.rec_type.valid = false;
    param.res_type.valid = false;
    param.codec_type.valid = false;

    while ((c = getopt(argc, argv, optstr)) != -1) {
        switch (c) {
            case 'r':
                param.res_type.valid = true;
                param.res_type.type = atoi(optarg);
            break;

            case 't':
                param.rec_type.valid = true;
                param.rec_type.type = atoi(optarg);
            break;

            case 'c':
                param.codec_type.valid = true;
                param.codec_type.type = atoi(optarg);
            break;

            case 'u':
                param.ui_type.valid = true;
                param.ui_type.type = atoi(optarg);
            break;

            case 'a':
                param.alarm = true;
            break;

            case 'p':
                param.take_photo = true;
            break;

            case 'd':
                param.reset_record = true;
            break;

            case 'i':
                param.cam_id = atoi(optarg);
            break;

            case 'f':
                param.tf_card_format = true;
            break;

            case 'A':
                param.aov_mode_switch = true;
            break;

            case 'h':
            default:
                print_usage(argv[0]);
                optind = 0;
                exit(0);
            break;
        }
    }
    optind = 0;

    sockfd = socket(AF_LOCAL, SOCK_STREAM, 0);
    if (sockfd < 0) {
        perror("create socket failed");
        exit(-1);
    }

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sun_family = AF_LOCAL;
    strcpy(servaddr.sun_path, UNIXSTR_PATH);
    if (connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
        close(sockfd);
        perror("connect failed");
        exit(-1);
    }

    int32_t nbytes = sizeof(param);
    if (writen(sockfd, &param, nbytes) != nbytes) {
        close(sockfd);
        perror("write error");
        exit(-1);
    }

    close(sockfd);

    exit(0);
}