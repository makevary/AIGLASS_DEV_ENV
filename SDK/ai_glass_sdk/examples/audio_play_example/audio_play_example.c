/**
 * @file audio_play_client.c
 * @brief 音频播放客户端示例程序
 *
 * 使用 AI Audio Client SDK 控制音频播放
 *
 * @version 1.0
 * @date 2025-10-10
 */

#include "ai_audio.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void print_usage(const char *prog) {
    printf("Usage: %s -f|--file <pcm_path> [-v|--volume <0-100>] [-F|--force]\n"
           "%-*s[-r|--rate <sample_rate>] [-c|--channels <1-8>]\n"
           "%-*s[-b|--bitwidth <8|16|24|32>] [-s|--socket <path>]\n"
           "       %s -t|--tts <text> [-v|--volume <0-100>] [-F|--force]\n"
           "%-*s[--no-cache] [-s|--socket <path>]\n"
           "       %s -S|--stop [-s|--socket <path>]\n"
           "       %s -h|--help\n\n",
           prog,
           (int)strlen("Usage: "), "",
           (int)strlen("Usage: "), "",
           prog,
           (int)strlen("Usage: "), "",
           prog,
           prog);

    printf("Options:\n");
    printf("  PCM audio file playback:\n");
    printf("    -f, --file <path>      PCM audio file path (required for PCM play)\n");
    printf("    -r, --rate <hz>        Sample rate in Hz (e.g., 48000)\n");
    printf("    -c, --channels <num>   Number of channels (1-8)\n");
    printf("    -b, --bitwidth <bits>  Bit width (8, 16, 24, or 32)\n\n");
    printf("  TTS text-to-speech:\n");
    printf("    -t, --tts <text>       Text to speak (required for TTS)\n");
    printf("    --no-cache             Disable TTS cache (regenerate every time)\n\n");
    printf("  Common options:\n");
    printf("    -v, --volume <0-100>   Volume level (default: use server setting)\n");
    printf("    -F, --force            Force play (interrupt current playback)\n");
    printf("    -s, --socket <path>    Unix socket path (default: /tmp/ai-core_audio_ctrl)\n");
    printf("    -S, --stop             Stop current playback\n");
    printf("    -h, --help             Show this help message\n\n");

    printf("Examples:\n");
    printf("  PCM playback:\n");
    printf("    %s -f /path/to/audio.pcm\n", prog);
    printf("    %s -f /path/to/audio.pcm -v 80 -r 48000 -F\n\n", prog);
    printf("  TTS playback:\n");
    printf("    %s -t \"Hello World\"\n", prog);
    printf("    %s -t \"重要通知\" -v 90 -F\n", prog);
    printf("    %s -t \"当前时间\" --no-cache\n\n", prog);
    printf("  Stop playback:\n");
    printf("    %s -S\n", prog);
}

