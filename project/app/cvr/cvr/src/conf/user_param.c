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

#include <cvr_conf.h>

#include "libconfig.h"
#include "user_param.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static config_t *g_user_param_config = NULL;
static pthread_rwlock_t  g_param_rwlock = PTHREAD_RWLOCK_INITIALIZER;

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void append_string(string_array_p array, const char* str) {
    array->strings = realloc(array->strings, (array->size + 1) * sizeof(char*));
    if (NULL == array->strings)
        return;

    array->strings[array->size] = strdup(str);
    if (NULL == array->strings[array->size])
        return;

    array->size++;
}

static int32_t copy_file(const char* source, const char* destination) {
    int32_t src_fd, dest_fd;
    size_t file_size;
    void *src_map, *dest_map;

    src_fd = open(source, O_RDONLY);
    if (src_fd == -1) {
        perror("Failed to open source file");
        return -1;
    }

    file_size = lseek(src_fd, 0, SEEK_END);
    if (file_size == (size_t)-1) {
        perror("Failed to get file size");
        close(src_fd);
        return -1;
    }

    dest_fd = open(destination, O_RDWR | O_CREAT | O_TRUNC, 0666);
    if (dest_fd == -1) {
        perror("Failed to create destination file");
        close(src_fd);
        return -1;
    }

    if (ftruncate(dest_fd, file_size) == -1) {
        perror("Failed to set file size");
        close(src_fd);
        close(dest_fd);
        return -1;
    }

    src_map = mmap(NULL, file_size, PROT_READ, MAP_PRIVATE, src_fd, 0);
    if (src_map == MAP_FAILED) {
        perror("Failed to map source file");
        close(src_fd);
        close(dest_fd);
        return -1;
    }

    dest_map = mmap(NULL, file_size, PROT_WRITE, MAP_SHARED, dest_fd, 0);
    if (dest_map == MAP_FAILED) {
        perror("Failed to map destination file");
        munmap(src_map, file_size);
        close(src_fd);
        close(dest_fd);
        return -1;
    }

    memcpy(dest_map, src_map, file_size);

    munmap(src_map, file_size);
    munmap(dest_map, file_size);

    close(src_fd);
    close(dest_fd);

    return 0;
}

static config_t* get_instance(void) {
    if (NULL == g_user_param_config) {
        g_user_param_config = conf_load(CVR_PARAM_DEFAULT_PATH);
        if (NULL == g_user_param_config) {
            copy_file(CVR_PARAM_BACKUP_PATH, CVR_PARAM_DEFAULT_PATH);
            g_user_param_config = conf_load(CVR_PARAM_DEFAULT_PATH);
            if (NULL == g_user_param_config)
                perror("Iniparser_load error again!\n");
        }
    }
    return g_user_param_config;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void user_param_dump(void) {
    pthread_rwlock_rdlock(&g_param_rwlock);

    config_t *c = get_instance();
    if (NULL != c)
        conf_dump(c);

    pthread_rwlock_unlock(&g_param_rwlock);
}

int32_t user_param_save(void) {
    config_t *c = NULL;

    pthread_rwlock_rdlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    int32_t ret = conf_save(c);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

void user_param_dump_to_file(FILE *f) {
    if (NULL == f)
        return;

    config_t *c = NULL;

    pthread_rwlock_rdlock(&g_param_rwlock);

    if (NULL != (c = get_instance()))
        conf_dump_to_file(f, c);

    pthread_rwlock_unlock(&g_param_rwlock);
}

void user_param_unload(void) {
    config_t *c = NULL;

    pthread_rwlock_wrlock(&g_param_rwlock);

    if (NULL != (c = get_instance()))
        conf_unload(c);
    g_user_param_config = NULL;

    pthread_rwlock_unlock(&g_param_rwlock);
}

const char* user_param_get_string(const char *section,
                                  const char *key, const char *default_value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key || NULL == default_value)
        return NULL;

    pthread_rwlock_rdlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return NULL;
    }

    const char *str = conf_get_string(c, section, key, default_value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return str;
}

int32_t user_param_set_string(const char *section,
                              const char *key, const char *value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key)
        return -1;

    pthread_rwlock_wrlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    int32_t ret = conf_set_string(c, section, key, value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

int32_t user_param_get_int(const char *section,
                           const char *key, int32_t default_value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key)
        return -1;

    pthread_rwlock_rdlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    int32_t ret = conf_get_int(c, section, key, default_value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

int32_t user_param_set_int(const char *section,
                           const char *key, int32_t value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key)
        return -1;

    pthread_rwlock_wrlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    int32_t ret = conf_set_int(c, section, key, value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

double user_param_get_double(const char *section,
                             const char *key, double default_value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key)
        return -1;

    pthread_rwlock_rdlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    double ret = conf_get_double(c, section, key, default_value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

int32_t user_param_set_double(const char *section,
                              const char *key, double value) {
    config_t *c = NULL;

    if (NULL == section || NULL == key)
        return -1;

    pthread_rwlock_wrlock(&g_param_rwlock);

    if (NULL == (c = get_instance())) {
        pthread_rwlock_unlock(&g_param_rwlock);
        return -1;
    }

    int32_t ret = conf_set_double(c, section, key, value);

    pthread_rwlock_unlock(&g_param_rwlock);

    return ret;
}

void user_param_init_string_array(string_array_p array) {
    if (NULL == array)
        return;

    array->strings = NULL;
    array->size = 0;
}

void user_param_free_string_array(string_array_p array) {
    if (NULL == array)
        return;

    for (uint32_t i = 0; i < array->size; ++i)
        free(array->strings[i]);

    free(array->strings);
    array->size = 0;
}

int32_t user_param_parse_string_array(const char* input, string_array_p result) {
    const char* delimiter = ",";
    const char* start = input;
    const char* end = NULL;
    char* token = NULL;
    uint32_t length;

    while (NULL != (end = strstr(start, delimiter))) {
        length = end - start + 1;
        token = (char*)calloc(1, length);
        if (NULL == token) {
            user_param_free_string_array(result);
            return -1;
        }

        snprintf(token, length, "%s", start);

        append_string(result, token);

        start = end + 1;

        free(token);
        token = NULL;
    }

    if ('\0' != *start) {
        length = strlen(start) + 1;
        token = (char*)calloc(1, length);
        if (NULL == token) {
            user_param_free_string_array(result);
            return -1;
        }

        snprintf(token, length, "%s", start);

        append_string(result, token);

        free(token);
        token = NULL;
    }

    return 0;
}