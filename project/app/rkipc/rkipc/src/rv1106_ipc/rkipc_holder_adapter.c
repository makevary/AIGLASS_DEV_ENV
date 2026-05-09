#include "rkipc_holder_adapter.h"

#include <pthread.h>
#include <stdio.h>
#include <string.h>

#include "ai_audio.h"
#include "audio.h"
#include "log.h"

#ifdef LOG_TAG
#undef LOG_TAG
#endif
#define LOG_TAG "rkipc_holder_adapter"

#define RKIPC_HOLDER_ID "rkipc-audio-holder"
#define RKIPC_HOLDER_TIMEOUT_MS 1500

typedef struct {
	pthread_mutex_t mutex;
	ai_audio_t *client;
	int registered;
	int audio_owned;
} rkipc_holder_adapter_state_t;

static rkipc_holder_adapter_state_t g_rkipc_holder_adapter_state = {
	.mutex = PTHREAD_MUTEX_INITIALIZER,
	.client = NULL,
	.registered = 0,
	.audio_owned = 0,
};

static int rkipc_holder_release_resources(int resource_mask, void *user_data) {
	(void)user_data;

	if (resource_mask & AI_AUDIO_RESOURCE_AUDIO)
		return rk_audio_suspend();

	return 0;
}

static int rkipc_holder_acquire_resources(int resource_mask, void *user_data) {
	(void)user_data;

	if (resource_mask & AI_AUDIO_RESOURCE_AUDIO)
		return rk_audio_resume();

	return 0;
}

static int rkipc_holder_get_resource_status(int *camera_owned, int *audio_owned, void *user_data) {
	(void)user_data;

	if (!camera_owned || !audio_owned)
		return -1;

	pthread_mutex_lock(&g_rkipc_holder_adapter_state.mutex);
	*camera_owned = 0;
	*audio_owned = g_rkipc_holder_adapter_state.audio_owned;
	pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);

	return 0;
}

static int rkipc_holder_sync_registration_locked(int owned_mask) {
	ai_media_holder_registration_t registration;

	if (!g_rkipc_holder_adapter_state.client)
		return -1;

	memset(&registration, 0, sizeof(registration));
	registration.holder_id = RKIPC_HOLDER_ID;
	registration.owned_mask = owned_mask;
	registration.reclaim_timeout_ms = RKIPC_HOLDER_TIMEOUT_MS;
	registration.ops.release_resources = rkipc_holder_release_resources;
	registration.ops.acquire_resources = rkipc_holder_acquire_resources;
	registration.ops.get_resource_status = rkipc_holder_get_resource_status;
	registration.user_data = NULL;

	return ai_media_register_holder(g_rkipc_holder_adapter_state.client, &registration);
}

static void rkipc_holder_on_audio_owner_change(int audio_owned, void *user_data) {
	int result = 0;
	(void)user_data;

	pthread_mutex_lock(&g_rkipc_holder_adapter_state.mutex);
	g_rkipc_holder_adapter_state.audio_owned = audio_owned ? 1 : 0;
	result = rkipc_holder_sync_registration_locked(audio_owned ? AI_AUDIO_RESOURCE_AUDIO : 0);
	if (result == AI_AUDIO_SUCCESS)
		g_rkipc_holder_adapter_state.registered = 1;
	pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);

	if (result == AI_AUDIO_SUCCESS) {
		LOG_INFO("holder adapter sync ok audio_owned=%d\n", audio_owned);
	} else {
		LOG_ERROR("holder adapter sync failed audio_owned=%d ret=%d\n", audio_owned, result);
	}
}

int rkipc_holder_adapter_init(void) {
	int result = 0;

	pthread_mutex_lock(&g_rkipc_holder_adapter_state.mutex);
	if (g_rkipc_holder_adapter_state.client) {
		pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);
		return 0;
	}

	g_rkipc_holder_adapter_state.client = ai_audio_init(NULL);
	if (!g_rkipc_holder_adapter_state.client) {
		pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);
		LOG_ERROR("holder adapter ai_audio_init failed\n");
		return -1;
	}

	g_rkipc_holder_adapter_state.audio_owned = rk_audio_is_owned_by_rkipc() ? 1 : 0;
	result = rkipc_holder_sync_registration_locked(g_rkipc_holder_adapter_state.audio_owned ?
						     AI_AUDIO_RESOURCE_AUDIO : 0);
	if (result == AI_AUDIO_SUCCESS)
		g_rkipc_holder_adapter_state.registered = 1;
	pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);

	rkipc_audio_set_owner_change_callback(rkipc_holder_on_audio_owner_change, NULL);

	if (result != AI_AUDIO_SUCCESS) {
		LOG_ERROR("holder adapter initial register failed ret=%d\n", result);
		return -1;
	}

	LOG_INFO("holder adapter init ok audio_owned=%d\n", rk_audio_is_owned_by_rkipc());
	return 0;
}

void rkipc_holder_adapter_deinit(void) {
	ai_audio_t *client = NULL;
	int registered = 0;

	rkipc_audio_set_owner_change_callback(NULL, NULL);

	pthread_mutex_lock(&g_rkipc_holder_adapter_state.mutex);
	client = g_rkipc_holder_adapter_state.client;
	registered = g_rkipc_holder_adapter_state.registered;
	g_rkipc_holder_adapter_state.client = NULL;
	g_rkipc_holder_adapter_state.registered = 0;
	g_rkipc_holder_adapter_state.audio_owned = 0;
	pthread_mutex_unlock(&g_rkipc_holder_adapter_state.mutex);

	if (!client)
		return;

	if (registered)
		ai_media_unregister_holder(client, RKIPC_HOLDER_ID);
	ai_audio_cleanup(client);
	LOG_INFO("holder adapter deinit done\n");
}