int main(int argc, char *argv[]) {
    const char *socket_path = NULL;
    const char *file_path = NULL;
    const char *tts_text = NULL;
    int volume = -1;
    int force = 0;
    int sample_rate = -1;
    int channels = -1;
    int bit_width = -1;
    int stop_only = 0;
    int use_cache = 1;  // TTS默认使用缓存

    // 解析命令行参数
    for (int i = 1; i < argc; ++i) {
        if ((strcmp(argv[i], "--file") == 0 || strcmp(argv[i], "-f") == 0) && i + 1 < argc) {
            file_path = argv[++i];
        } else if ((strcmp(argv[i], "--tts") == 0 || strcmp(argv[i], "-t") == 0) && i + 1 < argc) {
            tts_text = argv[++i];
        } else if (strcmp(argv[i], "--no-cache") == 0) {
            use_cache = 0;
        } else if ((strcmp(argv[i], "--volume") == 0 || strcmp(argv[i], "-v") == 0) && i + 1 < argc) {
            volume = atoi(argv[++i]);
            if (volume < 0) volume = 0;
            if (volume > 100) volume = 100;
        } else if (strcmp(argv[i], "--force") == 0 || strcmp(argv[i], "-F") == 0) {
            force = 1;
        } else if ((strcmp(argv[i], "--rate") == 0 || strcmp(argv[i], "-r") == 0) && i + 1 < argc) {
            sample_rate = atoi(argv[++i]);
        } else if ((strcmp(argv[i], "--channels") == 0 || strcmp(argv[i], "-c") == 0) && i + 1 < argc) {
            channels = atoi(argv[++i]);
        } else if ((strcmp(argv[i], "--bitwidth") == 0 || strcmp(argv[i], "-b") == 0) && i + 1 < argc) {
            bit_width = atoi(argv[++i]);
        } else if ((strcmp(argv[i], "--socket") == 0 || strcmp(argv[i], "-s") == 0) && i + 1 < argc) {
            socket_path = argv[++i];
        } else if (strcmp(argv[i], "--stop") == 0 || strcmp(argv[i], "-S") == 0) {
            stop_only = 1;
        } else if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0) {
            print_usage(argv[0]);
            return 0;
        } else {
            printf("ERROR: unknown option: %s\n\n", argv[i]);
            print_usage(argv[0]);
            return -1;
        }
    }

    // 初始化音频客户端
    ai_audio_t *client = ai_audio_init(socket_path);
    if (!client) {
        printf("ERROR: Failed to initialize audio client\n");
        return -1;
    }

    int result;

    if (stop_only) {
        // 停止播放
        printf("Stopping audio playback...\n");
        result = ai_audio_stop(client);
        if (result == AI_AUDIO_SUCCESS) {
            printf("✅ Audio stopped\n");
        } else {
            printf("❌ Failed to stop audio: %s\n",
                   ai_audio_get_error_string(result));
        }
    } else if (tts_text) {
        // TTS文本播放
        if (file_path) {
            printf("ERROR: Cannot use both --file and --tts at the same time\n\n");
            print_usage(argv[0]);
            ai_audio_cleanup(client);
            return -1;
        }

        // 创建TTS参数
        ai_audio_tts_params_t tts_params = {
            .text = tts_text,
            .volume = volume,
            .force = force,
            .use_cache = use_cache
        };

        // 显示TTS信息
        printf("Playing TTS:\n");
        printf("  Text: \"%s\"\n", tts_text);
        if (volume >= 0) {
            printf("  Volume: %d%%\n", volume);
        }
        if (force) {
            printf("  Mode: Force play (interrupt current)\n");
        } else {
            printf("  Mode: Queue play\n");
        }
        printf("  Cache: %s\n", use_cache ? "Enabled" : "Disabled");

        // 播放TTS
        result = ai_audio_play_tts(client, &tts_params);
        if (result == AI_AUDIO_SUCCESS) {
            printf("✅ TTS playback started\n");
        } else {
            printf("❌ Failed to play TTS: %s\n",
                   ai_audio_get_error_string(result));
        }
    } else if (file_path) {
        // PCM文件播放
        // 创建播放参数
        ai_audio_params_t params = {
            .file_path = file_path,
            .volume = volume,
            .force = force,
            .sample_rate = sample_rate,
            .channels = channels,
            .bit_width = bit_width
        };

        // 显示播放信息
        printf("Playing audio:\n");
        printf("  File: %s\n", file_path);
        if (volume >= 0) {
            printf("  Volume: %d%%\n", volume);
        }
        if (force) {
            printf("  Mode: Force play (interrupt current)\n");
        } else {
            printf("  Mode: Queue play\n");
        }
        if (sample_rate > 0) {
            printf("  Sample rate: %d Hz\n", sample_rate);
        }
        if (channels > 0) {
            printf("  Channels: %d\n", channels);
        }
        if (bit_width > 0) {
            printf("  Bit width: %d\n", bit_width);
        }

        // 播放
        result = ai_audio_play(client, &params);
        if (result == AI_AUDIO_SUCCESS) {
            printf("✅ Audio playback started\n");
        } else {
            printf("❌ Failed to play audio: %s\n",
                   ai_audio_get_error_string(result));
        }
    } else {
        // 没有指定任何播放内容
        printf("ERROR: Either --file or --tts is required for playback\n\n");
        print_usage(argv[0]);
        ai_audio_cleanup(client);
        return -1;
    }

    // 清理
    ai_audio_cleanup(client);
    return (result == AI_AUDIO_SUCCESS) ? 0 : -1;
}
