#include "common.h"

/*
 * get cmdline from /proc/cmdline
 */
static int read_cmdline_to_buf(void *buf, int len) {
	int fd;
	int ret;
	if (buf == NULL || len < 0) {
		ao_record_service_err("%s: illegal para\n", __func__);
		return -1;
	}
	memset(buf, 0, len);
	fd = open("/proc/cmdline", O_RDONLY);
	if (fd < 0) {
		ao_record_service_err("file /proc/cmdline open failed! reason [%s]\n", strerror(errno));
		return -1;
	}
	ret = read(fd, buf, len);
	close(fd);
	return ret;
}

long get_cmd_val(const char *string, int len) {
	char *addr;
	long value = 0;
	char key_equal[16];
	static char cmdline[1024];
	static char cmd_init = 0;

	if (cmd_init == 0) {
		cmd_init = 1;
		memset(cmdline, 0, sizeof(cmdline));
		read_cmdline_to_buf(cmdline, sizeof(cmdline));
	}

	snprintf(key_equal, sizeof(key_equal), "%s=", string);
	addr = strstr(cmdline, string);
	if (addr) {
		value = strtol(addr + strlen(string) + 1, NULL, len);
		ao_record_service_info("get [%s] value: [0x%0lx]\n", string, value);
	}
	return value;
}


void execute_cmd(char *cmd)
{
	int shell_end_state = 0;
	int cmd_ret = -1;
	FILE *fp = NULL;
	char result[CMD_BUF_SIZE] = "";
	char cmd_append[CMD_BUF_SIZE] = "";

	sprintf(cmd_append, cmd);
	strcat(cmd_append, " 2>&1");

	fp = popen(cmd_append, "r");
	if (NULL == fp) {
		ao_record_service_err("popen cmd [%s] error! reason [%s]\n", cmd_append, strerror(errno));
		goto end;
	}

	while (NULL != fgets(result, CMD_BUF_SIZE, fp)) {
		/* remove newline characters */
		if ('\n' == result[strlen(result) - 1]) {
			result[strlen(result) - 1] = '\0';
		}
	}

	/* shell end state process */
	shell_end_state = pclose(fp);
	if (shell_end_state == -1) {
		ao_record_service_err("pclose error! reason [%s]\n", strerror(errno));
		goto end;
	}
	ao_record_service_dbg("shell end state [%d]\n", shell_end_state);
	if (!WIFEXITED(shell_end_state)) {
		ao_record_service_err("Run cmd [%s] error! reason [%s]\n", cmd_append, strerror(errno));
		goto end;
	} else {
		cmd_ret = WEXITSTATUS(shell_end_state);
	}

end:
	if (NULL == fp || -1 == shell_end_state) {
		strncpy(result, strerror(errno), CMD_BUF_SIZE);
		// printf("errno = %s\n", strerror(errno));
	}

	fp = NULL;
	if (cmd_ret != 0) {
		ao_record_service_err("cmd [%s] execute failed! reason [%s]\n", cmd_append, result);
		exit(-1);
	} else {
		ao_record_service_info("cmd [%s] execute successful!\n", cmd_append);
	}
}

void writel(uint32_t val, uint32_t phy_addr)
{
	int mfd;
	uint8_t *real_io;
	uint32_t real_addr, real_len, offset;

	if (phy_addr & 3) {
		fprintf(stderr, "Address 0x%08x is badly aligned\n", phy_addr);
		exit(1);
	}

	real_addr = phy_addr & ~4095;
	offset = phy_addr - real_addr;
	real_len = 4 + offset;
	real_len = (real_len + 4095) & ~ 4095;

	mfd = open("/dev/mem", O_RDWR | O_SYNC);
	if (mfd == -1) {
		perror("open /dev/mem");
		exit(1);
	}

	real_io = mmap(NULL, real_len, PROT_WRITE, MAP_SHARED, mfd, real_addr);
	if (real_io == (void *)(-1)) {
		fprintf(stderr, "mmap() failed: %s\n", strerror(errno));
		exit(1);
	}

	*(uint32_t *)(real_io + offset) = val;

	munmap(real_io, real_len);
	close (mfd);
}

void read_mem(uint32_t phy_addr, char *data, uint32_t len)
{
	int mfd;
	uint8_t *real_io;
	uint32_t real_addr, real_len, offset;

	if (phy_addr & 3) {
		fprintf(stderr, "Address 0x%08x is badly aligned\n", phy_addr);
		exit(1);
	}

	real_addr = phy_addr & ~4095;
	offset = phy_addr - real_addr;
	real_len = len + offset;
	real_len = (real_len + 4095) & ~ 4095;

	mfd = open("/dev/mem", O_RDWR | O_SYNC);
	if (mfd == -1) {
		perror("open /dev/mem");
		exit(1);
	}

	real_io = mmap(NULL, real_len, PROT_READ, MAP_SHARED, mfd, real_addr);
	if (real_io == (void *)(-1)) {
		fprintf(stderr, "mmap() failed: %s\n", strerror(errno));
		exit(1);
	}

	memcpy(data, real_io + offset, len);

	munmap(real_io, real_len);
	close (mfd);
}

uint32_t readl(const uint32_t phy_addr)
{
	int mfd;
	uint8_t *real_io;
	uint32_t real_addr, real_len, offset, val;

	if (phy_addr & 3) {
		fprintf(stderr, "Address 0x%08x is badly aligned\n", phy_addr);
		exit(1);
	}

	real_addr = phy_addr & ~4095;
	offset = phy_addr - real_addr;
	real_len = 4 + offset;
	real_len = (real_len + 4095) & ~ 4095;

	mfd = open("/dev/mem", O_RDONLY | O_SYNC);
	if (mfd == -1) {
		perror("open /dev/mem");
		exit(1);
	}

	real_io = mmap(NULL, real_len, PROT_READ, MAP_SHARED, mfd, real_addr);
	printf("reallen %d\n");
	if (real_io == (void *)(-1)) {
		fprintf(stderr, "mmap() failed: %s\n", strerror(errno));
		exit(1);
	}

	val = *(uint32_t *)(real_io + offset);
	munmap(real_io, real_len);
	close (mfd);
	return val;
}