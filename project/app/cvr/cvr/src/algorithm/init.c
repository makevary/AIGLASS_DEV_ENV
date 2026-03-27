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

#include "utils/log.h"
#include "core/sys.h"

#ifdef RKAUTO
#include "algorithm/auto/auto.h"
#endif

#ifdef RKAUDIO
#include "algorithm/audio/audio.h"
#endif

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/


/*****************************************************************************************/

static int32_t ai_init(void) {
#ifdef RKAUTO
    algorithm_adas_init();
#endif

#ifdef RKAUDIO
    algorithm_audio_init();
#endif

    return 0;
}

static void ai_deinit(void) {
#ifdef RKAUDIO
    algorithm_audio_deinit();
#endif

#ifdef RKAUTO
    algorithm_adas_deinit();
#endif
}

static int32_t ai_sleep(void) {
#ifdef RKAUDIO
    algorithm_audio_deinit();
#endif

#ifdef RKAUTO
    algorithm_adas_deinit();
#endif
    return 0;
}

static int32_t ai_wakeup(void) {
#ifdef RKAUTO
    algorithm_adas_init();
#endif

#ifdef RKAUDIO
    algorithm_audio_init();
#endif

    return 0;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

static module_node_t ai_module = {
    .priority = MODULE_LEVEL_AI,
    .ops = {
        .init = ai_init,
        .deinit = ai_deinit,
        .sleep = ai_sleep,
        .wakeup = ai_wakeup
    }
};

SYS_MODULE_REGISTER(ai_module)