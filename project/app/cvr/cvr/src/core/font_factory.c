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

#include "core/font_factory.h"

#include "freetype2/ft2build.h"
#include FT_FREETYPE_H
#include FT_GLYPH_H
#include FT_STROKER_H
#include FT_IMAGE_H

/* Mutex Lock */
#define FT2_MUTEX_INIT_LOCK(mutex)                                           \
  do {                                                                         \
     pthread_mutex_init(&(mutex), NULL);                             \
  } while (0)
#define FT2_MUTEX_LOCK(mutex)                                                \
  do {                                                                         \
     pthread_mutex_lock(&(mutex));                                   \
  } while (0)
#define FT2_MUTEX_UNLOCK(mutex)                                              \
  do {                                                                         \
     pthread_mutex_unlock(&(mutex));                                 \
  } while (0)
#define FT2_MUTEX_DESTROY(mutex)                                             \
  do {                                                                         \
     pthread_mutex_destroy(&(mutex));                                \
  } while (0)

#define FD_GET_INST_INFO(handle)     ((FD_DEVFONT_INSTANCE_S *)(handle))

typedef struct {
    pthread_mutex_t  mutex;
    FT_UInt          font_size;
    FT_Face          font_face;
    FT_Vector        advance;
    FT_GlyphSlot     font_slot;
    FT_UInt32        font_color;
} FD_DEVFONT_INSTANCE_S;

static FT_Library g_font_library;

int32_t ft2_init_freetype_library(void) {
    FT_Error error;

    g_font_library = NULL;

    /* Init freetype library */
    error = FT_Init_FreeType (&g_font_library);
    if (error) {
        CVR_ERR("could not initialize FreeType 2 library\n");
        return -1;
    }

    return 0;
}

void ft2_term_freetype_library(void) {
    if (g_font_library) {
        FT_Done_FreeType(g_font_library);
        g_font_library = NULL;
    }
}

HANDLE ft2_create_dev_font(const char *font_path, uint32_t font_size) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = (FD_DEVFONT_INSTANCE_S *)calloc(1, sizeof(FD_DEVFONT_INSTANCE_S));
    if (NULL == dev_font_instance) {
        return NULL;
    }

    FT_Error error = FT_New_Face(g_font_library, font_path, 0, &dev_font_instance->font_face);
    if (FT_Err_Unknown_File_Format == error) {
        CVR_ERR("The file can be opened and read, but its font format is not supported\n");
        goto fail;
    }else if (error) {
        CVR_ERR("please check font_path %s\n", font_path);
        goto fail;
    }

    error = FT_Set_Pixel_Sizes(dev_font_instance->font_face, font_size, 0);
    if (error) {
        CVR_ERR("Failed to set font size, the error code is:%d\n", error);
        goto fail;
    }

    FT2_MUTEX_INIT_LOCK(dev_font_instance->mutex);
    dev_font_instance->font_size = font_size;
    dev_font_instance->font_slot = dev_font_instance->font_face->glyph;

    return dev_font_instance;

fail:
    if (NULL != dev_font_instance) {
        FT_Done_Face(dev_font_instance->font_face);
        dev_font_instance->font_face = NULL;
        free(dev_font_instance);
        dev_font_instance = NULL;
    }

    return NULL;
}

void ft2_destory_dev_font(HANDLE handle) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);
    if (NULL != dev_font_instance) {
        if (dev_font_instance->font_face) {
            FT_Done_Face(dev_font_instance->font_face);
            dev_font_instance->font_face = NULL;
        }

        FT2_MUTEX_DESTROY(dev_font_instance->mutex);
        free(dev_font_instance);
        dev_font_instance = NULL;
    }
}

int32_t ft2_set_font_size(HANDLE handle, uint32_t font_size) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);
    if (NULL == dev_font_instance) {
        return -1;
    }

    FT2_MUTEX_LOCK(dev_font_instance->mutex);
    FT_Error error = FT_Set_Pixel_Sizes(dev_font_instance->font_face, font_size, font_size);
    if (error) {
        CVR_ERR("Failed to set font size, the error code is:%d\n", error);
        FT2_MUTEX_UNLOCK(dev_font_instance->mutex);
        return -1;
    }
    dev_font_instance->font_size = font_size;
    FT2_MUTEX_UNLOCK(dev_font_instance->mutex);

    return 0;
}

