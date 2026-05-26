#ifndef AI_LOG_H
#define AI_LOG_H

#include <stdarg.h>

/**
 * @brief 统一的日志系统
 *
 * 提供带毫秒级时间戳的日志输出函数
 * 格式: [YYYY-MM-DD HH:MM:SS.mmm] 用户的日志内容
 */

/**
 * @brief 输出信息级别日志
 * @param fmt 格式化字符串 (和 printf 一样)
 * @param ... 可变参数
 *
 * 示例:
 *   log_info("✅ 音频播放成功\n");
 *   log_info("连接到服务器: %s:%d\n", host, port);
 */
void log_info(const char *fmt, ...);

/**
 * @brief 输出错误级别日志
 * @param fmt 格式化字符串 (和 printf 一样)
 * @param ... 可变参数
 *
 * 示例:
 *   log_error("❌ 连接失败: %s\n", strerror(errno));
 */
void log_error(const char *fmt, ...);

/**
 * @brief 输出调试级别日志
 * @param fmt 格式化字符串 (和 printf 一样)
 * @param ... 可变参数
 *
 * 示例:
 *   log_debug("📡 收到数据: %d 字节\n", len);
 */
void log_debug(const char *fmt, ...);

/**
 * @brief 输出警告级别日志
 * @param fmt 格式化字符串 (和 printf 一样)
 * @param ... 可变参数
 *
 * 示例:
 *   log_warn("⚠️  缓冲区将满: %d%%\n", usage);
 */
void log_warn(const char *fmt, ...);

#endif // AI_LOG_H
