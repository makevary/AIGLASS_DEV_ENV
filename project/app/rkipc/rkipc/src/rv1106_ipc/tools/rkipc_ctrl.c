// Copyright 2026
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/un.h>
#include <unistd.h>

#include "socket.h"

struct command_map {
	const char *cli_name;
	const char *server_name;
};

static const struct command_map g_command_map[] = {
    {"audio_suspend", "rk_audio_suspend"},
    {"audio_resume", "rk_audio_resume"},
    {"audio_restart", "rk_audio_restart"},
    {"rk_audio_suspend", "rk_audio_suspend"},
    {"rk_audio_resume", "rk_audio_resume"},
    {"rk_audio_restart", "rk_audio_restart"},
};

static const char *resolve_server_name(const char *command) {
	size_t i;

	for (i = 0; i < sizeof(g_command_map) / sizeof(g_command_map[0]); ++i) {
		if (!strcmp(g_command_map[i].cli_name, command))
			return g_command_map[i].server_name;
	}

	return NULL;
}

static void print_usage(const char *program) {
	fprintf(stderr,
	        "Usage: %s <audio_suspend|audio_resume|audio_restart>\n"
	        "       %s <rk_audio_suspend|rk_audio_resume|rk_audio_restart>\n",
	        program, program);
}

static int connect_socket_with_timeout(void) {
	int fd;
	struct sockaddr_un unix_addr;
	struct timeval timeout = {.tv_sec = 2, .tv_usec = 0};
	int hello = 0;

	fd = socket(AF_UNIX, SOCK_STREAM, 0);
	if (fd < 0) {
		perror("socket");
		return -1;
	}

	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) < 0) {
		perror("setsockopt(SO_RCVTIMEO)");
		close(fd);
		return -1;
	}
	if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout)) < 0) {
		perror("setsockopt(SO_SNDTIMEO)");
		close(fd);
		return -1;
	}

	memset(&unix_addr, 0, sizeof(unix_addr));
	unix_addr.sun_family = AF_UNIX;
	snprintf(unix_addr.sun_path, sizeof(unix_addr.sun_path), "%s", CS_PATH);

	if (connect(fd, (struct sockaddr *)&unix_addr,
	            sizeof(unix_addr.sun_family) + strlen(unix_addr.sun_path)) < 0) {
		perror("connect");
		close(fd);
		return -1;
	}

	if (sock_read(fd, &hello, sizeof(hello)) != sizeof(hello)) {
		fprintf(stderr, "failed to read rkipc hello from %s\n", CS_PATH);
		close(fd);
		return -1;
	}

	if (hello != 0)
		fprintf(stderr, "warning: unexpected hello code %d\n", hello);

	return fd;
}

int main(int argc, char *argv[]) {
	const char *server_name;
	int fd;
	int len;
	int err = 0;
	int ret = 0;

	if (argc != 2) {
		print_usage(argv[0]);
		return 2;
	}

	server_name = resolve_server_name(argv[1]);
	if (!server_name) {
		print_usage(argv[0]);
		return 2;
	}

	fd = connect_socket_with_timeout();
	if (fd < 0)
		return 1;

	len = strlen(server_name) + 1;
	if (sock_write(fd, &len, sizeof(len)) != sizeof(len) ||
	    sock_write(fd, server_name, len) != len) {
		fprintf(stderr, "failed to send command %s\n", server_name);
		close(fd);
		return 1;
	}

	if (sock_read(fd, &err, sizeof(err)) != sizeof(err)) {
		fprintf(stderr, "failed to read command result for %s\n", server_name);
		close(fd);
		return 1;
	}
	if (sock_read(fd, &ret, sizeof(ret)) != sizeof(ret)) {
		fprintf(stderr, "failed to read final status for %s\n", server_name);
		close(fd);
		return 1;
	}

	close(fd);
	printf("command=%s err=%d ret=%d\n", server_name, err, ret);

	if (err != 0 || ret != 0)
		return 1;

	return 0;
}
