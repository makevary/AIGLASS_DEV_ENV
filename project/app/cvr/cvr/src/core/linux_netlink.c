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

#include "utils/log.h"
#include "utils/kernel_list.h"
#include "core/linux_netlink.h"

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <pthread.h>
#include <string.h>
#include <unistd.h>
#include <sys/prctl.h>
#include <sys/eventfd.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <dirent.h>
#include <linux/netlink.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
struct event_cb_obj {
    int32_t event_type;
    NETLINK_UEVENT_CB cb;
    struct list_head head;
};

static struct event_cb_obj event_cb_list = {
    .cb   = NULL,
    .head = LIST_HEAD_INIT(event_cb_list.head)
};

static pthread_mutex_t linux_hotplug_lock = PTHREAD_MUTEX_INITIALIZER;
static int32_t linux_netlink_socket = -1;
static int32_t netlink_control_event = -1;
static pthread_t libusb_linux_event_thread;

/**********************
 *      MACROS
 **********************/
#define NL_GROUP_KERNEL 1

#define MMCBLK_DEV_PATH    "/sys/class/block"
/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void *linux_netlink_event_thread_main(void *arg);

void netlink_uevent_cb_register(NETLINK_UEVENT_CB cb, int32_t event_type) {
    struct event_cb_obj *pos = NULL, *n = NULL, *cb_obj = NULL;

    pthread_mutex_lock(&linux_hotplug_lock);

    list_for_each_entry_safe(pos, n, &event_cb_list.head, head) {
        if (cb == pos->cb) {
            CVR_ERR("Failed to register callback function!\n");
            goto out;
        }
    }

    cb_obj = calloc(1, sizeof(struct event_cb_obj));
    if (NULL == cb_obj) {
        CVR_ERR("calloc failed!\n");
        goto out;
    }
    cb_obj->cb = cb;
    cb_obj->event_type = event_type;

    list_add_tail(&cb_obj->head, &event_cb_list.head);
out:
    pthread_mutex_unlock(&linux_hotplug_lock);
}

void netlink_uevent_cb_unregister(NETLINK_UEVENT_CB cb) {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&linux_hotplug_lock);
    list_for_each_entry_safe(pos, n, &event_cb_list.head, head) {
        if (cb == pos->cb) {
            list_del(&pos->head);
            free(pos);
            break;
        }
    }
    pthread_mutex_unlock(&linux_hotplug_lock);
}

static void netlink_uevent_cb_run(const NETLINK_UEVENT_EVENT_S *event) {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&linux_hotplug_lock);
    list_for_each_entry_safe(pos, n, &event_cb_list.head, head) {
        if ((NULL != pos->cb) && (pos->event_type & event->event_type)) {
            pos->cb(event);
        }
    }
    pthread_mutex_unlock(&linux_hotplug_lock);
}

static void netlink_uevent_list_destroy() {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&linux_hotplug_lock);
    list_for_each_entry_safe(pos, n, &event_cb_list.head, head) {
        list_del(&pos->head);
        free(pos);
    }
    pthread_mutex_unlock(&linux_hotplug_lock);
}

static int32_t usbi_create_event(int32_t *event_fd) {
    *event_fd = eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
    if (-1 == *event_fd) {
        CVR_ERR("Failed to create eventfd, errno=%d", errno);
        return -1;
    }

    return 0;
}

static void usbi_destroy_event(int32_t event_fd) {
    if (-1 == close(event_fd))
        CVR_WARN("Failed to close eventfd, errno=%d", errno);
}

static void usbi_signal_event(int32_t event_fd) {
    uint64_t dummy = 1;
    ssize_t r;

    r = write(event_fd, &dummy, sizeof(dummy));
    if (r != sizeof(dummy))
        CVR_WARN("event write failed");
}

/*
static void usbi_clear_event(int32_t event_fd) {
    uint64_t dummy;
    ssize_t r;

    r = read(event_fd, &dummy, sizeof(dummy));
    if (r != sizeof(dummy))
        CVR_WARN("event read failed");
}
*/

static int32_t set_fd_cloexec_nb(int32_t fd, int32_t socktype) {
    int32_t flags;

#if defined(FD_CLOEXEC)
    /* Make sure the netlink socket file descriptor is marked as CLOEXEC */
    if (!(socktype & SOCK_CLOEXEC)) {
        flags = fcntl(fd, F_GETFD);
        if (-1 == flags) {
            CVR_ERR("failed to get netlink fd flags, errno=%d", errno);
            return -1;
        }

        if (-1 == fcntl(fd, F_SETFD, flags | FD_CLOEXEC)) {
            CVR_ERR("failed to set netlink fd flags, errno=%d", errno);
            return -1;
        }
    }
#endif

    /* Make sure the netlink socket is non-blocking */
    if (!(socktype & SOCK_NONBLOCK)) {
        flags = fcntl(fd, F_GETFL);
        if (flags == -1) {
            CVR_ERR("Failed to get netlink fd status flags, errno=%d", errno);
            return -1;
        }

        if (fcntl(fd, F_SETFL, flags | O_NONBLOCK) == -1) {
            CVR_ERR("Failed to set netlink fd status flags, errno=%d", errno);
            return -1;
        }
    }

    return 0;
}

int32_t netlink_start_event_monitor(void) {
    struct sockaddr_nl sa_nl = { .nl_family = AF_NETLINK, .nl_groups = NL_GROUP_KERNEL };
    int32_t socktype = SOCK_RAW | SOCK_NONBLOCK | SOCK_CLOEXEC;
    int32_t opt = 1;
    int32_t ret;

    linux_netlink_socket = socket(PF_NETLINK, socktype, NETLINK_KOBJECT_UEVENT);
    if (linux_netlink_socket == -1 && errno == EINVAL) {
        CVR_WARN("Failed to create netlink socket of type %d, attempting SOCK_RAW", socktype);
        socktype = SOCK_RAW;
        linux_netlink_socket = socket(PF_NETLINK, socktype, NETLINK_KOBJECT_UEVENT);
    }

    if (linux_netlink_socket == -1) {
        CVR_ERR("Failed to create netlink socket, errno=%d", errno);
        goto err;
    }

    ret = set_fd_cloexec_nb(linux_netlink_socket, socktype);
    if (ret == -1)
        goto err_close_socket;

    ret = bind(linux_netlink_socket, (struct sockaddr *)&sa_nl, sizeof(sa_nl));
    if (ret == -1) {
        CVR_ERR("Failed to bind netlink socket, errno=%d", errno);
        goto err_close_socket;
    }

    /* Enables the receiving of the credentials of the sending */
    ret = setsockopt(linux_netlink_socket, SOL_SOCKET, SO_PASSCRED, &opt, sizeof(opt));
    if (ret == -1) {
        CVR_ERR("Failed to set netlink socket SO_PASSCRED option, errno=%d", errno);
        goto err_close_socket;
    }

    ret = usbi_create_event(&netlink_control_event);
    if (ret) {
        CVR_ERR("Failed to create netlink control event");
        goto err_close_socket;
    }

    ret = pthread_create(&libusb_linux_event_thread, NULL, linux_netlink_event_thread_main, NULL);
    if (ret != 0) {
        CVR_ERR("Failed to create netlink event thread (%d)", ret);
        goto err_destroy_event;
    }

    return 0;

err_destroy_event:
    usbi_destroy_event(netlink_control_event);
    netlink_control_event = -1;
err_close_socket:
    close(linux_netlink_socket);
    linux_netlink_socket = -1;
err:
    return -1;
}

int32_t netlink_stop_event_monitor(void) {
    if (-1 == linux_netlink_socket) {
        return -1;
    }

    int32_t ret;

    netlink_uevent_list_destroy();

    /* Signal the control event and wait for the thread to exit */
    usbi_signal_event(netlink_control_event);

    ret = pthread_join(libusb_linux_event_thread, NULL);
    if (ret)
        CVR_WARN("Failed to join netlink event thread (%d)", ret);

    usbi_destroy_event(netlink_control_event);
    netlink_control_event = -1;

    close(linux_netlink_socket);
    linux_netlink_socket = -1;

    return 0;
}

/*
static void netlink_message_printf(const char *buffer, size_t len) {
    const char *end = buffer + len;
    printf("\n");
    while (buffer < end && *buffer) {
        CVR_INFO("%s\n", buffer);
        buffer += strlen(buffer) + 1;
    }
    printf("\n");
}
*/

static const char *netlink_message_parse(const char *buffer, size_t len, const char *key) {
    const char *end = buffer + len;
    size_t keylen = strlen(key);

    while (buffer < end && *buffer) {
        if (strncmp(buffer, key, keylen) == 0 && buffer[keylen] == '=')
            return buffer + keylen + 1;
        buffer += strlen(buffer) + 1;
    }

    return NULL;
}

