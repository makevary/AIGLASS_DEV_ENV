// Copyright 2022 Rockchip Electronics Co., Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
int rkipc_ao_init();
int rkipc_ao_deinit();
int rkipc_ao_write(unsigned char *data, int data_len);
int rkipc_audio_init();
int rkipc_audio_deinit();
typedef void (*rkipc_audio_owner_change_callback_t)(int audio_owned, void *user_data);
void rkipc_audio_set_owner_change_callback(rkipc_audio_owner_change_callback_t callback,
                                           void *user_data);
int rk_audio_is_owned_by_rkipc(void);
int rk_audio_uses_ai_core_stream(void);
// export api
int rk_audio_suspend();
int rk_audio_resume();
int rk_audio_restart();
int rk_audio_get_bit_rate(int stream_id, int *value);
int rk_audio_set_bit_rate(int stream_id, int value);
int rk_audio_get_sample_rate(int stream_id, int *value);
int rk_audio_set_sample_rate(int stream_id, int value);
int rk_audio_get_volume(int stream_id, int *value);
int rk_audio_set_volume(int stream_id, int value);
int rk_audio_get_enable_vqe(int stream_id, int *value);
int rk_audio_set_enable_vqe(int stream_id, int value);
int rk_audio_get_encode_type(int stream_id, const char **value);
int rk_audio_set_encode_type(int stream_id, const char *value);
