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

#ifndef _RK_SIGNAL_H_
#define _RK_SIGNAL_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */

void *rk_signal_create(int32_t defval, int32_t maxval);
void rk_signal_destroy(void *sem);
int32_t rk_signal_wait(void *sem, int32_t timeout);
void rk_signal_give(void *sem);
void rk_signal_reset(void *sem);

#ifdef __cplusplus
}
#endif  /* __cplusplus */

#endif