/* parse parts of netlink message common to both libudev and the kernel */
static int32_t linux_netlink_udisk_parse(const char *buffer, size_t len, int32_t *detached,
                                       const char **sys_name, uint8_t *busnum, uint8_t *devaddr) {
    const char *tmp, *slash;

    errno = 0;

    *sys_name = NULL;
    *detached = 0;
    *busnum   = 0;
    *devaddr  = 0;

    tmp = netlink_message_parse(buffer, len, "ACTION");
    if (!tmp) {
        return -1;
    } else if (strcmp(tmp, "remove") == 0) {
        *detached = 1;
    } else if (strcmp(tmp, "add") != 0) {
        //CVR_WARN("Unknown device action %s", tmp);
        return -1;
    }

    /* check that this is a usb message */
    tmp = netlink_message_parse(buffer, len, "SUBSYSTEM");
    if (!tmp || strcmp(tmp, "usb") != 0) {
        /* not usb. ignore */
        return -1;
    }

    /* check that this is an actual usb device */
    tmp = netlink_message_parse(buffer, len, "DEVTYPE");
    if (!tmp || strcmp(tmp, "usb_device") != 0) {
        /* not usb. ignore */
        return -1;
    }

    tmp = netlink_message_parse(buffer, len, "BUSNUM");
    if (tmp) {
        *busnum = (uint8_t)(strtoul(tmp, NULL, 10) & 0xff);
        if (errno) {
            errno = 0;
            return -1;
        }

        tmp = netlink_message_parse(buffer, len, "DEVNUM");
        if (NULL == tmp)
            return -1;

        *devaddr = (uint8_t)(strtoul(tmp, NULL, 10) & 0xff);
        if (errno) {
            errno = 0;
            return -1;
        }
    } else {
        /* no bus number. try "DEVICE" */
        tmp = netlink_message_parse(buffer, len, "DEVICE");
        if (!tmp) {
            /* not usb. ignore */
            return -1;
        }

        /* Parse a device path such as /dev/bus/usb/003/004 */
        slash = strrchr(tmp, '/');
        if (!slash)
            return -1;

        *busnum = (uint8_t)(strtoul(slash - 3, NULL, 10) & 0xff);
        if (errno) {
            errno = 0;
            return -1;
        }

        *devaddr = (uint8_t)(strtoul(slash + 1, NULL, 10) & 0xff);
        if (errno) {
            errno = 0;
            return -1;
        }

        return 0;
    }

    tmp = netlink_message_parse(buffer, len, "DEVPATH");
    if (!tmp)
        return -1;

    slash = strrchr(tmp, '/');
    if (slash)
        *sys_name = slash + 1;
    /* found a usb device */
    return 0;
}

/* parse parts of netlink message common to both libudev and the kernel */
static int32_t linux_netlink_mmcblk_parse(const char *buffer, size_t len, int32_t *detached,
                                          const char **sys_name) {
    const char *tmp, *slash;

    errno = 0;

    *sys_name = NULL;
    *detached = 0;

    tmp = netlink_message_parse(buffer, len, "ACTION");
    if (!tmp) {
        return -1;
    } else if (strcmp(tmp, "remove") == 0) {
        *detached = 1;
    } else if (strcmp(tmp, "add") != 0) {
        //CVR_WARN("Unknown device action %s", tmp);
        return -1;
    }

    tmp = netlink_message_parse(buffer, len, "DEVPATH");
    if (!tmp)
        return -1;

    slash = strrchr(tmp, '/');
    if (slash)
        *sys_name = slash + 1;

    /* check that this is a mmc message */
    tmp = netlink_message_parse(buffer, len, "SUBSYSTEM");
    if (!tmp || strcmp(tmp, "block") != 0) {
        /* not usb. ignore */
        return -1;
    }

    /* check that this is an actual mmc device */
    tmp = netlink_message_parse(buffer, len, "DEVTYPE");
    if (!tmp || strcmp(tmp, "disk") != 0) {
        /* not card. ignore */
        return -1;
    }

    return 0;
}

/* parse parts of netlink message common to both libudev and the kernel */
static int32_t linux_netlink_usb_gadget_parse(const char *buffer, size_t len, int32_t *detached,
                                       const char **sys_name) {
    const char *tmp, *slash;

    errno = 0;

    *sys_name = NULL;
    *detached = 0;

    tmp = netlink_message_parse(buffer, len, "DEVPATH");
    if (!tmp) {
        return -1;
    }
    slash = strrchr(tmp, '/');
    if (slash) *sys_name = slash + 1;

    tmp = netlink_message_parse(buffer, len, "SUBSYSTEM");
    if (!tmp || strcmp(tmp, "android_usb") != 0) {
        return -1;
    }

    tmp = netlink_message_parse(buffer, len, "USB_STATE");
    if (!tmp) {
        return -1;
    } else if (0 == strcmp(tmp, "DISCONNECTED")) {
        *detached = 1;
    } else if (0 != strcmp(tmp, "CONFIGURED")) {
        //CVR_WARN("unknown device action %s", tmp);
        return -1;
    }

    return 0;
}

