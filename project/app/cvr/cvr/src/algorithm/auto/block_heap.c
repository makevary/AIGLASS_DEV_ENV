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
#include "block_heap.h"

#include <pthread.h>

#define BDS_FREE        0x00    /* Mark memory free */
#define BDS_SPECIAL     0x01    /* Expand memory, allocate using system calls */
#define BDS_USED        0x02    /* Mark memory usage */

void block_data_heap_init(P_BLOCK_HEAP_S heap, size_t bd_size, size_t heap_size) {
    pthread_mutex_init(&heap->lock, NULL);

    heap->heap = NULL;
    heap->bd_size = bd_size + sizeof(uint8_t);  /* Memory block structure:  flag(1Byte) + data(bd_size) */
    heap->heap_size = heap_size;
}

void* block_data_alloc(P_BLOCK_HEAP_S heap) {
    char* block_data = NULL;

    pthread_mutex_lock(&heap->lock);

    if (heap->heap == NULL) {
        heap->heap = calloc(heap->heap_size, heap->bd_size);
        if (NULL == heap->heap)
            goto END;

        heap->free = 0;
    }

    /* Allocate memory from heap */
    block_data = (char *)heap->heap + heap->bd_size * heap->free;
    for (int32_t i = heap->free; i < heap->heap_size; i++) {
        if (BDS_FREE == *((uint8_t*)block_data)) {
            heap->free = i + 1;
            *((uint8_t*)block_data) = BDS_USED;
            goto END;
        }
        block_data += heap->bd_size;
    }

    /* Use system call after heap memory allocation */
    if (!(block_data = calloc(1, heap->bd_size)))
        goto END;

    *((uint8_t*)block_data) = BDS_SPECIAL;

END:
    pthread_mutex_unlock(&heap->lock);

    if (block_data) {
        return block_data + sizeof(uint8_t);
    }

    return NULL;
}

void block_data_free(P_BLOCK_HEAP_S heap, void* data) {
    int32_t i;
    char* block_data = NULL;

    pthread_mutex_lock(&heap->lock);

    block_data = (char *)data - sizeof(uint8_t);
    if (BDS_SPECIAL == *((uint8_t*)block_data)) {
        free (block_data);
    } else if (BDS_USED == *((uint8_t*)block_data)) {
        *((uint8_t*)block_data) = BDS_FREE;

        i = (block_data - (char *)heap->heap) / heap->bd_size;
        if (heap->free > i)
            heap->free = i;
    }

    pthread_mutex_unlock (&heap->lock);
}

void block_data_heap_destroy(P_BLOCK_HEAP_S heap) {
    pthread_mutex_destroy (&heap->lock);
    free (heap->heap);
}