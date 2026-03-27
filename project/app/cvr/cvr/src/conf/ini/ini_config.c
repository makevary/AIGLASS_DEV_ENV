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

#include "../libconfig.h"
#include "iniparser.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define MAX_KEY_LEN 256
#define MAX_VALUE_LEN 256

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static int32_t ini_load(struct config *c, const char *name) {
    dictionary *ini = iniparser_load(name);
    if (!ini) {
        printf("iniparser_load %s failed!\n", name);
        return -1;
    }
    c->parser = (void *)ini;
    strncpy(c->path, name, sizeof(c->path) - 1);
    c->path[sizeof(c->path) - 1] = '\0';
    return 0;
}

static void ini_unload(struct config *c) {
    dictionary *ini = (dictionary *)c->parser;
    iniparser_freedict(ini);
}

static void ini_dump(struct config *c, FILE *f) {
    dictionary *ini = (dictionary *)c->parser;
    iniparser_dump_ini(ini, f);
}

static int32_t ini_save(struct config *c) {
    dictionary *ini;
    FILE *f = fopen(c->path, "w+");
    if (!f)
        return -1;

    ini = (dictionary *)c->parser;
    iniparser_dump_ini(ini, f);
    fclose(f);

    return 0;
}

static const char* ini_get_string(config_t *c, const char *section,
                                  const char *key, const char *default_value) {
    char full_key[MAX_KEY_LEN];
    snprintf(full_key, MAX_KEY_LEN, "%s:%s", section, key);
    const char *value = iniparser_getstring(c->parser, full_key, NULL);
    if (NULL == value)
        return default_value;
    return value;
}

static int32_t ini_set_string(config_t *c, const char *section,
                              const char *key, const char *value) {
    char full_key[MAX_KEY_LEN];

    if (0 == iniparser_find_entry(c->parser, section)) {
        int32_t ret = iniparser_set(c->parser, section, NULL);
        if (0 != ret || NULL == value)
            return ret;
    } 

    if (NULL == value)
        return 0;

    snprintf(full_key, MAX_KEY_LEN, "%s:%s", section, key);

    return iniparser_set(c->parser, full_key, value);
}

static int32_t ini_get_int(config_t *c, const char *section,
                           const char *key, int32_t default_value) {
    char full_key[MAX_KEY_LEN];
    snprintf(full_key, MAX_KEY_LEN, "%s:%s", section, key);
    return iniparser_getint(c->parser, full_key, default_value);
}

static int32_t ini_set_int(config_t *c, const char *section,
                           const char *key, int32_t value) {
    char str[MAX_VALUE_LEN];
    snprintf(str, sizeof(str), "%d", value);
    return ini_set_string(c, section, key, str);
}

static double ini_get_double(config_t *c, const char *section,
                             const char *key, double default_value) {
    char full_key[MAX_KEY_LEN];
    snprintf(full_key, MAX_KEY_LEN, "%s:%s", section, key);
    return iniparser_getdouble(c->parser, full_key, default_value);
}

static int32_t ini_set_double (config_t *c, const char *section,
                               const char *key, double value) {
    char str[MAX_VALUE_LEN];
    snprintf(str, sizeof(str), "%f", value);
    return ini_set_string(c, section, key, str);
}

static int32_t ini_del_key(config_t *c, const char *section, const char *key) {
    char full_key[MAX_KEY_LEN];
    snprintf(full_key, MAX_KEY_LEN, "%s:%s", section, key);
    iniparser_unset(c->parser, full_key);
    return 0;
}

struct config_ops ini_ops = {
    ini_load,
    ini_unload,
    ini_dump,
    ini_save,

    ini_get_string,
    ini_set_string,

    ini_get_int,
    ini_set_int,

    ini_get_double,
    ini_set_double,

    ini_del_key
};