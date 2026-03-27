/****************************************************************************
 *
 *    Copyright (c) 2023 by Rockchip Corp.  All rights reserved.
 *
 *    The material in this file is confidential and contains trade secrets
 *    of Rockchip Corporation. This is proprietary information owned by
 *    Rockchip Corporation. No part of this work may be disclosed,
 *    reproduced, copied, transmitted, or used in any way for any purpose,
 *    without the express written permission of Rockchip Corporation.
 *
 *****************************************************************************/
#ifdef RKAUDIO

#ifndef _ALGORITHM_AUDIO_H_
#define _ALGORITHM_AUDIO_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int32_t algorithm_audio_init(void);
void    algorithm_audio_deinit(void);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
#endif