
target_cflag=-I../include
ifneq ($(cam1_w),)
target=cam1_init.c
endif
target_bin=$(patsubst %.c,%,$(target)) 
target_bin_file=init_sensor.bin

ifneq ($(cam2_w),)
secondary_target=cam2_init.c
secondary_target_bin=$(patsubst %.c,%,$(secondary_target)) 
secondary_target_bin_file=init_secondary_sensor.bin
secondary_build:= secondary_build_target
endif

ifneq ($(findstring RV1106B_EVB2_,$(hardware_info)),)
sensor_gpio_file=rv1106b_evb2_v10_gpio.c
endif
ifneq ($(findstring RV1103B_EVB1_,$(hardware_info)),)
sensor_gpio_file=rv1103b_evb1_v10_gpio.c
endif
ifneq ($(findstring RV1106B_EVB3_,$(hardware_info)),)
sensor_gpio_file=rv1106b_evb3_v10_gpio.c
endif
ifneq ($(findstring RV1106_EVB2,$(hardware_info)),)
sensor_gpio_file=rv1106_evb2_gpio.c
endif

ifeq ($(sensor_gpio_file),)
$(error "please set sensor_gpio_file")
endif
ifeq ($(hardware_info),)
$(error "please set hardware_info")
endif

all: $(secondary_build)
	gcc -m32 -O2 -Wall $(target_cflag) $(target) $(sensor_gpio_file) -o $(patsubst %.c,%,$(target))
	./$(target_bin)  $(target_bin_file) $(cam1_w) $(cam1_h)

secondary_build_target:
	gcc -m32 -O2 -Wall $(target_cflag) $(secondary_target) $(sensor_gpio_file) -o $(patsubst %.c,%,$(secondary_target))
	./$(secondary_target_bin)  $(secondary_target_bin_file) $(cam2_w) $(cam2_h)

clean:
	@rm -f $(target_bin)  $(target_bin_file) $(secondary_target_bin)  $(secondary_target_bin_file)
