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

#ifdef REMOTE_COFNIG

#include <netinet/in.h>    /* sockaddr_in{} and other Internet defns */
#include <arpa/inet.h>    /* inet(3) functions */
#include <errno.h>
#include <fcntl.h>        /* for nonblocking */
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/un.h>        /* for Unix domain sockets */
#include <sys/epoll.h>
#include <pthread.h>

#include "core/sys.h"

#include "utils/log.h"

#include "app/remote_config.h"
#include "mpu/mpu_photo.h"
#include "mpu/mpu_record.h"
#include "mpu/osd/mpu_osd.h"
#include "mpu/mpu_storage.h"

#ifdef USE_LVGL
#include "ui/common/ui_ctrl.h"
#endif

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_t g_tid;
static bool g_quit = false;
static bool g_init = false;

/**********************
 *      MACROS
 **********************/
#define LISTENQ        1024    /* 2nd argument to listen() */
#define OPEN_MAX       1024
#define UNIXSTR_PATH   "/tmp/unix.str"    /* Unix domain stream */

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static int32_t socket_accept(int32_t fd, struct sockaddr *sa, socklen_t *salenptr) {
    int32_t n;
again:
    if ((n = accept(fd, sa, salenptr)) < 0) {
        if ((errno == ECONNABORTED) || (errno == EINTR))
            goto again;
        else
            return -1;
    }
    return n;
}

static ssize_t socket_readn(int32_t fd, void *vptr, size_t n) {
    size_t nleft;
    ssize_t nread;
    char *ptr = NULL;

    ptr = vptr;
    nleft = n;
    while (nleft > 0) {
        if ( (nread = read(fd, ptr, nleft)) < 0) {
            if (errno == EINTR)
                nread = 0;
            else
                return -1;
        } else if (nread == 0)
            break;

        nleft -= nread;
        ptr   += nread;
    }

    return (n - nleft);
}

static int32_t unix_domain_listen(const char *name) {
    int32_t listenfd;
    struct sockaddr_un servaddr;

    listenfd = socket(AF_LOCAL, SOCK_STREAM, 0);
    if (listenfd < 0) {
        CVR_ERR("socket create failed.\n");
        return -1;
    }

    unlink(name);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sun_family = AF_LOCAL;
    strcpy(servaddr.sun_path, name);

    if (bind(listenfd, (struct sockaddr *) &servaddr, sizeof(servaddr)) < 0) {
        close(listenfd);
        CVR_ERR("bind failed.\n");
        return -1;
    }

    if (listen(listenfd, LISTENQ) < 0) {
        close(listenfd);
        CVR_ERR("listen failed.\n");
        return -1;
    }

    return listenfd;
}

static void remote_command_process(REMOTE_CONFIG_PARAM_S *remote_cfg) {
    if (NULL == remote_cfg) {
        return ;
    }

    if (true == remote_cfg->aov_mode_switch) {
        sys_ctl(SYSTEM_CTRL_AOV);
    }

    if (true == remote_cfg->tf_card_format) {
        mpu_record_deinit();
        mpu_storage_format();
        mpu_record_init();
        mpu_record_start(RECORD_ALL_CHN);
    }

#ifdef USE_LVGL
    if (true == remote_cfg->ui_type.valid) {
        switch (remote_cfg->ui_type.type) {
            case REMOTE_UI_MAIN:
                ui_ctl(UI_CTRL_SWITCH_MAIN_PAGE);
                break;

            case REMOTE_UI_SET:
            #ifdef PLATFORM_RV1126
                ui_ctl(UI_CTRL_SWITCH_SETTINGS_PAGE);
            #else
                ui_ctl(UI_CTRL_SWITCH_PLAYLIST_PAGE);
            #endif
                break;

            default:
                break;
        }
    }
#endif

    if (true == remote_cfg->codec_type.valid) {
        if (!mpu_record_set_codec_type(0, remote_cfg->codec_type.type)) {
        #ifdef PLATFORM_RV1126
            mpu_record_deinit();
            mpu_record_init();
            mpu_record_start(RECORD_ALL_CHN);
        #else
            mpu_record_stop(0);
            mpu_record_reset(0);
            mpu_record_start(0);
        #endif
        }
    }

    if (true == remote_cfg->rec_type.valid) {
        if (!mpu_record_set_rec_type(0, remote_cfg->rec_type.type)) {
            mpu_record_stop(0);
            mpu_record_reset(0);
            mpu_record_start(0);
        }
    }

    if (true == remote_cfg->res_type.valid) {
        /* Recording and taking photos use the same source VENC,
        and the resolution must be switched at the same time. */
        if (!mpu_record_set_resolution(0, remote_cfg->res_type.type) &&
            !mpu_photo_set_resolution(0, remote_cfg->res_type.type)) {
        #ifdef PLATFORM_RV1126
            mpu_record_deinit();
            mpu_photo_deinit();

            mpu_record_init();
            mpu_photo_init();

            mpu_record_start(RECORD_ALL_CHN);
        #else
            mpu_record_stop(0);
            mpu_record_reset(0);
            mpu_photo_reset(0);
            mpu_record_start(0);
        #endif 
        }
    }

    if (true == remote_cfg->alarm) {
        mpu_photo_capture(remote_cfg->cam_id);
        mpu_record_urgent_video(remote_cfg->cam_id);
    }

    if (true == remote_cfg->take_photo) {
        mpu_photo_capture(remote_cfg->cam_id);
    }

    if (true == remote_cfg->reset_record) {
        mpu_record_deinit();
        mpu_record_init();
        mpu_record_start(RECORD_ALL_CHN);
    }
}

