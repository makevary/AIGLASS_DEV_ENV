#ifndef AI_IPC_H
#define AI_IPC_H

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <semaphore.h>
#include <pthread.h>
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

// =============================================================================
// 共享内存管理
// =============================================================================

/**
 * 共享内存描述符结构体
 * 封装了一个共享内存对象的所有信息
 */
typedef struct {
    char name[64];          // 共享内存名称
    int fd;                 // 文件描述符
    void *ptr;              // 内存映射指针
    size_t size;            // 内存大小
    int is_owner;           // 是否为创建者（用于决定是否在清理时删除）
} ai_shared_memory_t;

/**
 * @brief 创建或打开共享内存
 * @param shm 共享内存描述符指针
 * @param name 共享内存名称（以/开头）
 * @param size 内存大小（字节）
 * @param create_new 是否创建新的（1）还是打开现有的（0）
 * @return 0成功，-1失败
 */
int ai_shm_create(ai_shared_memory_t *shm, const char *name, size_t size, int create_new);

/**
 * @brief 打开现有的共享内存
 * @param shm 共享内存描述符指针
 * @param name 共享内存名称
 * @param size 预期的内存大小
 * @return 0成功，-1失败
 */
int ai_shm_open(ai_shared_memory_t *shm, const char *name, size_t size);

/**
 * @brief 清理共享内存资源
 * @param shm 共享内存描述符指针
 * @param unlink_name 是否删除共享内存对象（通常只有创建者才删除）
 */
void ai_shm_cleanup(ai_shared_memory_t *shm, int unlink_name);

/**
 * @brief 获取共享内存指针
 * @param shm 共享内存描述符指针
 * @return 内存指针，失败返回NULL
 */
void* ai_shm_get_ptr(ai_shared_memory_t *shm);

/**
 * @brief 获取共享内存大小
 * @param shm 共享内存描述符指针
 * @return 内存大小
 */
size_t ai_shm_get_size(ai_shared_memory_t *shm);

// =============================================================================
// Unix Domain Socket管理
// =============================================================================

/**
 * Unix Socket服务器描述符
 */
typedef struct {
    char path[108];         // Socket文件路径
    int server_fd;          // 服务器socket文件描述符
    int is_running;         // 运行状态
    pthread_t thread;       // 服务线程
    void *user_data;        // 用户自定义数据
    void (*client_handler)(int client_fd, void *user_data);  // 客户端处理回调
} ai_unix_socket_server_t;

/**
 * @brief 创建Unix Socket服务器
 * @param server 服务器描述符指针
 * @param path Socket文件路径
 * @param client_handler 客户端处理回调函数
 * @param user_data 用户自定义数据
 * @return 0成功，-1失败
 */
int ai_unix_server_create(ai_unix_socket_server_t *server, const char *path,
                         void (*client_handler)(int, void*), void *user_data);

/**
 * @brief 启动Unix Socket服务器（非阻塞）
 * @param server 服务器描述符指针
 * @return 0成功，-1失败
 */
int ai_unix_server_start(ai_unix_socket_server_t *server);

/**
 * @brief 停止Unix Socket服务器
 * @param server 服务器描述符指针
 */
void ai_unix_server_stop(ai_unix_socket_server_t *server);

/**
 * @brief 连接到Unix Socket服务器
 * @param path Socket文件路径
 * @return 客户端socket文件描述符，失败返回-1
 */
int ai_unix_client_connect(const char *path);

// =============================================================================
// 信号量管理
// =============================================================================

/**
 * 信号量描述符
 */
typedef struct {
    char name[64];          // 信号量名称
    sem_t *sem;             // 信号量指针
    int is_owner;           // 是否为创建者
} ai_semaphore_t;

/**
 * @brief 创建或打开信号量
 * @param sem 信号量描述符指针
 * @param name 信号量名称（以/开头）
 * @param initial_value 初始值（仅创建时有效）
 * @param create_new 是否创建新的（1）还是打开现有的（0）
 * @return 0成功，-1失败
 */
int ai_sem_create(ai_semaphore_t *sem, const char *name, int initial_value, int create_new);

/**
 * @brief 等待信号量
 * @param sem 信号量描述符指针
 * @return 0成功，-1失败
 */
int ai_sem_wait(ai_semaphore_t *sem);

/**
 * @brief 非阻塞等待信号量
 * @param sem 信号量描述符指针
 * @return 0成功，-1失败（包括没有获取到信号量）
 */
int ai_sem_trywait(ai_semaphore_t *sem);

/**
 * @brief 释放信号量
 * @param sem 信号量描述符指针
 * @return 0成功，-1失败
 */
int ai_sem_post(ai_semaphore_t *sem);

/**
 * @brief 清理信号量资源
 * @param sem 信号量描述符指针
 * @param unlink_name 是否删除信号量对象
 */
void ai_sem_cleanup(ai_semaphore_t *sem, int unlink_name);

#ifdef __cplusplus
}
#endif

#endif // AI_IPC_H