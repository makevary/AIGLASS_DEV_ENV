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

#ifndef _AUTO_BLOCKHEAP_H_
#define _AUTO_BLOCKHEAP_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */

typedef struct {
    pthread_mutex_t lock;
    size_t          bd_size;     /* block size */
    size_t          heap_size;
    int32_t         free;        /* free memory index */
    void*           heap;
} BLOCK_HEAP_S, *P_BLOCK_HEAP_S;

void  block_data_heap_init(P_BLOCK_HEAP_S heap, size_t bd_size, size_t heap_size);
void* block_data_alloc(P_BLOCK_HEAP_S heap);
void  block_data_free(P_BLOCK_HEAP_S heap, void* data);
void  block_data_heap_destroy(P_BLOCK_HEAP_S heap);

#ifdef __cplusplus
}
#endif  /* __cplusplus */

#endif