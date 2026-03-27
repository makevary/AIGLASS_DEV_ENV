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
#ifndef _ALGORITHM_AUTO_H_
#define _ALGORITHM_AUTO_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void    algorithm_adas_pause(void);
void    algorithm_adas_resume(void);
int32_t algorithm_adas_init(void);
void    algorithm_adas_deinit(void);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif