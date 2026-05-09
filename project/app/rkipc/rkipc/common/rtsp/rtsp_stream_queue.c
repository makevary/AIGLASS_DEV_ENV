// Copyright 2026
// SPDX-License-Identifier: BSD-3-Clause

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RTSP_RTP_ITEM_SIZE 1456
#define RTSP_VIDEO_QUEUE_ITEMS 1201
#define RTSP_AUDIO_QUEUE_ITEMS 41
#define RTSP_LOW_LATENCY_WINDOW_MS 300
#define RTSP_VIDEO_CLOCK_RATE 90000
#define RTSP_AUDIO_CLOCK_RATE 16000

typedef struct {
	int item_size;
	int item_count;
	int head;
	int tail;
	int timestamp_clock_rate;
	uint32_t timestamp_window;
	int *item_lengths;
	uint8_t *items;
} rkipc_rtsp_stream_queue_t;

static uint32_t rkipc_rtsp_read_be32(const uint8_t *data) {
	return ((uint32_t)data[0] << 24) | ((uint32_t)data[1] << 16) |
	       ((uint32_t)data[2] << 8) | (uint32_t)data[3];
}

static int rkipc_rtsp_queue_next(rkipc_rtsp_stream_queue_t *queue, int index) {
	if (!queue || queue->item_count <= 0)
		return -1;
	return (index + 1) % queue->item_count;
}

static int rkipc_rtsp_queue_inused(rkipc_rtsp_stream_queue_t *queue, int index) {
	if (!queue || index < 0 || index >= queue->item_count)
		return -1;

	if (queue->head <= queue->tail)
		return index >= queue->head && index < queue->tail;

	return index >= queue->head || index < queue->tail;
}

static int rkipc_rtsp_queue_used_count(rkipc_rtsp_stream_queue_t *queue) {
	if (!queue)
		return 0;
	if (queue->tail >= queue->head)
		return queue->tail - queue->head;
	return queue->item_count - queue->head + queue->tail;
}

static uint8_t *rkipc_rtsp_queue_item(rkipc_rtsp_stream_queue_t *queue, int index) {
	return queue->items + ((size_t)index * queue->item_size);
}

static void rkipc_rtsp_trim_low_latency(rkipc_rtsp_stream_queue_t *queue) {
	if (!queue || queue->timestamp_window == 0)
		return;

	int newest_index = queue->tail == 0 ? queue->item_count - 1 : queue->tail - 1;
	if (!rkipc_rtsp_queue_inused(queue, newest_index))
		return;

	uint32_t newest_ts = rkipc_rtsp_read_be32(rkipc_rtsp_queue_item(queue, newest_index) + 4);
	while (rkipc_rtsp_queue_used_count(queue) > 1) {
		uint32_t oldest_ts = rkipc_rtsp_read_be32(rkipc_rtsp_queue_item(queue, queue->head) + 4);
		uint32_t age = newest_ts - oldest_ts;
		if (age <= queue->timestamp_window)
			break;
		queue->head = rkipc_rtsp_queue_next(queue, queue->head);
	}
}

void *streamq_alloc(int item_size, int item_count) {
	if (item_size <= 0 || item_count <= 0)
		return NULL;

	rkipc_rtsp_stream_queue_t *queue = calloc(1, sizeof(*queue));
	if (!queue)
		return NULL;

	queue->item_lengths = calloc((size_t)item_count, sizeof(*queue->item_lengths));
	queue->items = calloc((size_t)item_count, (size_t)item_size);
	if (!queue->item_lengths || !queue->items) {
		free(queue->items);
		free(queue->item_lengths);
		free(queue);
		return NULL;
	}

	queue->item_size = item_size;
	queue->item_count = item_count;
	if (item_size == RTSP_RTP_ITEM_SIZE && item_count == RTSP_VIDEO_QUEUE_ITEMS) {
		queue->timestamp_clock_rate = RTSP_VIDEO_CLOCK_RATE;
		queue->timestamp_window =
		    (RTSP_VIDEO_CLOCK_RATE * RTSP_LOW_LATENCY_WINDOW_MS) / 1000;
	} else if (item_size == RTSP_RTP_ITEM_SIZE && item_count == RTSP_AUDIO_QUEUE_ITEMS) {
		queue->timestamp_clock_rate = RTSP_AUDIO_CLOCK_RATE;
		queue->timestamp_window =
		    (RTSP_AUDIO_CLOCK_RATE * RTSP_LOW_LATENCY_WINDOW_MS) / 1000;
	}

	printf("rtsp streamq_alloc size is %zu low_latency_window_ms=%d\n",
	       sizeof(*queue) + ((size_t)item_count * sizeof(*queue->item_lengths)) +
	           ((size_t)item_count * (size_t)item_size),
	       queue->timestamp_window ? RTSP_LOW_LATENCY_WINDOW_MS : 0);
	return queue;
}

int streamq_query(void *handle, int index, void **item, int **item_length) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	if (!queue || index < 0 || index >= queue->item_count)
		return -1;

	if (item)
		*item = rkipc_rtsp_queue_item(queue, index);
	if (item_length)
		*item_length = &queue->item_lengths[index];
	return 0;
}

int streamq_inused(void *handle, int index) {
	return rkipc_rtsp_queue_inused(handle, index);
}

int streamq_next(void *handle, int index) {
	return rkipc_rtsp_queue_next(handle, index);
}

int streamq_head(void *handle) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	return queue ? queue->head : -1;
}

int streamq_tail(void *handle) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	return queue ? queue->tail : -1;
}

int streamq_push(void *handle) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	if (!queue)
		return -1;

	int next_tail = rkipc_rtsp_queue_next(queue, queue->tail);
	if (next_tail == queue->head)
		queue->head = rkipc_rtsp_queue_next(queue, queue->head);
	queue->tail = next_tail;
	rkipc_rtsp_trim_low_latency(queue);
	return queue->tail;
}

int streamq_pop(void *handle) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	if (!queue)
		return -1;
	if (queue->head == queue->tail)
		return -1;

	queue->head = rkipc_rtsp_queue_next(queue, queue->head);
	return queue->head;
}

void streamq_free(void *handle) {
	rkipc_rtsp_stream_queue_t *queue = handle;
	if (!queue)
		return;

	free(queue->items);
	free(queue->item_lengths);
	free(queue);
}
