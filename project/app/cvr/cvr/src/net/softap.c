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

#include "softap.h"

#include <fcntl.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define DBG 1

#if DBG
#define DEBUG_INFO(M, ...) printf("Hostapd %d: " M, __LINE__, ##__VA_ARGS__)
#else
#define DEBUG_INFO(M, ...) \
    do {                   \
    } while (0)
#endif
#define DEBUG_ERR(M, ...) printf("Hostapd %d: " M, __LINE__, ##__VA_ARGS__)

static void *start_ap_thread_func(void *arg);

static void exec_command(char cmdline[], char recv_buff[], int len) {
    printf("[BT_DEBUG] execute: %s\n", cmdline);

    FILE *stream = NULL;
    char *tmp_buff = recv_buff;

    memset(recv_buff, 0, len);

    if ((stream = popen(cmdline, "r")) != NULL) {
        while (fgets(tmp_buff, len, stream)) {
            // pr_info("tmp_buf[%d]: %s\n", strlen(tmp_buff), tmp_buff);
            tmp_buff += strlen(tmp_buff);
            len -= strlen(tmp_buff);
            if (len <= 1) break;
        }

        printf("[BT_DEBUG] execute_r: %s \n", recv_buff);
        pclose(stream);
    } else
        printf("[popen] error: %s\n", cmdline);
}

static const int console_run(const char *cmdline) {
    int ret;

    DEBUG_INFO("cmdline = %s\n", cmdline);

    ret = system(cmdline);
    if (ret < 0) {
        DEBUG_ERR("Running cmdline failed: %s\n", cmdline);
        return 0;
    }

    return 1;
}

static int create_hostapd_file(char *ap, char *ssid, char *psk) {
    FILE *fp;
    char cmdline[256] = {0};
    static char HOSTAPD_CONF_DIR[] = "/data/hostapd.conf";

    fp = fopen(HOSTAPD_CONF_DIR, "wt+");
    if (NULL == fp) return -1;

    sprintf(cmdline, "interface=%s\n", ap);
    fputs(cmdline, fp);
    fputs("ctrl_interface=/var/run/hostapd\n", fp);
    fputs("driver=nl80211\n", fp);
    fputs("ssid=", fp);
    fputs(ssid, fp);
    fputs("\n", fp);
    fputs("channel=6\n", fp);
    fputs("hw_mode=g\n", fp);
    fputs("ieee80211n=1\n", fp);
    fputs("ignore_broadcast_ssid=0\n", fp);

    if (psk != NULL && 0 != strcmp(psk, "")) {
        fputs("auth_algs=1\n", fp);
        fputs("wpa=3\n", fp);
        fputs("wpa_passphrase=", fp);
        fputs(psk, fp);
        fputs("\n", fp);
        fputs("wpa_key_mgmt=WPA-PSK\n", fp);
        fputs("wpa_pairwise=TKIP\n", fp);
        fputs("rsn_pairwise=CCMP", fp);
    }

    fclose(fp);
    return 0;
}

static int creat_dnsmasq_file() {
    FILE *fp;
    static char DNSMASQ_CONF_DIR[] = "/data/dnsmasq.conf";
    static char SOFTAP_INTERFACE_STATIC_IP[] = "10.201.126.1";

    system("rm /data/dnsmasq.conf -rf");

    fp = fopen(DNSMASQ_CONF_DIR, "wt+");
    if (NULL == fp) return 0;

    fputs("user=root\n", fp);
    fputs("listen-address=", fp);
    fputs(SOFTAP_INTERFACE_STATIC_IP, fp);
    fputs("\n", fp);
    fputs("dhcp-range=10.201.126.50,10.201.126.150\n", fp);
    fputs("server=/google/8.8.8.8\n", fp);
    fclose(fp);
    return 1;
}

static int start_hostapd(char *ap, char *ssid, char *psk, char *ip) {
    char cmdline[256] = {0};
    static char DNSMASQ_CONF_DIR[] = "/data/dnsmasq.conf";
    static char HOSTAPD_CONF_DIR[] = "/data/hostapd.conf";
    create_hostapd_file(ap, ssid, psk);

    sprintf(cmdline, "ifconfig %s up", ap);
    console_run(cmdline);
    sleep(1);
    sprintf(cmdline, "ifconfig %s 10.201.126.1 netmask 255.255.255.0", ap);
    console_run(cmdline);
    // sprintf(cmdline, "route add default gw %s %s", ip, ap);
    // console_run(cmdline);

    creat_dnsmasq_file();
    memset(cmdline, 0, sizeof(cmdline));
    sprintf(cmdline, "dnsmasq -C %s --interface=%s", DNSMASQ_CONF_DIR, ap);
    console_run(cmdline);

    memset(cmdline, 0, sizeof(cmdline));
    sprintf(cmdline, "hostapd %s &", HOSTAPD_CONF_DIR);
    console_run(cmdline);

    int time = 100;
    while (time-- > 0 && access("/var/run/hostapd", F_OK)) {
        usleep(100 * 1000);
    }
    return 0;
}

static void *start_ap_thread_func(void *arg) {
    FILE *fp = NULL;
    char ssid[128];
    char str[18];
    char wifi_type[128];
    char ap[64];
    memset(ssid, 0, sizeof(ssid));
    memset(str, 0, sizeof(str));

    console_run("killall dnsmasq");
    console_run("killall hostapd");
    console_run("killall udhcpc");

    exec_command("ifconfig -a | grep p2p0", wifi_type, 128);
    if (strstr(wifi_type, "p2p0")) {
        strcpy(ap, "p2p0");
        console_run("ifconfig p2p0 down");
        console_run("rm -rf /data/p2p0");
    } else {
        strcpy(ap, "wlan1");
        console_run("ifconfig wlan1 down");
        console_run("rm -rf /data/wlan1");
        console_run("iw dev wlan1 del");
        console_run("ifconfig wlan0 up");

        if (!strncmp(wifi_type, "AP6181", 6))
            console_run("iw dev wlan0 interface add wlan1 type __ap");
        else
            console_run("iw phy0 interface add wlan1 type managed");
    }

    int time = 100;

    while (time-- > 0 && access("/sys/class/net/wlan0/address", F_OK)) {
        printf("wlan0 is not exist...waiting!");
        usleep(100 * 1000);
    }

    if (time < 0) {
        printf("start ap failed");
        return NULL;
    }

    if (NULL == (fp = fopen("/sys/class/net/wlan0/address", "rt"))) {
        printf("wlan0 is not exist,start ap failed!");
        return NULL;
    }

    strcat(ssid, "RV_CVR_");
    if (fgets(str, 18, fp) != NULL) {
        strcat(ssid, str);
        printf("ssid is %s \n", ssid);
    }

    fclose(fp);
    start_hostapd(ap, ssid, NULL, NULL);
    return NULL;
}

bool cvr_start_ap() {
    pthread_t ap_thread;
    int32_t err = pthread_create(&ap_thread, NULL, start_ap_thread_func, NULL);
    if (0 == err) pthread_detach(ap_thread);
    return true;
}

int wifi_stop_hostapd(void) {
    char wifi_type[128];

    console_run("killall hostapd");
    exec_command("ifconfig -a | grep p2p0", wifi_type, 128);
    if (strstr(wifi_type, "p2p0")) {
        console_run("ifconfig p2p0 down");
    } else {
        console_run("killall dnsmasq");
        console_run("ifconfig wlan1 down");
    }

    int time = 100;
    while (time-- > 0 && !access("/var/run/hostapd", F_OK)) {
        usleep(10 * 1000);
    }

    return 0;
}
