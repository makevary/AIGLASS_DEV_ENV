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

#ifndef _CVR_UTILS_COMMON_H_
#define _CVR_UTILS_COMMON_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <cvr_conf.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdarg.h>
#include <errno.h>
#include <assert.h>

/**
 * \var PVOID
 * \brief A null pointer to an object maintained in memory.
 */
typedef void *HANDLE;

/**
 * \var PVOID
 * \brief A type definition for a pointer to any type.
 */
typedef void *PVOID;

/**
 * \var typedef int BOOL
 * \brief A type definition for boolean value.
 */
#ifndef BOOL
typedef int BOOL;
#endif

/**
 * \def FALSE
 * \brief FALSE value. The value is 0.
 */
#ifndef FALSE
    #define FALSE       0
#endif
/**
 * \def TRUE
 * \brief TRUE value. The value is 1.
 */
#ifndef TRUE
    #define TRUE        1
#endif

/**
 * \def NULL
 * \brief A value indicates null pointer.
 */
#ifndef NULL
#   ifdef __cplusplus
#       define NULL            (0)
#   else
#       define NULL            ((void *)0)
#   endif
#endif

/**
 * \def INV_PTR
 * \brief A value indicates an invalid non-null pointer.
 */
#define INV_PTR                ((void *)-1)

/**
 * \defgroup err_codes Error codes
 * @{
 */
enum  {
    ERR_OK = 0,         /* Success */
    ERR_FAIL,           /* General error */
    ERR_INNER,          /* Internal error (usually used in the same module, not public */
    ERR_POINTER,        /* illegal pointer */
    ERR_INVALARG,       /* illegal parameter */
    ERR_NOTIMPL = 5,    /* Function not implemented */
    ERR_OUTOFMEM,       /* memory request failed / insufficient memory */
    ERR_BUFERROR,       /* buffer error (insufficient, panic) */
    ERR_PERM,           /* Insufficient permissions to access unauthorized objects */
    ERR_TIMEOUT,        /* time out */
    ERR_NOTINIT = 10,   /* Uninitialized */
    ERR_INITFAIL,       /* initialization failed */
    ERR_ALREADY,        /* Initialized, already running */
    ERR_INPROGRESS,     /* Already running, in progress */
    ERR_EXIST,          /* Application resource object (such as file or directory) already exists */
    ERR_NOTEXIST,       /* Resource objects (such as files or directories), commands, devices, etc. do not exist */
    ERR_BUSY,           /* Device or resource busy (resource not available) */
    ERR_FULL,           /* device/resource is full */
    ERR_EMPTY,          /* object/memory/content is empty */
    ERR_OPENFAIL,       /* Resource object (such as file or directory, socket) failed to open */
    ERR_READFAIL,       /* Failed to read and receive resource objects (such as files or directories, sockets) */
    ERR_WRITEFAIL,      /* Failed to write or send resource objects (such as files or directories, sockets) */
    ERR_DELFAIL,        /* Resource object (such as file or directory, socket) delete, close failure */
    ERR_CODECFAIL,      /* Encryption and decryption, encoding and decryption failed */
    ERR_CRC_FAIL,       /* crc check error */
    ERR_TOOMANY,        /* Too many messages, buffers, content */
    ERR_TOOSMALL,       /* Too little message, buffer, content */
    ERR_NETNOTREACH,    /* Network unreachable (no route, bad gateway) */
    ERR_NETDOWN,        /* Network unavailable (disconnected) */

    /* more... */
    ERR_END,            /* Occupancy, no actual effect */
};

/**
 * \def TABLE_SIZE(table)
 * \brief A macro returns the number of elements in a \a table.
 */
#define TABLE_SIZE(table)    (sizeof(table) / sizeof(table[0]))

/* MAX/MIN/ABS macors */
/**
 * \def MAX(x, y)
 * \brief A macro returns the maximum of \a x and \a y.
 */
#ifndef MAX
#define MAX(x, y)           (((x) > (y)) ? (x) : (y))
#endif
/**
 * \def MIN(x, y)
 * \brief A macro returns the minimum of \a x and \a y.
 */
#ifndef MIN
#define MIN(x, y)           (((x) < (y)) ? (x) : (y))
#endif

#ifndef MAX_PATH_LEN
#define MAX_PATH_LEN    256
#endif

#ifndef UPALIGNTO
#define UPALIGNTO(value, align) ((value + align - 1) & (~(align - 1)))
#endif

#define UPALIGNTO_32(value)     UPALIGNTO(value, 32)
#define UPALIGNTO_16(value)     UPALIGNTO(value, 16)
#define UPALIGNTO_8(value)      UPALIGNTO(value, 8)

#define DOWNALIGNTO(value, align) (value & (~(align-1)) )
#define DOWNALIGNTO_32(value)   DOWNALIGNTO(value, 32)
#define DOWNALIGNTO_16(value)   DOWNALIGNTO(value, 16)
#define DOWNALIGNTO_8(value)    DOWNALIGNTO(value, 8)

/* Mutex Lock */
#define PTHREAD_MUTEX_INIT_LOCK(mutex)                                           \
  do {                                                                         \
    (RKADK_VOID) pthread_mutex_init(&mutex, NULL);                             \
  } while (0)
#define PTHREAD_MUTEX_LOCK(mutex)                                                \
  do {                                                                         \
    (RKADK_VOID) pthread_mutex_lock(&mutex);                                   \
  } while (0)
#define PTHREAD_MUTEX_UNLOCK(mutex)                                              \
  do {                                                                         \
    (RKADK_VOID) pthread_mutex_unlock(&mutex);                                 \
  } while (0)
#define PTHREAD_MUTEX_DESTROY(mutex)                                             \
  do {                                                                         \
    (RKADK_VOID) pthread_mutex_destroy(&mutex);                                \
  } while (0)

#define PTHREAD_CHECK_EQUAL(a, b, mutex, ret)                                    \
  do {                                                                         \
    if (a == b) {                                                              \
      PTHREAD_MUTEX_UNLOCK(mutex);                                               \
      return ret;                                                              \
    }                                                                          \
  } while (0)


#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif