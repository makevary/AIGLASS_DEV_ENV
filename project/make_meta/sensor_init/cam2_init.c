#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "sensor_define.h"
#include "sensor_init_info.h"

static int get_param_val (uint32_t *pParam, const char *optarg)
{
#define	PARAMETER_BUF_LEN		17
	char *endptr = NULL;
	char l_parameter_buf[PARAMETER_BUF_LEN] = { 0 };
	strncpy(l_parameter_buf, optarg, PARAMETER_BUF_LEN);
	l_parameter_buf[PARAMETER_BUF_LEN-1] = '\0';

	uint32_t num = 0;
	errno = 0;    /* To distinguish success/failure after call */

	if ( l_parameter_buf[0] == '0' && l_parameter_buf[1] == 'x') {
		num = strtol(l_parameter_buf, &endptr, 16);
	} else {
		num = strtol(l_parameter_buf, &endptr, 10);
	}
	*pParam = num;
	if ((errno == ERANGE && (*pParam == LONG_MAX || *pParam == LONG_MIN))
			|| (errno != 0 && *pParam == 0)) {
		perror("strtol");
		return (EXIT_FAILURE);
	}

	if (endptr == l_parameter_buf) {
		fprintf(stderr, "No digits were found\n");
		return (EXIT_FAILURE);
	}
	if (*endptr != '\0') {
		/* Not necessarily an error... */
		fprintf(stderr, "[Error] Further characters after number: %s\n", endptr);
		return (EXIT_FAILURE);
	}

	return 0;
}


int main(int argc, char *argv[])
{
	if (argc == 1) {
		printf("usage: xxx_init <output file name>");
	}

	char *file_path = argv[1];
	int fd = open(file_path, O_CREAT | O_RDWR | O_TRUNC, 0644);
	if (fd < 0) {
		printf("create %s failed: %s\n", file_path, strerror(errno));
		return -1;
	}

	uint32_t cam2_w = 0;
	uint32_t cam2_h = 0;

	printf ( "argv[0] = %s\n", argv[0] );
	printf ( "argv[1] = %s\n", argv[1] );
	printf ( "argv[2] = %s\n", argv[2] );
	printf ( "argv[3] = %s\n", argv[3] );

	if (get_param_val(&cam2_w, argv[2]) == 0 && get_param_val(&cam2_h, argv[3]) == 0) {
		printf("cam2_w = %d, cam2_h = %d\n", cam2_w, cam2_h);
	} else {
		printf("get_param_val failed\n");
		return -1;
	}
	extern  struct sensor_init_cfg init_data;
	init_data.cam_w = cam2_w;
	init_data.cam_h = cam2_h;

	int len;
	len = write(fd, &init_data, sizeof(struct sensor_init_cfg));

	close(fd);

	if (len < 0) {
		printf("write error:%s\n", strerror(errno));
		return -1;
	}

	printf("make sensor init setting file [%s] len=%d\n", file_path, len);

	return 0;
}
