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

#include "libconfig.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
struct config_ops_list {
    char suffix[32];
    struct config_ops *ops;
};

/**********************
 *  GLOBAL VARIABLES
 **********************/
extern struct config_ops ini_ops;

/**********************
 *  STATIC VARIABLES
 **********************/
static struct config_ops_list conf_ops_list[] = {
    {"json", NULL}, /* TODO:  Subsequent expansion*/
    {"ini", &ini_ops}
};

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static char *get_file_suffix(const char *name) {
    int32_t point = '.';
    char *tmp = strrchr((char *)name, point);
    if (tmp) {
        return tmp + 1;
    }
    return NULL;
}

static struct config_ops *find_backend(const char *name) {
    int32_t i = 0;
    int32_t max_list;
    char *suffix;
    if (!name) {
        printf("config name can not be NULL\n");
        return NULL;
    }
    max_list = sizeof(conf_ops_list)/sizeof(conf_ops_list[0]);
    suffix = get_file_suffix(name);
    if (!suffix) {
        printf("there is no suffix in config name\n");
        return NULL;
    }

    for (i = 0; i < max_list; i++) {
        if (!strcasecmp(conf_ops_list[i].suffix, suffix)) {
            break;
        }
    }

    if (i == max_list) {
        printf("the %s file is not supported\n", suffix);
        return NULL;
    }

    return conf_ops_list[i].ops;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

struct config *conf_load(const char *name) {
    struct config *c;
    struct config_ops *ops = find_backend(name);
    if (!ops) {
        printf("can not find valid config backend\n");
        return NULL;
    }

    c = (struct config *)calloc(1, sizeof(struct config));
    if (!c) {
        printf("malloc failed!\n");
        return NULL;
    }

    c->ops = ops;
    if (c->ops->load) {
        if (-1 == c->ops->load(c, name)) {
            free(c);
            return NULL;
        }
    }

    return c;
}

void conf_dump(struct config *c) {
    if (!c || !c->ops->dump)
        return;

    c->ops->dump(c, stderr);
}

int32_t conf_save(struct config *c) {
    if (!c || !c->ops->save)
        return -1;

    return c->ops->save(c);
}

void conf_dump_to_file(FILE *f, struct config *c) {
    if (!c || !c->ops->dump)
        return;

    c->ops->dump(c, f);
}

void conf_unload(struct config *c) {
    if (c && c->ops->unload) {
        c->ops->unload(c);
    }

    free(c);
}

const char* conf_get_string(struct config *c, const char *section,
                      const char *key, const char *default_value) {
    if (!c || !c->ops->get_string)
        return NULL;

    return c->ops->get_string(c, section, key, default_value);
}

int32_t conf_set_string(struct config *c, const char *section,
                        const char *key, const char *value) {
    if (!c || !c->ops->set_string)
        return -1;

    return c->ops->set_string(c, section, key, value);
}

int32_t conf_get_int(struct config *c, const char *section,
                     const char *key, int32_t default_value) {
    if (!c || !c->ops->get_int)
        return -1;

    return c->ops->get_int(c, section, key, default_value);
}

int32_t conf_set_int(struct config *c, const char *section,
                     const char *key, int32_t value) {
    if (!c || !c->ops->set_int)
        return -1;

    return c->ops->set_int(c, section, key, value);
}

double conf_get_double (struct config *c, const char *section,
                        const char *key, double default_value) {
    if (!c || !c->ops->get_double)
        return -1;

    return c->ops->get_double(c, section, key, default_value);
}

int32_t conf_set_double(struct config *c, const char *section,
                        const char *key, double value) {
    if (!c || !c->ops->set_double)
        return -1;

    return c->ops->set_double(c, section, key, value);
}