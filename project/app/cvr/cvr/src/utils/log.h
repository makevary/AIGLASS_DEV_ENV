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

#ifndef _CVR_UTILS_LOG_H_
#define _CVR_UTILS_LOG_H_

#define DEBUG    1

#define TCS_NONE(fp)            fprintf (fp, "\e[0m")
#define TCS_BLACK(fp)           fprintf (fp, "\e[0;30m")
#define TCS_BOLD_BLACK(fp)      fprintf (fp, "\e[1;30m")
#define TCS_RED(fp)             fprintf (fp, "\e[0;31m")
#define TCS_BOLD_RED(fp)        fprintf (fp, "\e[1;31m")
#define TCS_GREEN(fp)           fprintf (fp, "\e[0;32m")
#define TCS_BOLD_GREEN(fp)      fprintf (fp, "\e[1;32m")
#define TCS_BROWN(fp)           fprintf (fp, "\e[0;33m")
#define TCS_YELLOW(fp)          fprintf (fp, "\e[1;33m")
#define TCS_BLUE(fp)            fprintf (fp, "\e[0;34m")
#define TCS_BOLD_BLUE(fp)       fprintf (fp, "\e[1;34m")
#define TCS_PURPLE(fp)          fprintf (fp, "\e[0;35m")
#define TCS_BOLD_PURPLE(fp)     fprintf (fp, "\e[1;35m")
#define TCS_CYAN(fp)            fprintf (fp, "\e[0;36m")
#define TCS_BOLD_CYAN(fp)       fprintf (fp, "\e[1;36m")
#define TCS_GRAY(fp)            fprintf (fp, "\e[0;37m")
#define TCS_WHITE(fp)           fprintf (fp, "\e[1;37m")
#define TCS_BOLD(fp)            fprintf (fp, "\e[1m")
#define TCS_UNDERLINE(fp)       fprintf (fp, "\e[4m")
#define TCS_BLINK(fp)           fprintf (fp, "\e[5m")
#define TCS_REVERSE(fp)         fprintf (fp, "\e[7m")
#define TCS_HIDE(fp)            fprintf (fp, "\e[8m")
#define TCS_CLEAR(fp)           fprintf (fp, "\e[2J")
#define TCS_CLRLINE(fp)         fprintf (fp, "\e[1K\r")

#define CVR_ERR(fmt, ...)                   \
    do {                                        \
        TCS_RED (stderr);                       \
        fprintf(stderr, "[ERR] %s(Line %d): ",__FUNCTION__,__LINE__);    \
        fprintf (stderr, fmt, ##__VA_ARGS__);   \
        TCS_NONE (stderr);                      \
    } while (0)


#ifdef DEBUG
#define CVR_INFO(fmt, ...)                   \
    do {                                        \
        TCS_GREEN (stdout);                     \
        fprintf(stdout, "[INFO] %s(Line %d): ",__FUNCTION__,__LINE__);    \
        fprintf (stdout, fmt, ##__VA_ARGS__);   \
        TCS_NONE (stdout);                      \
    } while (0)

#define CVR_WARN(fmt, ...)                   \
    do {                                        \
        TCS_YELLOW (stderr);                    \
        fprintf(stderr, "[WARNING] %s(Line %d): ",__FUNCTION__,__LINE__);    \
        fprintf (stderr, fmt, ##__VA_ARGS__);   \
        TCS_NONE (stderr);                      \
    } while (0)
#else
#   define CVR_INFO(fmt, ...)
#   define CVR_WARN(fmt, ...)
#endif

#endif