static void *thr_remote_cfg(void *arg) {
    pthread_setname_np(pthread_self(), "auto_test_thread");

    int32_t nready, n;
    int32_t listenfd, connfd, efd, sockfd;
    struct epoll_event tep, ep[OPEN_MAX];
    REMOTE_CONFIG_PARAM_S param;

    listenfd = unix_domain_listen(UNIXSTR_PATH);
    if (0 > listenfd) {
        pthread_exit(NULL);
    }

    efd = epoll_create(OPEN_MAX);
    if (efd == -1) {
        close(listenfd);
        CVR_ERR("epoll_create failed.\n");
        pthread_exit(NULL);
    }

    bzero(&tep, sizeof(tep));
    tep.events = EPOLLIN;
    tep.data.fd = listenfd;
    if (-1 == epoll_ctl(efd, EPOLL_CTL_ADD, listenfd, &tep)) {
        CVR_ERR("epoll_ctl failed.\n");
        goto end;
    }

    while (true != g_quit) {
        bzero(&ep, sizeof(ep));
        nready = epoll_wait(efd, ep, OPEN_MAX, 500);
        if (nready == -1) {
            CVR_ERR("epoll_wait failed.\n");
            goto end;
        } else if (0 == nready) { /* timeout */
            continue;
        }

        for (uint32_t i = 0; i < nready; i++) {
            if (!(ep[i].events & EPOLLIN))
                continue;

            if (ep[i].data.fd == listenfd) {
                if ((connfd = socket_accept(listenfd, NULL, NULL)) < 0) {
                    CVR_ERR("accept failed.\n");
                    continue;
                }

                bzero(&tep, sizeof(tep));
                tep.events = EPOLLIN;
                tep.data.fd = connfd;
                if (-1 == epoll_ctl(efd, EPOLL_CTL_ADD, connfd, &tep)) {
                    CVR_ERR("epoll_ctl failed.\n");
                    continue;
                }
            } else {
                sockfd = ep[i].data.fd;
                bzero(&param, sizeof(param));
                n = socket_readn(sockfd, &param, sizeof(param));
                if (n == 0) {
                    if (-1 == epoll_ctl(efd, EPOLL_CTL_DEL, sockfd, NULL)) {
                        CVR_ERR("epoll_ctl failed.\n");
                    }

                    CVR_INFO("client close\n");
                    close(sockfd);
                } else if (n > 0){
                    remote_command_process(&param);
                }
            }
        }
    }
end:
    close(listenfd);
    close(efd);

    pthread_exit(NULL);
}

/********************************************
* @brief Enable remote modification of CVR configuration function
* @param  none
* @return 0: success, other failures
*********************************************/
int32_t remote_cfg_init() {
    if (true == g_init) {
        return -1;
    }

    g_quit = false;
    g_init = true;
    pthread_create(&g_tid, NULL, thr_remote_cfg, (void *)NULL);

    return 0;
}

/********************************************
* @brief Disable the function of remotely
* modifying the CVR configuration
* @param  none
* @return 0: success, other failures
*********************************************/
void remote_cfg_deinit() {
    if (true == g_init) {
        g_quit = true;
        g_init = false;
        pthread_join(g_tid, NULL);
    }
}

#endif