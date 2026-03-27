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

#ifndef _USER_PARAM_H_
#define _USER_PARAM_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdint.h>

typedef struct {
    char** strings;
    size_t size;
} string_array_t, *string_array_p;

void user_param_dump(void);

int32_t user_param_save(void);

void user_param_dump_to_file(FILE *f);

void user_param_unload(void);

const char* user_param_get_string(const char *section,
                                  const char *key, const char *default_value);

int32_t user_param_set_string(const char *section,
                              const char *key, const char *value);

int32_t user_param_get_int(const char *section,
                           const char *key, int32_t default_value);

int32_t user_param_set_int(const char *section,
                           const char *key, int32_t value);

double user_param_get_double(const char *section,
                             const char *key, double default_value);

int32_t user_param_set_double(const char *section,
                              const char *key, double value);

void user_param_init_string_array(string_array_p array);

void user_param_free_string_array(string_array_p array);

int32_t user_param_parse_string_array(const char* input, string_array_p result);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif