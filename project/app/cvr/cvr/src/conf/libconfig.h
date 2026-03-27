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

#ifndef _LIBCONFIG_H_
#define _LIBCONFIG_H_

#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct config {
    struct config_ops *ops;
    char path[PATH_MAX];
    void *parser;
} config_t;

typedef struct config_ops {
    int32_t  (*load)  (config_t *c, const char *name);
    void     (*unload)(config_t *c);
    void     (*dump)  (config_t *c, FILE *f);
    int32_t  (*save)  (config_t *c);

    const char* (*get_string) (config_t *c, const char *section,
                               const char *key, const char *default_value);
    int32_t  (*set_string) (config_t *c, const char *section,
                            const char *key, const char *value);

    int32_t  (*get_int)    (config_t *c, const char *section,
                            const char *key, int32_t default_value);
    int32_t  (*set_int)    (config_t *c, const char *section,
                            const char *key, int32_t value);

    double   (*get_double) (config_t *c, const char *section,
                            const char *key, double default_value);
    int32_t  (*set_double) (config_t *c, const char *section,
                            const char *key, double value);

    int32_t  (*del_key)    (config_t *c, const char *section, const char *key);
} config_ops_t;

config_t *conf_load(const char *name);
void conf_dump(config_t *c);
int32_t conf_save(config_t *c);
void conf_dump_to_file(FILE *f, config_t *c);
void conf_unload(config_t *c);
const char* conf_get_string(config_t *c, const char *section,
                      const char *key, const char *default_value);
int32_t conf_set_string(config_t *c, const char *section,
                        const char *key, const char *value);
int32_t conf_get_int(config_t *c, const char *section,
                     const char *key, int32_t default_value);
int32_t conf_set_int(config_t *c, const char *section,
                     const char *key, int32_t value);
double conf_get_double (config_t *c, const char *section,
                        const char *key, double default_value);
int32_t conf_set_double(config_t *c, const char *section,
                        const char *key, double value);

#ifdef __cplusplus
}
#endif

#endif