uint32_t ft2_get_font_size(HANDLE handle) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);
    if (NULL == dev_font_instance) {
        return 0;
    }

    FT2_MUTEX_LOCK(dev_font_instance->mutex);
    uint32_t font_size = dev_font_instance->font_size;
    FT2_MUTEX_UNLOCK(dev_font_instance->mutex);

    return font_size;
 }

int32_t ft2_set_font_color(HANDLE handle, uint32_t font_color) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);
    if (NULL == dev_font_instance) {
        return -1;
    }

    FT2_MUTEX_LOCK(dev_font_instance->mutex);
    dev_font_instance->font_color = 0x000000FF;
    dev_font_instance->font_color |= font_color >> 8 & 0x0000FF00;  // R
    dev_font_instance->font_color |= font_color << 8 & 0x00FF0000;  // G
    dev_font_instance->font_color |= font_color << 24 & 0xFF000000; // B
    FT2_MUTEX_UNLOCK(dev_font_instance->mutex);

    return 0;
}

uint32_t ft2_get_font_color(HANDLE handle) {
    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);
    if (NULL == dev_font_instance) {
        return 0;
    }

    FT2_MUTEX_LOCK(dev_font_instance->mutex);
    uint32_t font_color = dev_font_instance->font_color;
    FT2_MUTEX_UNLOCK(dev_font_instance->mutex);

    return font_color;
 }

static void draw_argb8888_buffer(FD_DEVFONT_INSTANCE_S *dev_font_instance, uint32_t *buffer,
                                 uint32_t buf_w, uint32_t buf_h) {
    FT_Face font_face = dev_font_instance->font_face;
    FT_GlyphSlot font_slot = dev_font_instance->font_slot;
    FT_UInt32 font_color = dev_font_instance->font_color;

    int32_t i, j, p, q, offset, bmp_offset;
    int32_t left = font_slot->bitmap_left;
    int32_t top = (font_face->size->metrics.ascender >> 6) - font_slot->bitmap_top;
    int32_t right = left + font_slot->bitmap.width;
    int32_t bottom = top + font_slot->bitmap.rows;

    for (j = top, q = 0; j < bottom; j++, q++) {
        offset = j * buf_w;
        bmp_offset = q * font_slot->bitmap.width;
        for (i = left, p = 0; i < right; i++, p++) {
            if (i < 0 || j < 0 || i >= buf_w || j >= buf_h)
                continue;
            else {
                if (font_slot->bitmap.buffer[bmp_offset + p]) {
                    buffer[offset + i] = font_color;
                } else {
                    buffer[offset + i] = 0x00000000;
                }
            }
        }
    }
}

static void draw_argb8888_wchar(FD_DEVFONT_INSTANCE_S *dev_font_instance, u_char *buf_data,
                                uint32_t buf_w, uint32_t buf_h, const wchar_t w_ch) {
    FT_Error error;

    FT_Set_Transform(dev_font_instance->font_face, NULL, &dev_font_instance->advance);
    error = FT_Load_Char(dev_font_instance->font_face, w_ch, FT_LOAD_DEFAULT | FT_LOAD_NO_BITMAP);
    FT_Render_Glyph(dev_font_instance->font_slot, FT_RENDER_MODE_NORMAL); // 8bit per pixel
    if (error) {
        CVR_ERR("FT_Load_Char error\n");
        return;
    }
    draw_argb8888_buffer(dev_font_instance, (uint32_t *)buf_data, buf_w, buf_h);
}

void ft2_draw_text(HANDLE handle, u_char *buf,
                          uint32_t buf_w, uint32_t buf_h, const wchar_t *w_str) {
    if ((NULL == handle) || (NULL == buf) || (NULL == w_str)) {
        return ;
    }

    FD_DEVFONT_INSTANCE_S *dev_font_instance = FD_GET_INST_INFO(handle);

    FT2_MUTEX_LOCK(dev_font_instance->mutex);

    size_t len = wcslen(w_str);
    FT_Vector  *advance = &(dev_font_instance->advance);
    FT_GlyphSlot font_slot = dev_font_instance->font_slot;

    advance->x = 0 * 64;
    advance->y = 0 * 64;
    for (int i = 0; i < len; i++) {
        draw_argb8888_wchar(dev_font_instance, buf, buf_w, buf_h, w_str[i]);
        advance->x += font_slot->advance.x;
        advance->y += font_slot->advance.y;
    }

    FT2_MUTEX_UNLOCK(dev_font_instance->mutex);
}