static int32_t linux_netlink_read_message(void) {
    char cred_buffer[CMSG_SPACE(sizeof(struct ucred))];
    char msg_buffer[2048];
    const char *sys_name = NULL;
    uint8_t busnum, devaddr;
    int32_t detached, r;
    ssize_t len;
    struct cmsghdr *cmsg;
    struct ucred *cred;
    struct sockaddr_nl sa_nl;
    struct iovec iov = { .iov_base = msg_buffer, .iov_len = sizeof(msg_buffer) };
    struct msghdr msg = {
        .msg_iov = &iov, .msg_iovlen = 1,
        .msg_control = cred_buffer, .msg_controllen = sizeof(cred_buffer),
        .msg_name = &sa_nl, .msg_namelen = sizeof(sa_nl)
    };

    /* read netlink message */
    len = recvmsg(linux_netlink_socket, &msg, 0);
    if (len == -1) {
        if (errno != EAGAIN && errno != EINTR)
            CVR_ERR("error receiving message from netlink, errno=%d", errno);
        return -1;
    }

    if (len < 32 || (msg.msg_flags & MSG_TRUNC)) {
        CVR_ERR("Invalid netlink message length");
        return -1;
    }

    if (sa_nl.nl_groups != NL_GROUP_KERNEL || sa_nl.nl_pid != 0) {
        CVR_ERR("ignoring netlink message from unknown group/PID (%u/%u)",
             (unsigned int)sa_nl.nl_groups, (unsigned int)sa_nl.nl_pid);
        return -1;
    }

    cmsg = CMSG_FIRSTHDR(&msg);
    if (!cmsg || cmsg->cmsg_type != SCM_CREDENTIALS) {
        CVR_ERR("ignoring netlink message with no sender credentials");
        return -1;
    }

    cred = (struct ucred *)CMSG_DATA(cmsg);
    if (cred->uid != 0) {
        CVR_ERR("ignoring netlink message with non-zero sender UID %u", (unsigned int)cred->uid);
        return -1;
    }

    /* Handle USB hotplug event */
    r = linux_netlink_udisk_parse(msg_buffer, (size_t)len, &detached, &sys_name, &busnum, &devaddr);
    if (!r) {
        CVR_INFO("netlink hotplug found device busnum: %hhu, devaddr: %hhu, sys_name: %s, removed: %s",
            busnum, devaddr, sys_name, detached ? "yes" : "no");

        NETLINK_UEVENT_EVENT_S usb_event;

        memset(&usb_event, 0, sizeof(usb_event));

        usb_event.event_type = NETLINK_UEVENT_UDISK_EVENT;
        usb_event.udisk.detached = detached;
        usb_event.udisk.bus_number = busnum;
        usb_event.udisk.device_address = devaddr;
        netlink_uevent_cb_run(&usb_event);

        return 0;
    }

    /* Handle USB GADGET hotplug event */
    r = linux_netlink_usb_gadget_parse(msg_buffer, (size_t)len, &detached, &sys_name);
    if (!r) {
        CVR_INFO("netlink hotplug found device removed: %s.\n",detached ? "yes" : "no");

        NETLINK_UEVENT_EVENT_S otg_event;

        memset(&otg_event, 0, sizeof(otg_event));

        otg_event.event_type = NETLINK_UEVENT_USB_GADGET_EVENT;
        otg_event.usb_gadget.detached = detached;
        netlink_uevent_cb_run(&otg_event);

        return 0;
    }

    /* Handle MMC hotplug event */
    r = linux_netlink_mmcblk_parse(msg_buffer, (size_t)len, &detached, &sys_name);
    if (!r) {
        CVR_INFO("netlink hotplug found device sys_name: %s, removed: %s",
            sys_name, detached ? "yes" : "no");
        NETLINK_UEVENT_EVENT_S mmcblk_event;

        memset(&mmcblk_event, 0, sizeof(mmcblk_event));

        mmcblk_event.event_type = NETLINK_UEVENT_MMCBLK_EVENT;
        mmcblk_event.mmcblk.sys_name = sys_name;
        mmcblk_event.mmcblk.detached = detached;
        netlink_uevent_cb_run(&mmcblk_event);

        return 0;
    }

    return 0;
}

static void *linux_netlink_event_thread_main(void *arg) {
    struct pollfd fds[] = {
        { .fd = netlink_control_event,
          .events = POLLIN },
        { .fd = linux_netlink_socket,
          .events = POLLIN },
    };

    int32_t ret = -1;
    prctl(PR_SET_NAME, "netlink event thread", 0, 0, 0);

    while (1) {
        ret = poll(fds, 2, -1);
        if (-1 == ret) {
            /* check for temporary failure */
            if (errno == EINTR)
                continue;
            CVR_ERR("poll() failed, errno=%d", errno);
            break;
        }
        if (fds[0].revents) {
            /* activity on control event, exit */
            break;
        }
        if (fds[1].revents) {
            linux_netlink_read_message();
        }
    }

    return NULL;
}