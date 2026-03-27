# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
# 40 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h" 1
# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 1
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
# 1 "./rtconfig.h" 1
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdebug.h" 1
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h" 1
# 57 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
typedef signed char rt_int8_t;
typedef signed short rt_int16_t;
typedef signed long rt_int32_t;
typedef signed long long rt_int64_t;
typedef unsigned char rt_uint8_t;
typedef unsigned short rt_uint16_t;
typedef unsigned long rt_uint32_t;
typedef unsigned long long rt_uint64_t;
typedef int rt_bool_t;


typedef long rt_base_t;
typedef unsigned long rt_ubase_t;

typedef rt_base_t rt_err_t;
typedef rt_uint32_t rt_time_t;
typedef rt_uint32_t rt_tick_t;
typedef rt_base_t rt_flag_t;
typedef rt_ubase_t rt_size_t;
typedef rt_ubase_t rt_dev_t;
typedef rt_base_t rt_off_t;
# 125 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stdarg.h" 1 3 4
# 40 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stdarg.h" 3 4

# 40 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 126 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h" 2
# 179 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"

# 179 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
typedef int (*init_fn_t)(void);
# 300 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_list_node
{
    struct rt_list_node *next;
    struct rt_list_node *prev;
};
typedef struct rt_list_node rt_list_t;




struct rt_slist_node
{
    struct rt_slist_node *next;
};
typedef struct rt_slist_node rt_slist_t;
# 330 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_object
{
    char name[8];
    rt_uint8_t type;
    rt_uint8_t flag;




    rt_list_t list;
};
typedef struct rt_object *rt_object_t;
# 360 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
enum rt_object_class_type
{
    RT_Object_Class_Thread = 0,
    RT_Object_Class_Semaphore,
    RT_Object_Class_Mutex,
    RT_Object_Class_Event,
    RT_Object_Class_MailBox,
    RT_Object_Class_MessageQueue,
    RT_Object_Class_MemHeap,
    RT_Object_Class_MemPool,
    RT_Object_Class_Device,
    RT_Object_Class_Timer,
    RT_Object_Class_Module,
    RT_Object_Class_Unknown,
    RT_Object_Class_Static = 0x80
};




struct rt_object_information
{
    enum rt_object_class_type type;
    rt_list_t object_list;
    rt_size_t object_size;
};
# 433 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_timer
{
    struct rt_object parent;

    rt_list_t row[1];

    void (*timeout_func)(void *parameter);
    void *parameter;

    rt_tick_t init_tick;
    rt_tick_t timeout_tick;
};
typedef struct rt_timer *rt_timer_t;
# 507 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_thread
{

    char name[8];
    rt_uint8_t type;
    rt_uint8_t flags;





    rt_list_t list;
    rt_list_t tlist;


    void *sp;
    void *entry;
    void *parameter;
    void *stack_addr;
    rt_uint32_t stack_size;


    rt_err_t error;

    rt_uint8_t stat;


    rt_uint8_t current_priority;
    rt_uint8_t init_priority;




    rt_uint32_t number_mask;



    rt_uint32_t event_set;
    rt_uint8_t event_info;
# 557 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
    rt_ubase_t init_tick;
    rt_ubase_t remaining_tick;







    struct rt_timer thread_timer;

    void (*cleanup)(struct rt_thread *tid);






    rt_uint32_t user_data;
};
typedef struct rt_thread *rt_thread_t;
# 603 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_ipc_object
{
    struct rt_object parent;

    rt_list_t suspend_thread;
};





struct rt_semaphore
{
    struct rt_ipc_object parent;

    rt_uint16_t value;
};
typedef struct rt_semaphore *rt_sem_t;






struct rt_mutex
{
    struct rt_ipc_object parent;

    rt_uint16_t value;

    rt_uint8_t original_priority;
    rt_uint8_t hold;

    struct rt_thread *owner;
};
typedef struct rt_mutex *rt_mutex_t;
# 652 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_event
{
    struct rt_ipc_object parent;

    rt_uint32_t set;
};
typedef struct rt_event *rt_event_t;






struct rt_mailbox
{
    struct rt_ipc_object parent;

    rt_uint32_t *msg_pool;

    rt_uint16_t size;

    rt_uint16_t entry;
    rt_uint16_t in_offset;
    rt_uint16_t out_offset;

    rt_list_t suspend_sender_thread;
};
typedef struct rt_mailbox *rt_mailbox_t;






struct rt_messagequeue
{
    struct rt_ipc_object parent;

    void *msg_pool;

    rt_uint16_t msg_size;
    rt_uint16_t max_msgs;

    rt_uint16_t entry;

    void *msg_queue_head;
    void *msg_queue_tail;
    void *msg_queue_free;
};
typedef struct rt_messagequeue *rt_mq_t;
# 762 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_mempool
{
    struct rt_object parent;

    void *start_address;
    rt_size_t size;

    rt_size_t block_size;
    rt_uint8_t *block_list;

    rt_size_t block_total_count;
    rt_size_t block_free_count;

    rt_list_t suspend_thread;
    rt_size_t suspend_thread_count;
};
typedef struct rt_mempool *rt_mp_t;
# 793 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
enum rt_device_class_type
{
    RT_Device_Class_Char = 0,
    RT_Device_Class_Block,
    RT_Device_Class_NetIf,
    RT_Device_Class_MTD,
    RT_Device_Class_CAN,
    RT_Device_Class_RTC,
    RT_Device_Class_Sound,
    RT_Device_Class_Graphic,
    RT_Device_Class_I2CBUS,
    RT_Device_Class_USBDevice,
    RT_Device_Class_USBHost,
    RT_Device_Class_SPIBUS,
    RT_Device_Class_SPIDevice,
    RT_Device_Class_SDIO,
    RT_Device_Class_PM,
    RT_Device_Class_Pipe,
    RT_Device_Class_Portal,
    RT_Device_Class_Timer,
    RT_Device_Class_Miscellaneous,
    RT_Device_Class_Sensor,
    RT_Device_Class_Touch,
    RT_Device_Class_Unknown
};
# 875 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
typedef struct rt_device *rt_device_t;



struct rt_device_ops
{

    rt_err_t (*init) (rt_device_t dev);
    rt_err_t (*open) (rt_device_t dev, rt_uint16_t oflag);
    rt_err_t (*close) (rt_device_t dev);
    rt_size_t (*read) (rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size);
    rt_size_t (*write) (rt_device_t dev, rt_off_t pos, const void *buffer, rt_size_t size);
    rt_err_t (*control)(rt_device_t dev, int cmd, void *args);
};




struct rt_wqueue
{
    rt_uint32_t flag;
    rt_list_t waiting_list;
};
typedef struct rt_wqueue rt_wqueue_t;




struct rt_device
{
    struct rt_object parent;

    enum rt_device_class_type type;
    rt_uint16_t flag;
    rt_uint16_t open_flag;

    rt_uint8_t ref_count;
    rt_uint8_t device_id;


    rt_err_t (*rx_indicate)(rt_device_t dev, rt_size_t size);
    rt_err_t (*tx_complete)(rt_device_t dev, void *buffer);





    rt_err_t (*init) (rt_device_t dev);
    rt_err_t (*open) (rt_device_t dev, rt_uint16_t oflag);
    rt_err_t (*close) (rt_device_t dev);
    rt_size_t (*read) (rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size);
    rt_size_t (*write) (rt_device_t dev, rt_off_t pos, const void *buffer, rt_size_t size);
    rt_err_t (*control)(rt_device_t dev, int cmd, void *args);







    void *user_data;
};




struct rt_device_blk_geometry
{
    rt_uint32_t sector_count;
    rt_uint32_t bytes_per_sector;
    rt_uint32_t block_size;
};




struct rt_device_blk_sectors
{
    rt_uint32_t sector_begin;
    rt_uint32_t sector_end;
};
# 974 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
enum
{
    RTGRAPHIC_PIXEL_FORMAT_MONO = 0,
    RTGRAPHIC_PIXEL_FORMAT_GRAY1,
    RTGRAPHIC_PIXEL_FORMAT_GRAY4,
    RTGRAPHIC_PIXEL_FORMAT_GRAY16,
    RTGRAPHIC_PIXEL_FORMAT_GRAY256,
    RTGRAPHIC_PIXEL_FORMAT_RGB332,
    RTGRAPHIC_PIXEL_FORMAT_RGB444,
    RTGRAPHIC_PIXEL_FORMAT_RGB565,
    RTGRAPHIC_PIXEL_FORMAT_RGB565P,
    RTGRAPHIC_PIXEL_FORMAT_BGR565 = RTGRAPHIC_PIXEL_FORMAT_RGB565P,
    RTGRAPHIC_PIXEL_FORMAT_RGB666,
    RTGRAPHIC_PIXEL_FORMAT_RGB888,
    RTGRAPHIC_PIXEL_FORMAT_ARGB888,
    RTGRAPHIC_PIXEL_FORMAT_ABGR888,
    RTGRAPHIC_PIXEL_FORMAT_ARGB565,
    RTGRAPHIC_PIXEL_FORMAT_ALPHA,
    RTGRAPHIC_PIXEL_FORMAT_YUV420,
    RTGRAPHIC_PIXEL_FORMAT_YUV422,
    RTGRAPHIC_PIXEL_FORMAT_YUV444,
    RTGRAPHIC_PIXEL_FORMAT_YVYU422,
    RTGRAPHIC_PIXEL_FORMAT_VYUY422,
    RTGRAPHIC_PIXEL_FORMAT_YUV420_4,
    RTGRAPHIC_PIXEL_FORMAT_YUV422_4,
    RTGRAPHIC_PIXEL_FORMAT_YUV444_4,
    RTGRAPHIC_PIXEL_FORMAT_YVYU422_4,
    RTGRAPHIC_PIXEL_FORMAT_VYUY422_4,
};
# 1012 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
struct rt_device_graphic_info
{
    rt_uint8_t pixel_format;
    rt_uint8_t bits_per_pixel;
    rt_uint16_t reserved;

    rt_uint16_t width;
    rt_uint16_t height;

    rt_uint8_t *framebuffer;
};




struct rt_device_rect_info
{
    rt_uint16_t x;
    rt_uint16_t y;
    rt_uint16_t width;
    rt_uint16_t height;
};




struct rt_device_graphic_ops
{
    void (*set_pixel) (const char *pixel, int x, int y);
    void (*get_pixel) (char *pixel, int x, int y);

    void (*draw_hline)(const char *pixel, int x1, int x2, int y);
    void (*draw_vline)(const char *pixel, int x, int y1, int y2);

    void (*blit_line) (const char *pixel, int x, int y, rt_size_t size);
};






# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 1
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_stat.h" 1
# 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_stat.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stat.h" 1 3







# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_ansi.h" 1 3
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_ansi.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/newlib.h" 1 3
# 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/newlib.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_newlib_version.h" 1 3
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/newlib.h" 2 3
# 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_ansi.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/config.h" 1 3



# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/ieeefp.h" 1 3
# 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/config.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/features.h" 1 3
# 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/config.h" 2 3
# 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_ansi.h" 2 3
# 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stat.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 1 3
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/_ansi.h" 1 3
# 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/cdefs.h" 1 3
# 45 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/cdefs.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 1 3
# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3

# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/cdefs.h" 2 3

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 143 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 3 4
typedef int wchar_t;
# 48 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/cdefs.h" 2 3
# 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 1 3
# 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 1 3
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 350 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 2 3


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_types.h" 1 3
# 28 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 90 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 131 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 147 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 158 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 16 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 34 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/lock.h" 1 3
# 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/lock.h" 3
typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 35 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 2 3
typedef _LOCK_RECURSIVE_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};


struct _atexit {
 struct _atexit *_next;
 int _ind;
 void (*_fns[32])(void);
        struct _on_exit_args * _on_exit_args_ptr;
};
# 122 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 158 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
struct __sFILE_fake {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;

  struct _reent *_data;
};




extern void __sinit (struct _reent *);
# 186 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;


  struct _reent *_data;



  void * _cookie;

  _ssize_t (*_read) (struct _reent *, void *,
        char *, int);
  _ssize_t (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;






  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 292 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 324 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;


  __extension__ unsigned long long _rand_next;

};
# 349 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
struct _mprec
{

  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;
};


struct _misc_reent
{

  char *_strtok_last;
  _mbstate_t _mblen_state;
  _mbstate_t _wctomb_state;
  _mbstate_t _mbtowc_state;
  char _l64a_buf[8];
  int _getdate_err;
  _mbstate_t _mbrlen_state;
  _mbstate_t _mbrtowc_state;
  _mbstate_t _mbsrtowcs_state;
  _mbstate_t _wcrtomb_state;
  _mbstate_t _wcsrtombs_state;
};



struct _reent
{


  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;

  char *_emergency;

  int __sdidinit;

  int _unspecified_locale_info;
  struct __locale_t *_locale;

  struct _mprec *_mp;

  void (*__cleanup) (struct _reent *);

  int _gamma_signgam;


  int _cvtlen;
  char *_cvtbuf;

  struct _rand48 *_r48;
  struct __tm *_localtime_buf;
  char *_asctime_buf;


  void (**(_sig_func))(int);



  struct _atexit *_atexit;
  struct _atexit _atexit0;


  struct _glue __sglue;
  __FILE *__sf;
  struct _misc_reent *_misc;
  char *_signal_buf;
};
# 463 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
extern const struct __sFILE_fake __sf_fake_stdin;
extern const struct __sFILE_fake __sf_fake_stdout;
extern const struct __sFILE_fake __sf_fake_stderr;
# 503 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/assert.h" 1 3
# 39 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/assert.h" 3
void __assert (const char *, int, const char *)
     __attribute__ ((__noreturn__));
void __assert_func (const char *, int, const char *, const char *)
     __attribute__ ((__noreturn__));
# 504 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 2 3
# 819 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3



# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/time.h" 1 3
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3
# 28 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 1 3
# 28 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef __intptr_t register_t;






# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h" 1 3
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h" 3
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 47 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 2 3


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/endian.h" 1 3





# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_endian.h" 1 3
# 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/endian.h" 2 3
# 50 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 1 3
# 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_sigset.h" 1 3
# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_sigset.h" 3
typedef unsigned long __sigset_t;
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timeval.h" 1 3
# 37 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timeval.h" 3
typedef __suseconds_t suseconds_t;




typedef __int_least64_t time_t;
# 54 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timeval.h" 3
struct timeval {
 time_t tv_sec;
 suseconds_t tv_usec;
};
# 16 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/timespec.h" 1 3
# 38 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/timespec.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timespec.h" 1 3
# 47 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timespec.h" 3
struct timespec {
 time_t tv_sec;
 long tv_nsec;
};
# 39 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/timespec.h" 2 3
# 58 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/timespec.h" 3
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 2 3



typedef __sigset_t sigset_t;
# 34 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 3
typedef unsigned long __fd_mask;

typedef __fd_mask fd_mask;
# 48 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 3
typedef struct fd_set {
 __fd_mask __fds_bits[(((64) + ((((int)sizeof(__fd_mask) * 8)) - 1)) / (((int)sizeof(__fd_mask) * 8)))];
} fd_set;
# 74 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/select.h" 3


int select (int __n, fd_set *__readfds, fd_set *__writefds, fd_set *__exceptfds, struct timeval *__timeout)
                                                   ;

int pselect (int __n, fd_set *__readfds, fd_set *__writefds, fd_set *__exceptfds, const struct timespec *__timeout, const sigset_t *__set)

                           ;



# 51 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 2 3




typedef __uint32_t in_addr_t;




typedef __uint16_t in_port_t;



typedef __uintptr_t u_register_t;






typedef unsigned char u_char;



typedef unsigned short u_short;



typedef unsigned int u_int;



typedef unsigned long u_long;







typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;
# 119 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 3
typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 157 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;
# 220 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 3
typedef __int64_t sbintime_t;


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 1 3
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/sched.h" 1 3
# 48 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/sched.h" 3
struct sched_param {
  int sched_priority;
# 61 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/sched.h" 3
};
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 2 3
# 32 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_t;
# 61 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 3
typedef struct {
  int is_initialized;
  void *stackaddr;
  int stacksize;
  int contentionscope;
  int inheritsched;
  int schedpolicy;
  struct sched_param schedparam;





  int detachstate;
} pthread_attr_t;
# 154 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_mutex_t;

typedef struct {
  int is_initialized;
# 168 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_pthreadtypes.h" 3
  int recursive;
} pthread_mutexattr_t;






typedef __uint32_t pthread_cond_t;



typedef struct {
  int is_initialized;
  clock_t clock;



} pthread_condattr_t;



typedef __uint32_t pthread_key_t;

typedef struct {
  int is_initialized;
  int init_executed;
} pthread_once_t;
# 224 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 2 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/types.h" 1 3
# 225 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h" 2 3
# 29 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3



# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_locale.h" 1 3
# 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_locale.h" 3
struct __locale_t;
typedef struct __locale_t *locale_t;
# 33 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 2 3




struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;






};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *restrict _s,
        size_t _maxsize, const char *restrict _fmt,
        const struct tm *restrict _t);


extern size_t strftime_l (char *restrict _s, size_t _maxsize,
     const char *restrict _fmt,
     const struct tm *restrict _t, locale_t _l);


char *asctime_r (const struct tm *restrict,
     char *restrict);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *restrict,
     struct tm *restrict);
struct tm *localtime_r (const time_t *restrict,
     struct tm *restrict);


# 101 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 3
void tzset (void);

void _tzset_r (struct _reent *);
# 134 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h" 3
extern long _timezone;
extern int _daylight;


extern char *_tzname[2];
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stat.h" 2 3
# 27 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stat.h" 3
struct stat
{
  dev_t st_dev;
  ino_t st_ino;
  mode_t st_mode;
  nlink_t st_nlink;
  uid_t st_uid;
  gid_t st_gid;
  dev_t st_rdev;
  off_t st_size;





  struct timespec st_atim;
  struct timespec st_mtim;
  struct timespec st_ctim;
  blksize_t st_blksize;
  blkcnt_t st_blocks;

  long st_spare4[2];


};
# 137 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stat.h" 3
int chmod (const char *__path, mode_t __mode );
int fchmod (int __fd, mode_t __mode);
int fstat (int __fd, struct stat *__sbuf );
int mkdir (const char *_path, mode_t __mode );
int mkfifo (const char *__path, mode_t __mode );
int stat (const char *restrict __path, struct stat *restrict __sbuf );
mode_t umask (mode_t __mask );







int fchmodat (int, const char *, mode_t, int);
int fstatat (int, const char *restrict , struct stat *restrict, int);
int mkdirat (int, const char *, mode_t);
int mkfifoat (int, const char *, mode_t);
int mknodat (int, const char *, mode_t, dev_t);
int utimensat (int, const char *, const struct timespec *, int);


int futimens (int, const struct timespec *);
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_stat.h" 2
# 16 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_errno.h" 1
# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_errno.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/errno.h" 1 3




typedef int error_t;



# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/errno.h" 1 3
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/errno.h" 3
extern int *__errno (void);




extern const char * const _sys_errlist[];
extern int _sys_nerr;
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/errno.h" 2 3
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_errno.h" 2
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_fcntl.h" 1
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_fcntl.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/fcntl.h" 1 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/fcntl.h" 1 3


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_default_fcntl.h" 1 3
# 186 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_default_fcntl.h" 3
struct flock {
 short l_type;
 short l_whence;
 long l_start;
 long l_len;
 short l_pid;
 short l_xxx;
};




struct eflock {
 short l_type;
 short l_whence;
 long l_start;
 long l_len;
 short l_pid;
 short l_xxx;
 long l_rpid;
 long l_rsys;
};





extern int open (const char *, int, ...);

extern int openat (int, const char *, int, ...);

extern int creat (const char *, mode_t);
extern int fcntl (int, int, ...);

extern int flock (int, int);
# 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/fcntl.h" 2 3
# 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/fcntl.h" 2 3
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_fcntl.h" 2
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_ioctl.h" 1
# 123 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_ioctl.h"

# 123 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_ioctl.h"
struct winsize {
 unsigned short ws_row;
 unsigned short ws_col;
 unsigned short ws_xpixel;
 unsigned short ws_ypixel;
};
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_dirent.h" 1
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_signal.h" 1
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_signal.h"
# 1 "./cconfig.h" 1
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_signal.h" 2
# 67 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_signal.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 1 3
# 42 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3

# 42 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
union sigval {
  int sival_int;
  void *sival_ptr;
};

struct sigevent {
  int sigev_notify;
  int sigev_signo;
  union sigval sigev_value;






};
# 68 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
typedef struct {
  int si_signo;
  int si_code;
  union sigval si_value;
} siginfo_t;
# 119 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
typedef void (*_sig_func_ptr)(int);

struct sigaction
{
 _sig_func_ptr sa_handler;
 sigset_t sa_mask;
 int sa_flags;
};
# 153 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
typedef struct sigaltstack {
  void *ss_sp;
  int ss_flags;
  size_t ss_size;
} stack_t;






int sigprocmask (int, const sigset_t *, sigset_t *);



int pthread_sigmask (int, const sigset_t *, sigset_t *);







int kill (pid_t, int);



int killpg (pid_t, int);


int sigaction (int, const struct sigaction *, struct sigaction *);
int sigaddset (sigset_t *, const int);
int sigdelset (sigset_t *, const int);
int sigismember (const sigset_t *, int);
int sigfillset (sigset_t *);
int sigemptyset (sigset_t *);
int sigpending (sigset_t *);
int sigsuspend (const sigset_t *);
int sigwait (const sigset_t *, int *);
# 218 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
int sigpause (int);



int sigaltstack (const stack_t *restrict, stack_t *restrict);



int pthread_kill (pthread_t, int);







int sigwaitinfo (const sigset_t *, siginfo_t *);
int sigtimedwait (const sigset_t *, siginfo_t *, const struct timespec *);

int sigqueue (pid_t, int, const union sigval);
# 369 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/signal.h" 1 3





# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 1 3
# 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/signal.h" 2 3



typedef int sig_atomic_t;

typedef _sig_func_ptr sig_t;
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/signal.h" 3
struct _reent;

_sig_func_ptr _signal_r (struct _reent *, int, _sig_func_ptr);
int _raise_r (struct _reent *, int);


_sig_func_ptr signal (int, _sig_func_ptr);
int raise (int);
void psignal (int, const char *);



# 370 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/signal.h" 2 3
# 68 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_signal.h" 2
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/libc/libc_fdset.h" 1
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtlibc.h" 2
# 1055 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h" 2
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h" 1
# 47 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"

# 47 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
static __inline void rt_list_init(rt_list_t *l)
{
    l->next = l->prev = l;
}







static __inline void rt_list_insert_after(rt_list_t *l, rt_list_t *n)
{
    l->next->prev = n;
    n->next = l->next;

    l->next = n;
    n->prev = l;
}







static __inline void rt_list_insert_before(rt_list_t *l, rt_list_t *n)
{
    l->prev->next = n;
    n->prev = l->prev;

    l->prev = n;
    n->next = l;
}





static __inline void rt_list_remove(rt_list_t *n)
{
    n->next->prev = n->prev;
    n->prev->next = n->next;

    n->next = n->prev = n;
}





static __inline int rt_list_isempty(const rt_list_t *l)
{
    return l->next == l;
}





static __inline unsigned int rt_list_len(const rt_list_t *l)
{
    unsigned int len = 0;
    const rt_list_t *p = l;
    while (p->next != l)
    {
        p = p->next;
        len ++;
    }

    return len;
}
# 189 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
static __inline void rt_slist_init(rt_slist_t *l)
{
    l->next = (0);
}

static __inline void rt_slist_append(rt_slist_t *l, rt_slist_t *n)
{
    struct rt_slist_node *node;

    node = l;
    while (node->next) node = node->next;


    node->next = n;
    n->next = (0);
}

static __inline void rt_slist_insert(rt_slist_t *l, rt_slist_t *n)
{
    n->next = l->next;
    l->next = n;
}

static __inline unsigned int rt_slist_len(const rt_slist_t *l)
{
    unsigned int len = 0;
    const rt_slist_t *list = l->next;
    while (list != (0))
    {
        list = list->next;
        len ++;
    }

    return len;
}

static __inline rt_slist_t *rt_slist_remove(rt_slist_t *l, rt_slist_t *n)
{

    struct rt_slist_node *node = l;
    while (node->next && node->next != n) node = node->next;


    if (node->next != (rt_slist_t *)0) node->next = node->next->next;

    return l;
}

static __inline rt_slist_t *rt_slist_first(rt_slist_t *l)
{
    return l->next;
}

static __inline rt_slist_t *rt_slist_tail(rt_slist_t *l)
{
    while (l->next) l = l->next;

    return l;
}

static __inline rt_slist_t *rt_slist_next(rt_slist_t *n)
{
    return n->next;
}

static __inline int rt_slist_isempty(rt_slist_t *l)
{
    return l->next == (0);
}
# 25 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtm.h" 1
# 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtm.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 1
# 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtm.h" 2
# 26 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h" 2
# 40 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_system_object_init(void);
struct rt_object_information *
rt_object_get_information(enum rt_object_class_type type);
void rt_object_init(struct rt_object *object,
                    enum rt_object_class_type type,
                    const char *name);
void rt_object_detach(rt_object_t object);
rt_object_t rt_object_allocate(enum rt_object_class_type type,
                               const char *name);
void rt_object_delete(rt_object_t object);
rt_bool_t rt_object_is_systemobject(rt_object_t object);
rt_uint8_t rt_object_get_type(rt_object_t object);
rt_object_t rt_object_find(const char *name, rt_uint8_t type);


void rt_object_attach_sethook(void (*hook)(struct rt_object *object));
void rt_object_detach_sethook(void (*hook)(struct rt_object *object));
void rt_object_trytake_sethook(void (*hook)(struct rt_object *object));
void rt_object_take_sethook(void (*hook)(struct rt_object *object));
void rt_object_put_sethook(void (*hook)(struct rt_object *object));
# 73 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_system_tick_init(void);
rt_tick_t rt_tick_get(void);
void rt_tick_set(rt_tick_t tick);
void rt_tick_increase(void);
int rt_tick_from_millisecond(rt_int32_t ms);

void rt_system_timer_init(void);
void rt_system_timer_thread_init(void);

void rt_timer_init(rt_timer_t timer,
                   const char *name,
                   void (*timeout)(void *parameter),
                   void *parameter,
                   rt_tick_t time,
                   rt_uint8_t flag);
rt_err_t rt_timer_detach(rt_timer_t timer);
rt_timer_t rt_timer_create(const char *name,
                           void (*timeout)(void *parameter),
                           void *parameter,
                           rt_tick_t time,
                           rt_uint8_t flag);
rt_err_t rt_timer_delete(rt_timer_t timer);
rt_err_t rt_timer_start(rt_timer_t timer);
rt_err_t rt_timer_stop(rt_timer_t timer);
rt_err_t rt_timer_control(rt_timer_t timer, int cmd, void *arg);

rt_tick_t rt_timer_next_timeout_tick(void);
void rt_timer_check(void);


void rt_timer_enter_sethook(void (*hook)(struct rt_timer *timer));
void rt_timer_exit_sethook(void (*hook)(struct rt_timer *timer));
# 118 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
rt_err_t rt_thread_init(struct rt_thread *thread,
                        const char *name,
                        void (*entry)(void *parameter),
                        void *parameter,
                        void *stack_start,
                        rt_uint32_t stack_size,
                        rt_uint8_t priority,
                        rt_uint32_t tick);
rt_err_t rt_thread_detach(rt_thread_t thread);
rt_thread_t rt_thread_create(const char *name,
                             void (*entry)(void *parameter),
                             void *parameter,
                             rt_uint32_t stack_size,
                             rt_uint8_t priority,
                             rt_uint32_t tick);
rt_thread_t rt_thread_self(void);
rt_thread_t rt_thread_find(char *name);
void rt_thread_get_stack_info(rt_thread_t thread, uint32_t *pxStack, uint32_t *pxSize);
rt_err_t rt_thread_startup(rt_thread_t thread);
rt_err_t rt_thread_delete(rt_thread_t thread);

rt_err_t rt_thread_yield(void);
rt_err_t rt_thread_delay(rt_tick_t tick);
rt_err_t rt_thread_mdelay(rt_int32_t ms);
rt_err_t rt_thread_control(rt_thread_t thread, int cmd, void *arg);
rt_err_t rt_thread_suspend(rt_thread_t thread);
rt_err_t rt_thread_resume(rt_thread_t thread);
void rt_thread_timeout(void *parameter);
# 154 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_thread_suspend_sethook(void (*hook)(rt_thread_t thread));
void rt_thread_resume_sethook (void (*hook)(rt_thread_t thread));
void rt_thread_inited_sethook (void (*hook)(rt_thread_t thread));





void rt_thread_idle_init(void);

rt_err_t rt_thread_idle_sethook(void (*hook)(void));
rt_err_t rt_thread_idle_delhook(void (*hook)(void));

void rt_thread_idle_excute(void);
rt_thread_t rt_thread_idle_gethandler(void);




void rt_system_scheduler_init(void);
void rt_system_scheduler_start(void);

void rt_schedule(void);
void rt_schedule_insert_thread(struct rt_thread *thread);
void rt_schedule_remove_thread(struct rt_thread *thread);

void rt_enter_critical(void);
void rt_exit_critical(void);
rt_uint16_t rt_critical_level(void);


void rt_scheduler_sethook(void (*hook)(rt_thread_t from, rt_thread_t to));
# 217 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
rt_err_t rt_mp_init(struct rt_mempool *mp,
                    const char *name,
                    void *start,
                    rt_size_t size,
                    rt_size_t block_size);
rt_err_t rt_mp_detach(struct rt_mempool *mp);
rt_mp_t rt_mp_create(const char *name,
                     rt_size_t block_count,
                     rt_size_t block_size);
rt_err_t rt_mp_delete(rt_mp_t mp);

void *rt_mp_alloc(rt_mp_t mp, rt_int32_t time);
void rt_mp_free(void *block);


void rt_mp_alloc_sethook(void (*hook)(struct rt_mempool *mp, void *block));
void rt_mp_free_sethook(void (*hook)(struct rt_mempool *mp, void *block));
# 242 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_system_heap_init(void *begin_addr, void *end_addr);

void *rt_malloc(rt_size_t nbytes);
void rt_free(void *ptr);
void *rt_realloc(void *ptr, rt_size_t nbytes);
void *rt_calloc(rt_size_t count, rt_size_t size);
void *rt_malloc_align(rt_size_t size, rt_size_t align);
void rt_free_align(void *ptr);

void rt_memory_info(rt_uint32_t *total,
                    rt_uint32_t *used,
                    rt_uint32_t *max_used);







void rt_malloc_sethook(void (*hook)(void *ptr, rt_uint32_t size));
void rt_free_sethook(void (*hook)(void *ptr));
# 293 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
rt_err_t rt_sem_init(rt_sem_t sem,
                     const char *name,
                     rt_uint32_t value,
                     rt_uint8_t flag);
rt_err_t rt_sem_detach(rt_sem_t sem);
rt_sem_t rt_sem_create(const char *name, rt_uint32_t value, rt_uint8_t flag);
rt_err_t rt_sem_delete(rt_sem_t sem);

rt_err_t rt_sem_take(rt_sem_t sem, rt_int32_t time);
rt_err_t rt_sem_trytake(rt_sem_t sem);
rt_err_t rt_sem_release(rt_sem_t sem);
rt_err_t rt_sem_control(rt_sem_t sem, int cmd, void *arg);






rt_err_t rt_mutex_init(rt_mutex_t mutex, const char *name, rt_uint8_t flag);
rt_err_t rt_mutex_detach(rt_mutex_t mutex);
rt_mutex_t rt_mutex_create(const char *name, rt_uint8_t flag);
rt_err_t rt_mutex_delete(rt_mutex_t mutex);

rt_err_t rt_mutex_take(rt_mutex_t mutex, rt_int32_t time);
rt_err_t rt_mutex_release(rt_mutex_t mutex);
rt_err_t rt_mutex_control(rt_mutex_t mutex, int cmd, void *arg);






rt_err_t rt_event_init(rt_event_t event, const char *name, rt_uint8_t flag);
rt_err_t rt_event_detach(rt_event_t event);
rt_event_t rt_event_create(const char *name, rt_uint8_t flag);
rt_err_t rt_event_delete(rt_event_t event);

rt_err_t rt_event_send(rt_event_t event, rt_uint32_t set);
rt_err_t rt_event_recv(rt_event_t event,
                       rt_uint32_t set,
                       rt_uint8_t opt,
                       rt_int32_t timeout,
                       rt_uint32_t *recved);
rt_err_t rt_event_control(rt_event_t event, int cmd, void *arg);






rt_err_t rt_mb_init(rt_mailbox_t mb,
                    const char *name,
                    void *msgpool,
                    rt_size_t size,
                    rt_uint8_t flag);
rt_err_t rt_mb_detach(rt_mailbox_t mb);
rt_mailbox_t rt_mb_create(const char *name, rt_size_t size, rt_uint8_t flag);
rt_err_t rt_mb_delete(rt_mailbox_t mb);

rt_err_t rt_mb_send(rt_mailbox_t mb, rt_uint32_t value);
rt_err_t rt_mb_send_wait(rt_mailbox_t mb,
                         rt_uint32_t value,
                         rt_int32_t timeout);
rt_err_t rt_mb_recv(rt_mailbox_t mb, rt_uint32_t *value, rt_int32_t timeout);
rt_err_t rt_mb_control(rt_mailbox_t mb, int cmd, void *arg);






rt_err_t rt_mq_init(rt_mq_t mq,
                    const char *name,
                    void *msgpool,
                    rt_size_t msg_size,
                    rt_size_t pool_size,
                    rt_uint8_t flag);
rt_err_t rt_mq_detach(rt_mq_t mq);
rt_mq_t rt_mq_create(const char *name,
                     rt_size_t msg_size,
                     rt_size_t max_msgs,
                     rt_uint8_t flag);
rt_err_t rt_mq_delete(rt_mq_t mq);

rt_err_t rt_mq_send(rt_mq_t mq, void *buffer, rt_size_t size);
rt_err_t rt_mq_urgent(rt_mq_t mq, void *buffer, rt_size_t size);
rt_err_t rt_mq_recv(rt_mq_t mq,
                    void *buffer,
                    rt_size_t size,
                    rt_int32_t timeout);
rt_err_t rt_mq_control(rt_mq_t mq, int cmd, void *arg);
# 398 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
rt_device_t rt_device_find(const char *name);

rt_err_t rt_device_register(rt_device_t dev,
                            const char *name,
                            rt_uint16_t flags);
rt_err_t rt_device_unregister(rt_device_t dev);

rt_device_t rt_device_create(int type, int attach_size);
void rt_device_destroy(rt_device_t device);

rt_err_t rt_device_init_all(void);

rt_err_t
rt_device_set_rx_indicate(rt_device_t dev,
                          rt_err_t (*rx_ind)(rt_device_t dev, rt_size_t size));
rt_err_t
rt_device_set_tx_complete(rt_device_t dev,
                          rt_err_t (*tx_done)(rt_device_t dev, void *buffer));

rt_err_t rt_device_init (rt_device_t dev);
rt_err_t rt_device_open (rt_device_t dev, rt_uint16_t oflag);
rt_err_t rt_device_close(rt_device_t dev);
rt_size_t rt_device_read (rt_device_t dev,
                          rt_off_t pos,
                          void *buffer,
                          rt_size_t size);
rt_size_t rt_device_write(rt_device_t dev,
                          rt_off_t pos,
                          const void *buffer,
                          rt_size_t size);
rt_err_t rt_device_control(rt_device_t dev, int cmd, void *arg);
# 440 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_interrupt_enter(void);
void rt_interrupt_leave(void);




rt_uint8_t rt_interrupt_get_nest(void);


void rt_interrupt_enter_sethook(void (*hook)(void));
void rt_interrupt_leave_sethook(void (*hook)(void));



void rt_components_init(void);
void rt_components_board_init(void);
# 471 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
void rt_kprintf(const char *fmt, ...);
void rt_kputs(const char *str);

rt_int32_t rt_vsprintf(char *dest, const char *format, va_list arg_ptr);
rt_int32_t rt_vsnprintf(char *buf, rt_size_t size, const char *fmt, va_list args);
rt_int32_t rt_sprintf(char *buf, const char *format, ...);
rt_int32_t rt_snprintf(char *buf, rt_size_t size, const char *format, ...);


rt_device_t rt_console_set_device(const char *name);
rt_device_t rt_console_get_device(void);


typedef void (* console_hook)(const char *str, int flush);
void rt_console_set_output_hook(console_hook hook);

rt_err_t rt_get_errno(void);
void rt_set_errno(rt_err_t no);
int *_rt_errno(void);






int __rt_ffs(int value);

void *rt_memset(void *src, int c, rt_ubase_t n);
void *rt_memcpy(void *dest, const void *src, rt_ubase_t n);

rt_int32_t rt_strncmp(const char *cs, const char *ct, rt_ubase_t count);
rt_int32_t rt_strcmp(const char *cs, const char *ct);
rt_size_t rt_strlen(const char *src);
rt_size_t rt_strnlen(const char *s, rt_ubase_t maxlen);
char *rt_strdup(const char *s);





char *rt_strstr(const char *str1, const char *str2);
rt_int32_t rt_sscanf(const char *buf, const char *fmt, ...);
char *rt_strncpy(char *dest, const char *src, rt_ubase_t n);
void *rt_memmove(void *dest, const void *src, rt_ubase_t n);
rt_int32_t rt_memcmp(const void *cs, const void *ct, rt_ubase_t count);
rt_uint32_t rt_strcasecmp(const char *a, const char *b);

void rt_show_version(void);
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h" 2
# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
enum RT_HW_CACHE_OPS
{
    RT_HW_CACHE_FLUSH = 0x01,
    RT_HW_CACHE_INVALIDATE = 0x02,
};




void rt_hw_cpu_icache_enable(void);
void rt_hw_cpu_icache_disable(void);
rt_base_t rt_hw_cpu_icache_status(void);
void rt_hw_cpu_icache_ops(int ops, void* addr, int size);

void rt_hw_cpu_dcache_enable(void);
void rt_hw_cpu_dcache_disable(void);
rt_base_t rt_hw_cpu_dcache_status(void);
void rt_hw_cpu_dcache_ops(int ops, void* addr, int size);

void rt_hw_cpu_reset(void);
void rt_hw_cpu_shutdown(void);

rt_uint8_t *rt_hw_stack_init(void *entry,
                             void *parameter,
                             rt_uint8_t *stack_addr,
                             void *exit);




typedef void (*rt_isr_handler_t)(int vector, void *param);

struct rt_irq_desc
{
    rt_isr_handler_t handler;
    void *param;





};




void rt_hw_interrupt_init(void);
void rt_hw_interrupt_mask(int vector);
void rt_hw_interrupt_umask(int vector);
rt_isr_handler_t rt_hw_interrupt_install(int vector,
                                         rt_isr_handler_t handler,
                                         void *param,
                                         const char *name);

rt_base_t rt_hw_interrupt_disable(void);
void rt_hw_interrupt_enable(rt_base_t level);




void rt_hw_context_switch(rt_uint32_t from, rt_uint32_t to);
void rt_hw_context_switch_to(rt_uint32_t to);
void rt_hw_context_switch_interrupt(rt_uint32_t from, rt_uint32_t to);

void rt_hw_console_output(const char *str);

void rt_hw_backtrace(rt_uint32_t *fp, rt_uint32_t thread_entry);
void rt_hw_show_memory(rt_uint32_t addr, rt_uint32_t size);




void rt_hw_exception_install(rt_err_t (*exception_handle)(void *context));




void rt_hw_us_delay(rt_uint32_t us);
# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/pm.h" 1
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/pm.h"
enum
{

    PM_RUN_MODE_NORMAL = 0,


    PM_SLEEP_MODE_SLEEP,
    PM_SLEEP_MODE_TIMER,
    PM_SLEEP_MODE_SHUTDOWN,
};
# 110 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/pm.h"
typedef enum
{
    PM_IDLE = 0,
    PM_SUSPEND,
    PM_BUSY,
} PM_State;

struct rt_pm;




struct rt_pm_ops
{
    void (*enter)(struct rt_pm *pm);
    void (*exit)(struct rt_pm *pm);





    void (*timer_start)(struct rt_pm *pm, rt_uint32_t timeout);
    void (*timer_stop)(struct rt_pm *pm);
    rt_tick_t (*timer_get_tick)(struct rt_pm *pm);
};

struct rt_device_pm_ops
{




    int (*suspend)(const struct rt_device *device);
    void (*resume)(const struct rt_device *device);





};

struct rt_device_pm
{
    const struct rt_device *device;
    const struct rt_device_pm_ops *ops;
};




struct rt_pm
{
    struct rt_device parent;


    rt_uint8_t modes[(1 + 3)];
    rt_uint8_t current_mode;
    rt_uint8_t exit_count;


    rt_uint8_t device_pm_number;
    struct rt_device_pm *device_pm;
    struct rt_semaphore device_lock;


    rt_uint32_t timer_mask;

    const struct rt_pm_ops *ops;
};

void rt_pm_enter(void);
void rt_pm_exit(void);

void rt_pm_request(rt_ubase_t mode);
void rt_pm_release(rt_ubase_t mode);

void rt_pm_register_device(struct rt_device *device, const struct rt_device_pm_ops *ops);
void rt_pm_unregister_device(struct rt_device *device);






void rt_system_pm_init(const struct rt_pm_ops *ops,
                       rt_uint8_t timer_mask,
                       void *user_data);
# 43 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h" 1
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
# 1 "./hal_conf.h" 1
# 9 "./hal_conf.h"
# 1 "./rtconfig.h" 1
# 10 "./hal_conf.h" 2
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 1
# 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h" 1
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 1
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 1 3
# 36 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 37 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 2 3
# 63 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3




# 66 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/stdio.h" 1 3
# 80 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 2 3
# 181 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
char * ctermid (char *);




FILE * tmpfile (void);
char * tmpnam (char *);

char * tempnam (const char *, const char *) __attribute__((__malloc__)) __attribute__((__warn_unused_result__));

int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 257 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
int fseeko (FILE *, off_t, int);
off_t ftello (FILE *);







int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 284 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
int asiprintf (char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
char * asniprintf (char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * asnprintf (char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));

int diprintf (int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

int fiprintf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fiscanf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int iprintf (const char *, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int iscanf (const char *, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int siprintf (char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int siscanf (const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int sniprintf (char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vasiprintf (char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vdiprintf (int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiprintf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiscanf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int viprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int viscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsiprintf (char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vsiscanf (const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vsniprintf (char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
# 339 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
FILE * fdopen (int, const char *);

int fileno (FILE *);


int pclose (FILE *);
FILE * popen (const char *, const char *);



void setbuffer (FILE *, char *, int);
int setlinebuf (FILE *);



int getw (FILE *);
int putw (int, FILE *);


int getc_unlocked (FILE *);
int getchar_unlocked (void);
void flockfile (FILE *);
int ftrylockfile (FILE *);
void funlockfile (FILE *);
int putc_unlocked (int, FILE *);
int putchar_unlocked (int);
# 374 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
int dprintf (int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

FILE * fmemopen (void *restrict, size_t, const char *restrict);


FILE * open_memstream (char **, size_t *);
int vdprintf (int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));



int renameat (int, const char *, int, const char *);
# 396 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);


void clearerr_unlocked (FILE *);
int feof_unlocked (FILE *);
int ferror_unlocked (FILE *);
int fileno_unlocked (FILE *);
int fflush_unlocked (FILE *);
int fgetc_unlocked (FILE *);
int fputc_unlocked (int, FILE *);
size_t fread_unlocked (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite_unlocked (const void *restrict , size_t _size, size_t _n, FILE *);
# 577 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 601 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
FILE *funopen (const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
FILE *_funopen_r (struct _reent *, const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
# 687 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = _impure_ptr;
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = _impure_ptr;
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h" 3

# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 1 3
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/ieeefp.h" 1 3
# 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 2 3





# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 2 3



# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/stdlib.h" 1 3
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 2 3

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/alloca.h" 1 3
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 2 3
# 33 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);

__uint32_t arc4random (void);
__uint32_t arc4random_uniform (__uint32_t);
void arc4random_buf (void *, size_t);

int atexit (void (*__func)(void));
double atof (const char *__nptr);

float atoff (const char *__nptr);

int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);



char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);

extern char *suboptarg;
int getsubopt (char **, char * const *, char **);

long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);


char * mkdtemp (char *);






int mkstemp (char *);


int mkstemps (char *, int);


char * mktemp (char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));


char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;

void *reallocarray(void *, size_t, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2, 3)));
void *reallocf(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2)));


char * realpath (const char *restrict path, char *restrict resolved_path);


int rpmatch (const char *response);




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 191 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3
int system (const char *__string);


long a64l (const char *__input);
char * l64a (long __input);
char * _l64a_r (struct _reent *,long __input);


int on_exit (void (*__func)(int, void *),void *__arg);


void _Exit (int __status) __attribute__ ((__noreturn__));


int putenv (char *__string);

int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);

int setenv (const char *__string, const char *__value, int __overwrite);

int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 224 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);

char * itoa (int, char *, int);
char * utoa (unsigned, char *, int);


int rand_r (unsigned *__seed);



double drand48 (void);
double _drand48_r (struct _reent *);
double erand48 (unsigned short [3]);
double _erand48_r (struct _reent *, unsigned short [3]);
long jrand48 (unsigned short [3]);
long _jrand48_r (struct _reent *, unsigned short [3]);
void lcong48 (unsigned short [7]);
void _lcong48_r (struct _reent *, unsigned short [7]);
long lrand48 (void);
long _lrand48_r (struct _reent *);
long mrand48 (void);
long _mrand48_r (struct _reent *);
long nrand48 (unsigned short [3]);
long _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       seed48 (unsigned short [3]);
unsigned short *
       _seed48_r (struct _reent *, unsigned short [3]);
void srand48 (long);
void _srand48_r (struct _reent *, long);


char * initstate (unsigned, char *, size_t);
long random (void);
char * setstate (char *);
void srandom (unsigned);


long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);



void cfree (void *);


int unsetenv (const char *__string);

int _unsetenv_r (struct _reent *, const char *__string);



int posix_memalign (void **, size_t, size_t) __attribute__((__nonnull__ (1)))
     __attribute__((__warn_unused_result__));


char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 312 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3
void qsort_r (void *__base, size_t __nmemb, size_t __size, void *__thunk, int (*_compar)(void *, const void *, const void *))
             __asm__ ("" "__bsd_qsort_r");
# 322 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 339 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdlib.h" 3

# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 1 3
# 17 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 2 3






# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/strings.h" 1 3
# 44 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/strings.h" 3


int bcmp(const void *, const void *, size_t) __attribute__((__pure__));
void bcopy(const void *, void *, size_t);
void bzero(void *, size_t);


void explicit_bzero(void *, size_t);


int ffs(int) __attribute__((__const__));


int ffsl(long) __attribute__((__const__));
int ffsll(long long) __attribute__((__const__));
int fls(int) __attribute__((__const__));
int flsl(long) __attribute__((__const__));
int flsll(long long) __attribute__((__const__));


char *index(const char *, int) __attribute__((__pure__));
char *rindex(const char *, int) __attribute__((__pure__));

int strcasecmp(const char *, const char *) __attribute__((__pure__));
int strncasecmp(const char *, const char *, size_t) __attribute__((__pure__));


int strcasecmp_l (const char *, const char *, locale_t);
int strncasecmp_l (const char *, const char *, size_t, locale_t);


# 25 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 2 3




void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);


int strcoll_l (const char *, const char *, locale_t);
char *strerror_l (int, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);


char *strtok_r (char *restrict, const char *restrict, char **restrict);


int timingsafe_bcmp (const void *, const void *, size_t);
int timingsafe_memcmp (const void *, const void *, size_t);


void * memccpy (void *restrict, const void *restrict, int, size_t);
# 76 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 3
char *stpcpy (char *restrict, const char *restrict);
char *stpncpy (char *restrict, const char *restrict, size_t);






char *strdup (const char *) __attribute__((__malloc__)) __attribute__((__warn_unused_result__));

char *_strdup_r (struct _reent *, const char *);

char *strndup (const char *, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__));

char *_strndup_r (struct _reent *, const char *, size_t);
# 100 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 3
int strerror_r (int, char *, size_t)

             __asm__ ("" "__xpg_strerror_r")

  ;







char * _strerror_r (struct _reent *, int, int, int *);


size_t strlcat (char *, const char *, size_t);
size_t strlcpy (char *, const char *, size_t);


size_t strnlen (const char *, size_t);


char *strsep (char **, const char *);


char *strnstr(const char *, const char *, size_t) __attribute__((__pure__));



char *strlwr (char *);
char *strupr (char *);



char *strsignal (int __signo);
# 175 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/string.h" 1 3
# 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/string.h" 3
static __inline unsigned long __libc_detect_null(unsigned long w)
{
  unsigned long mask = 0x7f7f7f7f;
  if (sizeof (long) == 8)
    mask = ((mask << 16) << 16) | mask;
  return ~(((w & mask) + mask) | w | mask);
}
# 176 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/string.h" 2 3


# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 1 3
# 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_intsup.h" 1 3
# 35 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_intsup.h" 3
       
       
       
       
       
       
       
       
# 190 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_intsup.h" 3
       
       
       
       
       
       
       
       
# 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 2 3







typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 3
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 3
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 3
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdint.h" 3
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stdbool.h" 1 3 4
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h" 1
# 26 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"

# 26 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
typedef enum {
    DMA_REQ_UART0_RX = 0,
    DMA_REQ_UART0_TX = 1,
    DMA_REQ_UART1_RX = 2,
    DMA_REQ_UART1_TX = 3,
    DMA_REQ_UART2_RX = 4,
    DMA_REQ_UART2_TX = 5,
    DMA_REQ_SAI_RX = 10,
    DMA_REQ_SAI_TX = 11,
    DMA_REQ_I2C4_RX = 12,
    DMA_REQ_I2C4_TX = 13,
    DMA_REQ_SPI0_RX = 14,
    DMA_REQ_SPI0_TX = 15,
} DMA_REQ_Type;





typedef enum
{

  SARADC_IRQn = 17,
  TIMER0_IRQn = 32,
  TIMER1_IRQn = 33,
  TIMER2_IRQn = 34,
  TIMER3_IRQn = 35,
  TIMER4_IRQn = 36,
  TIMER5_IRQn = 37,
  SPI0_IRQn = 41,
  FSPI0_IRQn = 52,
  VICAP_IRQn = 57,
  MIPI_ISP_IRQn = 58,
  MI_ISP_IRQn = 59,
  ISP_IRQn = 60,
  I2C0_IRQn = 63,
  I2C1_IRQn = 64,
  I2C2_IRQn = 65,
  I2C3_IRQn = 66,
  I2C4_IRQn = 67,
  UART0_IRQn = 69,
  UART1_IRQn = 70,
  UART2_IRQn = 71,
  GPIO0_IRQn = 75,
  GPIO3_IRQn = 76,
  GPIO6_IRQn = 77,
  GPIO9_IRQn = 78,
  GPIO1_IRQn = 79,
  GPIO4_IRQn = 80,
  GPIO7_IRQn = 81,
  GPIO10_IRQn = 82,
  GPIO2_IRQn = 83,
  GPIO5_IRQn = 84,
  GPIO8_IRQn = 85,
  GPIO11_IRQn = 86,
  PWM0_CH0_IRQn = 87,
  PWM0_CH1_IRQn = 88,
  PWM0_CH2_IRQn = 89,
  PWM0_CH3_IRQn = 90,
  PWM1_CH0_IRQn = 91,
  PWM1_CH1_IRQn = 92,
  PWM1_CH2_IRQn = 93,
  PWM1_CH3_IRQn = 94,
  PWM2_CH0_IRQn = 95,
  PWM2_CH1_IRQn = 96,
  PWM2_CH2_IRQn = 97,
  PWM2_CH3_IRQn = 98,
  HPMCU_MBOX0_AP_IRQn = 106,
  HPMCU_MBOX1_AP_IRQn = 107,
  HPMCU_MBOX2_AP_IRQn = 108,
  HPMCU_MBOX3_AP_IRQn = 109,
  HPMCU_MBOX0_BB_IRQn = 110,
  HPMCU_MBOX1_BB_IRQn = 111,
  HPMCU_MBOX2_BB_IRQn = 112,
  HPMCU_MBOX3_BB_IRQn = 113,
  LPMCU_MBOX0_AP_IRQn = 114,
  LPMCU_MBOX1_AP_IRQn = 115,
  LPMCU_MBOX2_AP_IRQn = 116,
  LPMCU_MBOX3_AP_IRQn = 117,
  LPMCU_MBOX0_BB_IRQn = 118,
  LPMCU_MBOX1_BB_IRQn = 119,
  LPMCU_MBOX2_BB_IRQn = 120,
  LPMCU_MBOX3_BB_IRQn = 121,
  FSPI1_IRQn = 124,
  NUM_INTERRUPTS = 128,
} IRQn_Type;
# 121 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_compiler.h" 1
# 34 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_compiler.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h" 1
# 29 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 71 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma GCC diagnostic pop



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma GCC diagnostic pop
# 129 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint8_t __CLZ(uint32_t value)
{
# 140 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h"
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 154 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __enable_irq(void)
{
    __asm volatile("csrrsi a0, mstatus, 8");
}






__attribute__((always_inline)) static inline void __disable_irq(void)
{
    __asm volatile("csrrci a0, mstatus, 8");
}

#pragma GCC diagnostic pop
# 35 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/RISCV/Include/cmsis_compiler.h" 2
# 122 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/system_rv1103b.h" 1
# 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/system_rv1103b.h"
extern uint32_t SystemCoreClock;






extern void SystemInit (void);






extern void SystemCoreClockUpdate (void);
# 123 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h" 1
# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
struct PERICRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t PERICLKSEL_CON[5];
         uint32_t RESERVED0314[315];
    volatile uint32_t PERIGATE_CON[12];
         uint32_t RESERVED0830[116];
    volatile uint32_t PERISOFTRST_CON[12];
         uint32_t RESERVED0A30[118];
    volatile uint32_t PERICRU_IP_CON;
};

struct VEPUCRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t VEPUCLKSEL_CON[3];
    volatile uint32_t VEPUCLKSEL_CON02;
         uint32_t RESERVED030C[317];
    volatile uint32_t VEPUGATE_CON[1];
         uint32_t RESERVED0804[127];
    volatile uint32_t VEPUSOFTRST_CON[1];
};

struct NPUCRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t NPUCLKSEL_CON[3];
         uint32_t RESERVED030C[317];
    volatile uint32_t NPUGATE_CON[1];
         uint32_t RESERVED0804[127];
    volatile uint32_t NPUSOFTRST_CON[1];
};

struct VICRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t VICLKSEL_CON[1];
         uint32_t RESERVED0304[319];
    volatile uint32_t VIGATE_CON[3];
         uint32_t RESERVED080C[125];
    volatile uint32_t VISOFTRST_CON[3];
         uint32_t RESERVED0A0C[127];
    volatile uint32_t VICRU_IP_CON;
};

struct CORECRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t CORECLKSEL_CON[3];
         uint32_t RESERVED030C[317];
    volatile uint32_t COREGATE_CON[2];
         uint32_t RESERVED0808[126];
    volatile uint32_t CORESOFTRST_CON[2];
         uint32_t RESERVED0A08[190];
    volatile uint32_t AUTOCS_CORE_SRC_CON[2];
};

struct DDRCRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t DDRCLKSEL_CON[1];
         uint32_t RESERVED0304[319];
    volatile uint32_t DDRGATE_CON[1];
         uint32_t RESERVED0804[127];
    volatile uint32_t DDRSOFTRST_CON[1];
         uint32_t RESERVED0A04[191];
    volatile uint32_t AUTOCS_LSCLK_DDR_ROOT_CON[2];
};

struct SUBDDRCRU_REG {
         uint32_t RESERVED0000[512];
    volatile uint32_t SUBDDRGATE_CON[1];
         uint32_t RESERVED0804[127];
    volatile uint32_t SUBDDRSOFTRST_CON[1];
};

struct TOPCRU_REG {
         uint32_t RESERVED0000[16];
    volatile uint32_t DPLL_CON[5];
         uint32_t RESERVED0054[3];
    volatile uint32_t GPLL_CON[5];
         uint32_t RESERVED0074[51];
    volatile uint32_t CRU_SSCGTBL_CON00;
    volatile uint32_t CRU_SSCGTBL_CON01;
    volatile uint32_t CRU_SSCGTBL_CON02;
    volatile uint32_t CRU_SSCGTBL_CON03;
    volatile uint32_t CRU_SSCGTBL_CON04;
    volatile uint32_t CRU_SSCGTBL_CON05;
    volatile uint32_t CRU_SSCGTBL_CON06;
    volatile uint32_t CRU_SSCGTBL_CON07;
    volatile uint32_t CRU_SSCGTBL_CON08;
    volatile uint32_t CRU_SSCGTBL_CON09;
    volatile uint32_t CRU_SSCGTBL_CON10;
    volatile uint32_t CRU_SSCGTBL_CON11;
    volatile uint32_t CRU_SSCGTBL_CON12;
    volatile uint32_t CRU_SSCGTBL_CON13;
    volatile uint32_t CRU_SSCGTBL_CON14;
    volatile uint32_t CRU_SSCGTBL_CON15;
    volatile uint32_t CRU_SSCGTBL_CON16;
    volatile uint32_t CRU_SSCGTBL_CON17;
    volatile uint32_t CRU_SSCGTBL_CON18;
    volatile uint32_t CRU_SSCGTBL_CON19;
    volatile uint32_t CRU_SSCGTBL_CON20;
    volatile uint32_t CRU_SSCGTBL_CON21;
    volatile uint32_t CRU_SSCGTBL_CON22;
    volatile uint32_t CRU_SSCGTBL_CON23;
    volatile uint32_t CRU_SSCGTBL_CON24;
    volatile uint32_t CRU_SSCGTBL_CON25;
    volatile uint32_t CRU_SSCGTBL_CON26;
    volatile uint32_t CRU_SSCGTBL_CON27;
    volatile uint32_t CRU_SSCGTBL_CON28;
    volatile uint32_t CRU_SSCGTBL_CON29;
    volatile uint32_t CRU_SSCGTBL_CON30;
    volatile uint32_t CRU_SSCGTBL_CON31;
         uint32_t RESERVED01C0[48];
    volatile uint32_t MODE_CON00;
         uint32_t RESERVED0284[31];
    volatile uint32_t CRU_CLKSEL_CON[42];
         uint32_t RESERVED03A8[278];
    volatile uint32_t CRU_CLKGATE_CON[7];
         uint32_t RESERVED081C[121];
    volatile uint32_t CRU_SOFTRST_CON[1];
         uint32_t RESERVED0A04[127];
    volatile uint32_t CRU_GLB_CNT_TH;
    volatile uint32_t CRU_GLBRST_ST;
    volatile uint32_t CRU_GLB_SRST_FST_VALUE;
    volatile uint32_t CRU_GLB_SRST_SND_VALUE;
    volatile uint32_t CRU_GLB_RST_CON;
    volatile const uint32_t CRU_GLB_RST_ST_NCLR;
         uint32_t RESERVED0C18[42];
    volatile uint32_t CLK_SAI_FRAC_DIV_HIGH;
         uint32_t RESERVED0CC4[15];
    volatile uint32_t AUTOCS_ACLK_PERI_SRC_CON[2];
    volatile uint32_t AUTOCS_HCLK_HPMCU_SRC_CON[2];
    volatile uint32_t AUTOCS_LSCLK_PERI_SRC_CON[2];
    volatile uint32_t AUTOCS_CON_ACLK_PERI_SRC;
    volatile uint32_t AUTOCS_CON_HCLK_HPMCU_SRC;
    volatile uint32_t AUTOCS_CON_LSCLK_PERI_SRC;
};

struct PMU0CRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t PMUCLKSEL_CON[3];
         uint32_t RESERVED030C[317];
    volatile uint32_t PMUGATE_CON[3];
         uint32_t RESERVED080C[125];
    volatile uint32_t PMUSOFTRST_CON[3];
         uint32_t RESERVED0A0C[189];
    volatile uint32_t AUTOCS_LSCLK_PMU_ROOT_CON[2];
};

struct PMU1CRU_REG {
         uint32_t RESERVED0000[192];
    volatile uint32_t PMU1CLKSEL_CON[1];
         uint32_t RESERVED0304[319];
    volatile uint32_t PMU1GATE_CON[2];
         uint32_t RESERVED0808[126];
    volatile uint32_t PMU1SOFTRST_CON[2];
         uint32_t RESERVED0A08[128];
    volatile uint32_t PMU1CRU_IP_CON;
};

struct GRF_VEPU_REG {
    volatile uint32_t MEM_CON_SPRA;
    volatile uint32_t MEM_CON_DPRA;
};

struct GRF_NPU_REG {
    volatile uint32_t MEM_CON_SPRA;
};

struct GRF_VI_REG {
    volatile uint32_t MEM_CON_SPRA;
    volatile uint32_t MEM_CON_DPRA;
         uint32_t RESERVED0008;
    volatile uint32_t VI_HPROT2_CON;
    volatile uint32_t STATUS;
    volatile uint32_t CSIPHY_CON;
    volatile uint32_t CSIPHY_STATUS;
         uint32_t RESERVED001C;
    volatile uint32_t MISC_CON;
    volatile uint32_t SDMMC_DET_CNT;
    volatile uint32_t SDMMC_SIG_DETECT_CON;
    volatile uint32_t SDMMC_SIG_DETECT_STATUS;
    volatile uint32_t SDMMC_STATUS_CLR;
};

struct GRF_CPU_REG {
    volatile uint32_t CON0;
    volatile uint32_t MEM_CFG_UHDSPRA;
    volatile uint32_t STATUS;
};

struct GRF_DDR_REG {
    volatile uint32_t CON0;
    volatile uint32_t CON1;
    volatile uint32_t CON2;
    volatile uint32_t CON3;
    volatile uint32_t CON4;
    volatile uint32_t CON5;
    volatile uint32_t CON6;
    volatile uint32_t CON7;
    volatile uint32_t CON8;
    volatile uint32_t CON9;
    volatile uint32_t CON10;
    volatile uint32_t CON11;
    volatile uint32_t CON12;
    volatile uint32_t CON13;
    volatile uint32_t CON14;
         uint32_t RESERVED003C[17];
    volatile uint32_t PROBE_CTRL;
         uint32_t RESERVED0084[39];
    volatile const uint32_t STATUS8;
    volatile const uint32_t STATUS9;
};

struct GRF_SYS_REG {
    volatile uint32_t PERI_CON0;
    volatile uint32_t PERI_CON1;
    volatile uint32_t PERI_CON2;
    volatile uint32_t PERI_HPROT2_CON;
    volatile uint32_t PERI_STATUS;
         uint32_t RESERVED0014[3];
    volatile uint32_t AUDIO_CON0;
    volatile uint32_t AUDIO_CON1;
         uint32_t RESERVED0028[2];
    volatile uint32_t USBOTG_CON0;
    volatile uint32_t USBOTG_CON1;
         uint32_t RESERVED0038[2];
    volatile const uint32_t USBOTG_STATUS0;
    volatile const uint32_t USBOTG_STATUS1;
    volatile const uint32_t USBOTG_STATUS2;
         uint32_t RESERVED004C;
    volatile uint32_t USBPHY_CON0;
    volatile uint32_t USBPHY_CON1;
    volatile uint32_t USBPHY_CON2;
    volatile uint32_t USBPHY_CON3;
    volatile const uint32_t USBPHY_STATUS;
         uint32_t RESERVED0064[3];
    volatile uint32_t SARADC_CON;
    volatile uint32_t TSADC_CON;
    volatile uint32_t OTP_CON;
         uint32_t RESERVED007C;
    volatile uint32_t MEM_CON_SPRA;
    volatile uint32_t MEM_CON_DPRA;
    volatile uint32_t MEM_CON_ROM;
    volatile uint32_t MEM_CON_GATE;
    volatile uint32_t BIU_CON0;
         uint32_t RESERVED0094;
    volatile const uint32_t BIU_STATUS0;
    volatile const uint32_t BIU_STATUS1;
    volatile uint32_t GMAC_CON0;
    volatile uint32_t GMAC_CLK_CON;
    volatile const uint32_t GMAC_ST;
         uint32_t RESERVED00AC;
    volatile uint32_t MACPHY_CON0;
    volatile uint32_t MACPHY_CON1;
         uint32_t RESERVED00B8[18];
    volatile uint32_t USBOTG_SIG_DETECT_CON;
    volatile const uint32_t USBOTG_SIG_DETECT_STATUS;
    volatile uint32_t USBOTG_SIG_DETECT_CLR;
         uint32_t RESERVED010C;
    volatile uint32_t USBOTG_LINESTATE_DETECT_CON;
    volatile uint32_t USBOTG_DISCONNECT_DETECT_CON;
    volatile uint32_t USBOTG_BVALID_DETECT_CON;
    volatile uint32_t USBOTG_ID_DETECT_CON;
         uint32_t RESERVED0120[56];
    volatile uint32_t CACHE_PERI_ADDR_START;
    volatile uint32_t CACHE_PERI_ADDR_END;
    volatile uint32_t HPMCU_CODE_ADDR_START;
    volatile uint32_t HPMCU_SRAM_ADDR_START;
    volatile uint32_t HPMCU_EXSRAM_ADDR_START;
    volatile uint32_t HPMCU_CACHE_MISC;
    volatile uint32_t HPMCU_CACHE_STATUS;
         uint32_t RESERVED021C[377];
    volatile uint32_t CHIP_ID;
    volatile uint32_t CHIP_VERSION;
};

struct GRF_PMU_REG {
    volatile uint32_t SOC_CON0;
    volatile uint32_t SOC_CON1;
    volatile uint32_t SOC_CON2;
    volatile uint32_t SOC_CON3;
    volatile uint32_t SOC_CON4;
    volatile uint32_t SOC_CON5;
    volatile uint32_t SOC_CON6;
    volatile uint32_t SOC_CON7;
    volatile uint32_t SOC_CON8;
    volatile uint32_t SOC_CON9;
    volatile uint32_t SOC_CON10;
         uint32_t RESERVED002C;
    volatile const uint32_t SOC_STATUS0;
         uint32_t RESERVED0034[3];
    volatile uint32_t MEN_CON;
         uint32_t RESERVED0044[3];
    volatile uint32_t SOC_SPECIAL0;
         uint32_t RESERVED0054[3];
    volatile uint32_t SOC_PREROLL_INT_CON;
         uint32_t RESERVED0064[103];
    volatile uint32_t OS_REG0;
    volatile uint32_t OS_REG1;
    volatile uint32_t OS_REG2;
    volatile uint32_t OS_REG3;
    volatile uint32_t OS_REG4;
    volatile uint32_t OS_REG5;
    volatile uint32_t OS_REG6;
    volatile uint32_t OS_REG7;
    volatile uint32_t OS_REG8;
    volatile uint32_t OS_REG9;
    volatile uint32_t OS_REG10;
    volatile uint32_t OS_REG11;
    volatile const uint32_t RESET_FUNCTION_STATUS;
    volatile uint32_t RESET_FUNCTION_CLR;
};

struct GPIO1_IOC_REG {
         uint32_t RESERVED0000[8];
    volatile uint32_t GPIO1A_IOMUX_SEL_0;
    volatile uint32_t GPIO1A_IOMUX_SEL_1_0;
         uint32_t RESERVED0028[70];
    volatile uint32_t GPIO1A_DS_0;
    volatile uint32_t GPIO1A_DS_1;
    volatile uint32_t GPIO1A_DS_2;
         uint32_t RESERVED014C[49];
    volatile uint32_t GPIO1A_PULL_0;
         uint32_t RESERVED0214[63];
    volatile uint32_t GPIO1A_IE_0;
         uint32_t RESERVED0314[63];
    volatile uint32_t GPIO1A_SMT_0;
         uint32_t RESERVED0414[63];
    volatile uint32_t GPIO1A_SUS_0;
         uint32_t RESERVED0514[63];
    volatile uint32_t GPIO1A_SL_0;
         uint32_t RESERVED0614[63];
    volatile uint32_t GPIO1A_OD_0;
         uint32_t RESERVED0714[59];
    volatile uint32_t IO_VSEL_VCCIO3;
         uint32_t RESERVED0804[15880];
    volatile uint32_t GPIO1A_IOMUX_SEL_1_1;
    volatile uint32_t GPIO1B_IOMUX_SEL_0;
    volatile uint32_t GPIO1B_IOMUX_SEL_1;
    volatile uint32_t GPIO1C_IOMUX_SEL_0;
         uint32_t RESERVED10034[70];
    volatile uint32_t GPIO1A_DS_3;
    volatile uint32_t GPIO1B_DS_0;
    volatile uint32_t GPIO1B_DS_1;
    volatile uint32_t GPIO1B_DS_2;
    volatile uint32_t GPIO1B_DS_3;
    volatile uint32_t GPIO1C_DS_0;
         uint32_t RESERVED10164[43];
    volatile uint32_t GPIO1A_PULL_1;
    volatile uint32_t GPIO1B_PULL;
    volatile uint32_t GPIO1C_PULL;
         uint32_t RESERVED1021C[61];
    volatile uint32_t GPIO1A_IE_1;
    volatile uint32_t GPIO1B_IE;
    volatile uint32_t GPIO1C_IE;
         uint32_t RESERVED1031C[61];
    volatile uint32_t GPIO1A_SMT_1;
    volatile uint32_t GPIO1B_SMT;
    volatile uint32_t GPIO1C_SMT;
         uint32_t RESERVED1041C[61];
    volatile uint32_t GPIO1A_SUS_1;
    volatile uint32_t GPIO1B_SUS;
    volatile uint32_t GPIO1C_SUS;
         uint32_t RESERVED1051C[61];
    volatile uint32_t GPIO1A_SL_1;
    volatile uint32_t GPIO1B_SL;
    volatile uint32_t GPIO1C_SL;
         uint32_t RESERVED1061C[61];
    volatile uint32_t GPIO1A_OD_1;
    volatile uint32_t GPIO1B_OD;
    volatile uint32_t GPIO1C_OD;
         uint32_t RESERVED1071C[57];
    volatile uint32_t IO_VSEL_VCCIO4;
    volatile uint32_t IO_VSEL_VCCIO7;
    volatile uint32_t MISC_CON;
    volatile uint32_t SDCARD_IO_CON;
    volatile uint32_t JTAG_M2_CON;
};

struct GPIO2_IOC_REG {
         uint32_t RESERVED0000[16];
    volatile uint32_t GPIO2A_IOMUX_SEL_0;
    volatile uint32_t GPIO2A_IOMUX_SEL_1;
    volatile uint32_t GPIO2B_IOMUX_SEL_0;
         uint32_t RESERVED004C[77];
    volatile uint32_t GPIO2A_DS_0;
    volatile uint32_t GPIO2A_DS_1;
    volatile uint32_t GPIO2A_DS_2;
    volatile uint32_t GPIO2A_DS_3;
    volatile uint32_t GPIO2B_DS_0;
    volatile uint32_t GPIO2B_DS_1;
         uint32_t RESERVED0198[34];
    volatile uint32_t GPIO2A_PULL;
    volatile uint32_t GPIO2B_PULL;
         uint32_t RESERVED0228[62];
    volatile uint32_t GPIO2A_IE;
    volatile uint32_t GPIO2B_IE;
         uint32_t RESERVED0328[62];
    volatile uint32_t GPIO2A_SMT;
    volatile uint32_t GPIO2B_SMT;
         uint32_t RESERVED0428[62];
    volatile uint32_t GPIO2A_SUS;
    volatile uint32_t GPIO2B_SUS;
         uint32_t RESERVED0528[62];
    volatile uint32_t GPIO2A_SL;
    volatile uint32_t GPIO2B_SL;
         uint32_t RESERVED0628[62];
    volatile uint32_t GPIO2A_OD;
    volatile uint32_t GPIO2B_OD;
         uint32_t RESERVED0728[54];
    volatile uint32_t IO_VSEL_VCCIO6;
    volatile uint32_t MISC_CON;
         uint32_t RESERVED0808;
    volatile uint32_t SARADC_CON0;
    volatile uint32_t SARADC_CON1;
};

struct GPIO0_A_IOC_REG {
    volatile uint32_t GPIO0A_IOMUX_SEL_0;
    volatile uint32_t GPIO0A_IOMUX_SEL_1;
         uint32_t RESERVED0008[62];
    volatile uint32_t GPIO0A_DS_0;
    volatile uint32_t GPIO0A_DS_1;
    volatile uint32_t GPIO0A_DS_2;
    volatile uint32_t GPIO0A_DS_3;
         uint32_t RESERVED0110[60];
    volatile uint32_t GPIO0A_PULL;
         uint32_t RESERVED0204[63];
    volatile uint32_t GPIO0A_IE;
         uint32_t RESERVED0304[63];
    volatile uint32_t GPIO0A_SMT;
         uint32_t RESERVED0404[63];
    volatile uint32_t GPIO0A_SUS;
         uint32_t RESERVED0504[63];
    volatile uint32_t GPIO0A_SL;
         uint32_t RESERVED0604[63];
    volatile uint32_t GPIO0A_OD;
         uint32_t RESERVED0704[63];
    volatile uint32_t IO_VSEL;
    volatile uint32_t GRF_JTAG_CON0;
    volatile uint32_t GRF_JTAG_CON1;
         uint32_t RESERVED080C[61];
    volatile uint32_t XIN_CON;
};

struct GPIO0_B_IOC_REG {
         uint32_t RESERVED0000[2];
    volatile uint32_t GPIO0B_IOMUX_SEL_0;
    volatile uint32_t GPIO0B_IOMUX_SEL_1;
         uint32_t RESERVED0010[64];
    volatile uint32_t GPIO0B_DS_0;
    volatile uint32_t GPIO0B_DS_1;
    volatile uint32_t GPIO0B_DS_2;
         uint32_t RESERVED011C[58];
    volatile uint32_t GPIO0B_PULL;
         uint32_t RESERVED0208[63];
    volatile uint32_t GPIO0B_IE;
         uint32_t RESERVED0308[63];
    volatile uint32_t GPIO0B_SMT;
         uint32_t RESERVED0408[63];
    volatile uint32_t GPIO0B_SUS;
         uint32_t RESERVED0508[63];
    volatile uint32_t GPIO0B_SL;
         uint32_t RESERVED0608[63];
    volatile uint32_t GPIO0B_OD;
         uint32_t RESERVED0708[62];
    volatile uint32_t IO_VSEL;
    volatile uint32_t GRF_JTAG_CON0;
    volatile uint32_t GRF_JTAG_CON1;
};

struct GPIO_REG {
    volatile uint32_t SWPORT_DR_L;
    volatile uint32_t SWPORT_DR_H;
    volatile uint32_t SWPORT_DDR_L;
    volatile uint32_t SWPORT_DDR_H;
    volatile uint32_t INT_EN_L;
    volatile uint32_t INT_EN_H;
    volatile uint32_t INT_MASK_L;
    volatile uint32_t INT_MASK_H;
    volatile uint32_t INT_TYPE_L;
    volatile uint32_t INT_TYPE_H;
    volatile uint32_t INT_POLARITY_L;
    volatile uint32_t INT_POLARITY_H;
    volatile uint32_t INT_BOTHEDGE_L;
    volatile uint32_t INT_BOTHEDGE_H;
    volatile uint32_t DEBOUNCE_L;
    volatile uint32_t DEBOUNCE_H;
    volatile uint32_t DBCLK_DIV_EN_L;
    volatile uint32_t DBCLK_DIV_EN_H;
    volatile uint32_t DBCLK_DIV_CON;
         uint32_t RESERVED004C;
    volatile const uint32_t INT_STATUS;
         uint32_t RESERVED0054;
    volatile const uint32_t INT_RAWSTATUS;
         uint32_t RESERVED005C;
    volatile uint32_t PORT_EOI_L;
    volatile uint32_t PORT_EOI_H;
         uint32_t RESERVED0068[2];
    volatile const uint32_t EXT_PORT;
         uint32_t RESERVED0074;
    volatile const uint32_t VER_ID;
         uint32_t RESERVED007C;
    volatile uint32_t STORE_ST_L;
    volatile uint32_t STORE_ST_H;
         uint32_t RESERVED0088[30];
    volatile uint32_t GPIO_REG_GROUP_L;
    volatile uint32_t GPIO_REG_GROUP_H;
    volatile uint32_t GPIO_VIRTUAL_EN;
         uint32_t RESERVED010C;
    volatile uint32_t GPIO_REG_GROUP1_L;
    volatile uint32_t GPIO_REG_GROUP1_H;
    volatile uint32_t GPIO_REG_GROUP2_L;
    volatile uint32_t GPIO_REG_GROUP2_H;
    volatile uint32_t GPIO_REG_GROUP3_L;
    volatile uint32_t GPIO_REG_GROUP3_H;
};

struct I2C_REG {
    volatile uint32_t CON;
    volatile uint32_t CLKDIV;
    volatile uint32_t MRXADDR;
    volatile uint32_t MRXRADDR;
    volatile uint32_t MTXCNT;
    volatile uint32_t MRXCNT;
    volatile uint32_t IEN;
    volatile uint32_t IPD;
    volatile const uint32_t FCNT;
    volatile uint32_t SCL_OE_DB;
         uint32_t RESERVED0028[54];
    volatile uint32_t TXDATA[8];
         uint32_t RESERVED0120[56];
    volatile const uint32_t RXDATA[8];
    volatile const uint32_t ST;
    volatile uint32_t DBGCTRL;
    volatile uint32_t CON1;
};

struct UART_REG {
    union {
        volatile const uint32_t RBR;
        volatile uint32_t DLL;
        volatile uint32_t THR;
    };
    union {
        volatile uint32_t DLH;
        volatile uint32_t IER;
    };
    union {
        volatile uint32_t FCR;
        volatile const uint32_t IIR;
    };
    volatile uint32_t LCR;
    volatile uint32_t MCR;
    volatile const uint32_t LSR;
    volatile const uint32_t MSR;
    volatile uint32_t SCR;
         uint32_t RESERVED0020[4];
    union {
        volatile const uint32_t SRBR;
        volatile uint32_t STHR;
    };
         uint32_t RESERVED0034[15];
    volatile uint32_t FAR;
    volatile const uint32_t TFR;
    volatile uint32_t RFW;
    volatile const uint32_t USR;
    volatile const uint32_t TFL;
    volatile const uint32_t RFL;
    volatile uint32_t SRR;
    volatile uint32_t SRTS;
    volatile uint32_t SBCR;
    volatile uint32_t SDMAM;
    volatile uint32_t SFE;
    volatile uint32_t SRT;
    volatile uint32_t STET;
    volatile uint32_t HTX;
    volatile uint32_t DMASA;
         uint32_t RESERVED00AC[18];
    volatile const uint32_t CPR;
    volatile const uint32_t UCV;
    volatile const uint32_t CTR;
};

struct PWM_REG {
    volatile const uint32_t VERSION_ID;
    volatile uint32_t ENABLE;
    volatile uint32_t CLK_CTRL;
    volatile uint32_t CTRL;
    volatile uint32_t PERIOD;
    volatile uint32_t DUTY;
    volatile uint32_t OFFSET;
    volatile uint32_t RPT;
    volatile uint32_t FILTER_CTRL;
    volatile const uint32_t CNT;
    volatile uint32_t ENABLE_DELAY;
    volatile uint32_t HPC;
    volatile uint32_t LPC;
         uint32_t RESERVED0034[15];
    volatile uint32_t INTSTS;
    volatile uint32_t INT_EN;
         uint32_t RESERVED0078[18];
    volatile uint32_t GLOBAL_ARBITER;
    volatile uint32_t GLOBAL_CTRL;
         uint32_t RESERVED00C8[14];
    volatile uint32_t PWRMATCH_ARBITER;
    volatile uint32_t PWRMATCH_CTRL;
    volatile uint32_t PWRMATCH_LPRE;
    volatile uint32_t PWRMATCH_HPRE;
    volatile uint32_t PWRMATCH_LD;
    volatile uint32_t PWRMATCH_HD_ZERO;
    volatile uint32_t PWRMATCH_HD_ONE;
    volatile uint32_t PWRMATCH_VALUE[16];
    volatile const uint32_t PWRCAPTURE_VALUE;
         uint32_t RESERVED0160[24];
    volatile uint32_t FREQ_ARBITER;
    volatile uint32_t FREQ_CTRL;
    volatile uint32_t FREQ_TIMER_VALUE;
    volatile uint32_t FREQ_RESULT_VALUE;
         uint32_t RESERVED01D0[12];
    volatile uint32_t COUNTER_ARBITER;
    volatile uint32_t COUNTER_CTRL;
    volatile const uint32_t COUNTER_LOW;
    volatile const uint32_t COUNTER_HIGH;
};

struct SPI2AHB_REG {
    volatile uint32_t SPI_CTRL;
    volatile uint32_t DMA_CTRL;
         uint32_t RESERVED0008;
    volatile uint32_t SPI_EN;
    volatile uint32_t FRAME_ADDR;
    volatile uint32_t FRAME_BNUM;
         uint32_t RESERVED0018[4];
    volatile uint32_t FRAME_TME_EN;
    volatile uint32_t FRAME_TME;
    volatile uint32_t SW_RST;
         uint32_t RESERVED0034;
    volatile const uint32_t CSN;
         uint32_t RESERVED003C;
    volatile uint32_t IMR;
    volatile uint32_t ICLR;
    volatile const uint32_t ISR;
    volatile const uint32_t RISR;
    volatile const uint32_t VER;
    volatile const uint32_t MONITOR;
    volatile const uint32_t FRAME_CNT_MONITOR;
};

struct MBOX_REG {
    volatile uint32_t A2B_INTEN;
    volatile uint32_t A2B_STATUS;
    volatile uint32_t A2B_CMD;
    volatile uint32_t A2B_DATA;
    volatile uint32_t B2A_INTEN;
    volatile uint32_t B2A_STATUS;
    volatile uint32_t B2A_CMD;
    volatile uint32_t B2A_DATA;
};

struct FSPI_REG {
    volatile uint32_t CTRL0;
    volatile uint32_t IMR;
    volatile uint32_t ICLR;
    volatile uint32_t FTLR;
    volatile uint32_t RCVR;
    volatile uint32_t AX0;
    volatile uint32_t ABIT0;
    volatile uint32_t ISR;
    volatile uint32_t FSR;
    volatile const uint32_t SR;
    volatile uint32_t RISR;
    volatile uint32_t VER;
    volatile uint32_t QOP;
    volatile uint32_t EXT_CTRL;
         uint32_t RESERVED0038;
    volatile uint32_t DLL_CTRL0;
    volatile uint32_t HRDYMASK;
    volatile uint32_t EXT_AX;
    volatile uint32_t SCLK_INATM_CNT;
         uint32_t RESERVED004C;
    volatile uint32_t XMMC_WCMD0;
    volatile uint32_t XMMC_RCMD0;
    volatile uint32_t XMMC_CTRL;
    volatile uint32_t MODE;
    volatile uint32_t DEVRGN;
    volatile uint32_t DEVSIZE0;
    volatile uint32_t TME0;
         uint32_t RESERVED006C;
    volatile uint32_t RX_FULL_WTMRK;
    volatile uint32_t DUMM_CTRL;
    volatile uint32_t CMD_EXT;
    volatile uint32_t TRC_CTRL;
    volatile uint32_t DMATR;
    volatile uint32_t DMAADDR;
    volatile uint32_t LEN_CTRL;
    volatile uint32_t LEN_EXT;
         uint32_t RESERVED0090;
    volatile uint32_t XMMCSR;
    volatile uint32_t HYPER_RSVD_ADDR;
    volatile uint32_t VDMC0;
    volatile uint32_t DBG_IO_CTRL;
    volatile uint32_t DEV_RSTN;
    volatile uint32_t SLF_DQS_CTRL;
    volatile uint32_t TRNS_TR_CTRL;
    volatile uint32_t TRNS_TR;
    volatile uint32_t DMA_CHAIN_TR;
    volatile uint32_t DMA_HEAD_ADDR;
    volatile uint32_t DMA_CTRL;
         uint32_t RESERVED00C0[16];
    volatile uint32_t CMD;
    volatile uint32_t ADDR;
    volatile uint32_t DATA;
         uint32_t RESERVED010C[61];
    volatile uint32_t CTRL1;
         uint32_t RESERVED0204[4];
    volatile uint32_t AX1;
    volatile uint32_t ABIT1;
         uint32_t RESERVED021C[8];
    volatile uint32_t DLL_CTRL1;
         uint32_t RESERVED0240[4];
    volatile uint32_t XMMC_WCMD1;
    volatile uint32_t XMMC_RCMD1;
         uint32_t RESERVED0258[3];
    volatile uint32_t DEVSIZE1;
    volatile uint32_t TME1;
         uint32_t RESERVED026C[12];
    volatile uint32_t VDMC1;
};

struct ICACHE_REG {
    volatile uint32_t CACHE_CTRL;
    volatile uint32_t CACHE_MAINTAIN[2];
    volatile uint32_t STB_TIMEOUT_CTRL;
         uint32_t RESERVED0010[4];
    volatile uint32_t CACHE_INT_EN;
    volatile uint32_t CACHE_INT_ST;
    volatile const uint32_t CACHE_ERR_HADDR;
         uint32_t RESERVED002C;
    volatile const uint32_t CACHE_STATUS;
         uint32_t RESERVED0034[3];
    volatile const uint32_t PMU_RD_NUM_CNT;
    volatile const uint32_t PMU_WR_NUM_CNT;
    volatile const uint32_t PMU_SRAM_RD_HIT_CNT;
    volatile const uint32_t PMU_HB_RD_HIT_CNT;
    volatile const uint32_t PMU_STB_RD_HIT_CNT;
    volatile const uint32_t PMU_RD_HIT_CNT;
    volatile const uint32_t PMU_WR_HIT_CNT;
    volatile const uint32_t PMU_RD_MISS_PENALTY_CNT;
    volatile const uint32_t PMU_WR_MISS_PENALTY_CNT;
    volatile const uint32_t PMU_RD_LAT_CNT;
    volatile const uint32_t PMU_WR_LAT_CNT;
         uint32_t RESERVED006C[33];
    volatile const uint32_t REVISION;
};

struct DCACHE_REG {
    volatile uint32_t CACHE_CTRL;
    volatile uint32_t CACHE_MAINTAIN[2];
    volatile uint32_t STB_TIMEOUT_CTRL;
         uint32_t RESERVED0010[4];
    volatile uint32_t CACHE_INT_EN;
    volatile uint32_t CACHE_INT_ST;
    volatile const uint32_t CACHE_ERR_HADDR;
         uint32_t RESERVED002C;
    volatile const uint32_t CACHE_STATUS;
         uint32_t RESERVED0034[3];
    volatile const uint32_t PMU_RD_NUM_CNT;
    volatile const uint32_t PMU_WR_NUM_CNT;
    volatile const uint32_t PMU_SRAM_RD_HIT_CNT;
    volatile const uint32_t PMU_HB_RD_HIT_CNT;
    volatile const uint32_t PMU_STB_RD_HIT_CNT;
    volatile const uint32_t PMU_RD_HIT_CNT;
    volatile const uint32_t PMU_WR_HIT_CNT;
    volatile const uint32_t PMU_RD_MISS_PENALTY_CNT;
    volatile const uint32_t PMU_WR_MISS_PENALTY_CNT;
    volatile const uint32_t PMU_RD_LAT_CNT;
    volatile const uint32_t PMU_WR_LAT_CNT;
         uint32_t RESERVED006C[33];
    volatile const uint32_t REVISION;
};

struct SPINLOCK_REG {
    volatile uint32_t STATUS[64];
};

struct TIMER_REG {
    volatile uint32_t LOAD_COUNT[2];
    volatile const uint32_t CURRENT_VALUE[2];
    volatile uint32_t CONTROLREG;
         uint32_t RESERVED0014;
    volatile uint32_t INTSTATUS;
};

struct SPI_REG {
    volatile uint32_t CTRLR[2];
    volatile uint32_t ENR;
    volatile uint32_t SER;
    volatile uint32_t BAUDR;
    volatile uint32_t TXFTLR;
    volatile uint32_t RXFTLR;
    volatile const uint32_t TXFLR;
    volatile const uint32_t RXFLR;
    volatile const uint32_t SR;
    volatile uint32_t IPR;
    volatile uint32_t IMR;
    volatile uint32_t ISR;
    volatile uint32_t RISR;
    volatile uint32_t ICR;
    volatile uint32_t DMACR;
    volatile uint32_t DMATDLR;
    volatile uint32_t DMARDLR;
    volatile const uint32_t VERSION;
    volatile uint32_t TIMEOUT;
    volatile uint32_t BYPASS;
         uint32_t RESERVED0054[235];
    volatile uint32_t TXDR;
         uint32_t RESERVED0404[255];
    volatile const uint32_t RXDR;
};

struct SARADC_REG {
    volatile uint32_t CONV_CON;
    volatile uint32_t T_PD_SOC;
    volatile uint32_t T_AS_SOC;
    volatile uint32_t T_DAS_SOC;
    volatile uint32_t T_SEL_SOC;
    volatile uint32_t HIGH_COMP[16];
    volatile uint32_t LOW_COMP[16];
    volatile uint32_t DEBOUNCE;
    volatile uint32_t HT_INT_EN;
    volatile uint32_t LT_INT_EN;
         uint32_t RESERVED00A0[24];
    volatile uint32_t MT_INT_EN;
    volatile uint32_t END_INT_EN;
    volatile uint32_t ST_CON;
    volatile const uint32_t STATUS;
    volatile uint32_t END_INT_ST;
    volatile uint32_t HT_INT_ST;
    volatile uint32_t LT_INT_ST;
    volatile uint32_t MT_INT_ST;
    volatile const uint32_t DATA[16];
    volatile uint32_t AUTO_CH_EN;
};
# 125 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b_cru.h" 1
# 126 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h" 2
# 158 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
typedef enum CLOCK_Name {
    CLK_INVALID = 0U,
    PLL_GPLL,
    TCLK_WDT_NS,
    TCLK_WDT_S,
    CLK_I2C0,
    CLK_I2C1,
    CLK_I2C2,
    CLK_I2C3,
    CLK_I2C4,


    PCLK_PERI_ROOT = ((((0U) & 0xffffffffULL) << 32) | ((0x02000000) & 0xffffffffULL)),
    CLK_TSADC = ((((0U) & 0xffffffffULL) << 32) | ((0x05040000) & 0xffffffffULL)),
    CLK_TSADC_TSEN = ((((0U) & 0xffffffffULL) << 32) | ((0x050A0000) & 0xffffffffULL)),
    CLK_SARADC = ((((0U) & 0xffffffffULL) << 32) | ((0x03000001) & 0xffffffffULL)),


    CLK_UART0_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x05000705) & 0xffffffffULL)),
    CLK_UART0_FRAC = ((((0U) & 0xffffffffULL) << 32) | ((0x2000070A) & 0xffffffffULL)),
    CLK_UART0 = ((((0x02080720) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_UART1_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x05050705) & 0xffffffffULL)),
    CLK_UART1_FRAC = ((((0U) & 0xffffffffULL) << 32) | ((0x2000070B) & 0xffffffffULL)),
    CLK_UART1 = ((((0x020A0720) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_UART2_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x050A0705) & 0xffffffffULL)),
    CLK_UART2_FRAC = ((((0U) & 0xffffffffULL) << 32) | ((0x2000070C) & 0xffffffffULL)),
    CLK_UART2 = ((((0x020C0720) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_SAI_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x05000714) & 0xffffffffULL)),
    CLK_SAI_FRAC = ((((0U) & 0xffffffffULL) << 32) | ((0x20000715) & 0xffffffffULL)),
    MCLK_SAI = ((((0x020A0723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),

    CCLK_EMMC = ((((0x010F071F) & 0xffffffffULL) << 32) | ((0x0800071F) & 0xffffffffULL)),
    CCLK_SDMMC0 = ((((0x010F0720) & 0xffffffffULL) << 32) | ((0x08000720) & 0xffffffffULL)),
    CCLK_SDMMC1 = ((((0x010F0724) & 0xffffffffULL) << 32) | ((0x08000724) & 0xffffffffULL)),

    SCLK_SFC_2X = ((((0x010F0721) & 0xffffffffULL) << 32) | ((0x08000721) & 0xffffffffULL)),
    LSCLK_PERI_SRC = ((((0x0109071F) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    ACLK_PERI_SRC = ((((0x020A071F) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    HCLK_HPMCU_SRC = ((((0x010C071F) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_I2C_PMU = ((((0x01000722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_I2C_PERI = ((((0x01010722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_SPI0 = ((((0x02020722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_PWM0 = ((((0x010C0722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_PWM1 = ((((0x010D0722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_PWM2 = ((((0x010E0722) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    DCLK_DECOM = ((((0x02000723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_CORE_CRYPTO = ((((0x02020723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_PKA_CRYPTO = ((((0x02040723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_CORE_RGA = ((((0x01080723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_FREQ_PWM0 = ((((0x020C0723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_COUNTER_PWM0 = ((((0x020E0723) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    MCLK_SAI_OUT2IO = ((((0x01070729) & 0xffffffffULL) << 32) | ((0x030D0729) & 0xffffffffULL)),
    CLK_REF_MIPI0_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x05000728) & 0xffffffffULL)),
    CLK_REF_MIPI1_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x05080728) & 0xffffffffULL)),
    CLK_MIPI0_OUT2IO = ((((0x01060728) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    CLK_MIPI1_OUT2IO = ((((0x010E0728) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    DCLK_VICAP_SRC = ((((0x010E071E) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),

    CLK_ISP_GPLL_SRC = ((((0U) & 0xffffffffULL) << 32) | ((0x02090725) & 0xffffffffULL)),
    CLK_CORE_ISP = ((((0x01010300) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
    LSCLK_VI_ROOT = ((((0x01030300) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),

    SCLK_SFC_2X_PMU1 = ((((0x01080900) & 0xffffffffULL) << 32) | ((0U) & 0xffffffffULL)),
} eCLOCK_Name;
# 25 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_list.h" 1
# 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_list.h"
struct HAL_LIST_NODE {
    struct HAL_LIST_NODE *next;
    struct HAL_LIST_NODE *prev;
};

typedef struct HAL_LIST_NODE HAL_LIST;
# 48 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_list.h"
static inline void HAL_LIST_Init(HAL_LIST *l)
{
    l->next = l->prev = l;
}






static inline void HAL_LIST_InsertAfter(HAL_LIST *l, HAL_LIST *n)
{
    l->next->prev = n;
    n->next = l->next;

    l->next = n;
    n->prev = l;
}






static inline void HAL_LIST_InsertBefore(HAL_LIST *l, HAL_LIST *n)
{
    l->prev->next = n;
    n->prev = l->prev;

    l->prev = n;
    n->next = l;
}





static inline void HAL_LIST_Remove(HAL_LIST *n)
{
    n->next->prev = n->prev;
    n->prev->next = n->next;

    n->next = n->prev = n;
}





static inline int HAL_LIST_IsEmpty(const HAL_LIST *l)
{
    return l->next == l;
}





static inline uint32_t HAL_LIST_Len(const HAL_LIST *l)
{
    uint32_t len = 0;
    const HAL_LIST *p = l;

    while (p->next != l) {
        p = p->next;
        len++;
    }

    return len;
}
# 26 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 2
# 158 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
typedef enum {
    HAL_SYSTICK_CLKSRC_CORE,
    HAL_SYSTICK_CLKSRC_EXT
} eHAL_systickClkSource;






typedef enum {
    HAL_FALSE = 0x00U,
    HAL_TRUE = 0x01U
} HAL_Check;


typedef enum {
    HAL_OK = 0x00U,
    HAL_ERROR = (-1),
    HAL_BUSY = (-16),
    HAL_NODEV = (-19),
    HAL_INVAL = (-22),
    HAL_NOSYS = (-38),
    HAL_TIMEOUT = (-110)
} HAL_Status;


typedef enum {
    HAL_DISABLE = 0x00U,
    HAL_ENABLE = 0x01U
} HAL_FuncStatus;


typedef enum {
    HAL_UNLOCKED = 0x00U,
    HAL_LOCKED = 0x01U
} HAL_LockStatus;


typedef enum {

    GPIO_BANK0 = 0,


    GPIO_BANK1 = 1,


    GPIO_BANK2 = 2,
# 273 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
    GPIO_BANK_NUM
} eGPIO_bankId;


typedef void (*pFunc)(void);
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h" 2
# 46 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
enum {
    PM_RUNTIME_TYPE_INTF = 0,
    PM_RUNTIME_TYPE_DISPLAY,
    PM_RUNTIME_TYPE_AUDIO,
    PM_RUNTIME_TYPE_HS_INTF,
    PM_RUNTIME_TYPE_STORAGE,
    PM_RUNTIME_TYPE_UART,
    PM_RUNTIME_TYPE_I2C,
    PM_RUNTIME_TYPE_SPI,
    PM_RUNTIME_TYPE_CIF,
    PM_RUNTIME_TYPE_DEVICE,
    PM_RUNTIME_TYPE_END,
};

typedef enum {
    PM_RUNTIME_IDLE_ONLY = 0,
    PM_RUNTIME_IDLE_NORMAL,
    PM_RUNTIME_IDLE_DEEP,
    PM_RUNTIME_IDLE_DEEP1,
    PM_RUNTIME_IDLE_DEEP2,
} ePM_RUNTIME_idleMode;

typedef enum {
    PM_RUNTIME_ID_INTF_INVLD = ((PM_RUNTIME_TYPE_INTF) << (3)),
    PM_RUNTIME_ID_SPI_APB,
    PM_RUNTIME_ID_VOP = ((PM_RUNTIME_TYPE_DISPLAY) << (3)),
    PM_RUNTIME_ID_MIPI,

    PM_RUNTIME_ID_I2S = ((PM_RUNTIME_TYPE_AUDIO) << (3)),
    PM_RUNTIME_ID_I2S1,
    PM_RUNTIME_ID_I2S2,
    PM_RUNTIME_ID_ADC,
    PM_RUNTIME_ID_DMA,

    PM_RUNTIME_ID_USB = ((PM_RUNTIME_TYPE_HS_INTF) << (3)),
    PM_RUNTIME_ID_SDIO,

    PM_RUNTIME_ID_UART0 = ((PM_RUNTIME_TYPE_UART) << (3)),
    PM_RUNTIME_ID_UART1,
    PM_RUNTIME_ID_UART2,
    PM_RUNTIME_ID_UART3,
    PM_RUNTIME_ID_UART4,
    PM_RUNTIME_ID_UART5,
    PM_RUNTIME_ID_UART6,
    PM_RUNTIME_ID_UART7,
    PM_RUNTIME_ID_UART8,
    PM_RUNTIME_ID_UART9,

    PM_RUNTIME_ID_I2C0 = ((PM_RUNTIME_TYPE_I2C) << (3)),
    PM_RUNTIME_ID_I2C1,
    PM_RUNTIME_ID_I2C2,
    PM_RUNTIME_ID_I2C3,
    PM_RUNTIME_ID_I2C4,
    PM_RUNTIME_ID_I2C5,

    PM_RUNTIME_ID_SPI = ((PM_RUNTIME_TYPE_SPI) << (3)),
    PM_RUNTIME_ID_CIF = ((PM_RUNTIME_TYPE_CIF) << (3)),

    PM_RUNTIME_ID_END,
} ePM_RUNTIME_ID;


struct PM_RUNTIME_INFO {
    uint8_t bits[PM_RUNTIME_TYPE_END];
};
# 180 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
HAL_Status HAL_PM_TimerStart(uint64_t timeoutCount, 
# 180 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h" 3 4
                                                   _Bool 
# 180 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
                                                        needTimeout);





HAL_Status HAL_PM_TimerStop(void);





uint64_t HAL_PM_GetTimerCount(void);
# 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 35 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h" 1
# 18 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_debug.h" 1
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_debug.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/inttypes.h" 1 3
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/inttypes.h" 3
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h" 1 3 4
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/inttypes.h" 2 3
# 312 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/inttypes.h" 3

# 312 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/inttypes.h" 3
typedef struct {
  intmax_t quot;
  intmax_t rem;
} imaxdiv_t;

struct _reent;





extern intmax_t imaxabs(intmax_t);
extern imaxdiv_t imaxdiv(intmax_t numer, intmax_t denomer);
extern intmax_t strtoimax(const char *restrict, char **restrict, int);
extern intmax_t _strtoimax_r(struct _reent *, const char *restrict, char **restrict, int);
extern uintmax_t strtoumax(const char *restrict, char **restrict, int);
extern uintmax_t _strtoumax_r(struct _reent *, const char *restrict, char **restrict, int);
extern intmax_t wcstoimax(const wchar_t *restrict, wchar_t **restrict, int);
extern intmax_t _wcstoimax_r(struct _reent *, const wchar_t *restrict, wchar_t **restrict, int);
extern uintmax_t wcstoumax(const wchar_t *restrict, wchar_t **restrict, int);
extern uintmax_t _wcstoumax_r(struct _reent *, const wchar_t *restrict, wchar_t **restrict, int);


extern intmax_t strtoimax_l(const char *restrict, char **_restrict, int, locale_t);
extern uintmax_t strtoumax_l(const char *restrict, char **_restrict, int, locale_t);
extern intmax_t wcstoimax_l(const wchar_t *restrict, wchar_t **_restrict, int, locale_t);
extern uintmax_t wcstoumax_l(const wchar_t *restrict, wchar_t **_restrict, int, locale_t);
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_debug.h" 2
# 83 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_debug.h"

# 83 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_debug.h"
void HAL_AssertFailed(const char *file, uint32_t line);
HAL_Status HAL_DBG_HEX(char *s, void *buf, uint32_t width, uint32_t len);

__attribute__((__format__(printf, 1, 2)))

int32_t HAL_DBG_Printf(const char *format, ...);
# 19 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h" 2
# 31 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h"
struct CACHE_PMU_CNT {
    uint32_t rdNum;
    uint32_t wrNum;
    uint32_t sramRdHit;
    uint32_t hbRdHit;
    uint32_t stbRdHit;
    uint32_t rdHit;
    uint32_t wrHit;
    uint32_t rdMissPenalty;
    uint32_t wrMissPenalty;
    uint32_t rdLat;
    uint32_t wrLat;
};
# 52 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h"
uintptr_t HAL_CpuAddrToDmaAddr(uintptr_t cpuAddr);
HAL_Status HAL_ICACHE_Enable(void);
HAL_Status HAL_ICACHE_Disable(void);
HAL_Status HAL_ICACHE_Invalidate(void);
HAL_Status HAL_ICACHE_InvalidateByRange(uintptr_t address, uint32_t sizeByte);
HAL_Status HAL_ICACHE_EnablePMU(void);
HAL_Status HAL_ICACHE_DisablePMU(void);
HAL_Status HAL_ICACHE_GetPMU(struct CACHE_PMU_CNT *stat);
HAL_Status HAL_ICACHE_EnableInt(void);
HAL_Status HAL_ICACHE_DisableInt(void);
HAL_Check HAL_ICACHE_GetInt(void);
uintptr_t HAL_ICACHE_GetErrAddr(void);
HAL_Status HAL_ICACHE_ClearInt(void);
HAL_Status HAL_DCACHE_Enable(void);
HAL_Status HAL_DCACHE_Disable(void);
HAL_Status HAL_DCACHE_Invalidate(void);
HAL_Status HAL_DCACHE_InvalidateByRange(uintptr_t address, uint32_t sizeByte);
HAL_Status HAL_DCACHE_CleanByRange(uintptr_t address, uint32_t sizeByte);
HAL_Status HAL_DCACHE_CleanInvalidateByRange(uintptr_t address, uint32_t sizeByte);
HAL_Status HAL_DCACHE_CleanInvalidate(void);
HAL_Status HAL_DCACHE_EnablePMU(void);
HAL_Status HAL_DCACHE_DisablePMU(void);
HAL_Status HAL_DCACHE_GetPMU(struct CACHE_PMU_CNT *stat);
HAL_Status HAL_DCACHE_EnableInt(void);
HAL_Status HAL_DCACHE_DisableInt(void);
HAL_Check HAL_DCACHE_GetInt(void);
HAL_Status HAL_DCACHE_ClearInt(void);
uintptr_t HAL_DCACHE_GetErrAddr(void);
# 36 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 58 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h" 1
# 115 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
struct PLL_CONFIG {
    uint32_t rate;

    union {
        struct {
            uint32_t fbDiv;
            uint32_t postDiv1;
            uint32_t refDiv;
            uint32_t postDiv2;
            uint32_t dsmpd;
            uint32_t frac;
        };
        struct {
            uint32_t m;
            uint32_t p;
            uint32_t s;
            uint32_t k;
        };
    };
};

struct PLL_SETUP {
    volatile uint32_t *conOffset0;
    volatile uint32_t *conOffset1;
    volatile uint32_t *conOffset2;
    volatile uint32_t *conOffset3;
    volatile uint32_t *conOffset6;
    volatile uint32_t *modeOffset;
    volatile const uint32_t *stat0;
    uint32_t modeShift;
    uint32_t lockShift;
    uint32_t modeMask;
    const struct PLL_CONFIG *rateTable;
};

typedef enum {
    GLB_SRST_FST = 0xfdb9,
    GLB_SRST_SND = 0xeca8,
} eCRU_GlbSrstType;

typedef enum {
    GLB_RST_FST_WDT0 = 0U,
    GLB_RST_SND_WDT0,
    GLB_RST_FST_WDT1,
    GLB_RST_SND_WDT1,
    GLB_RST_FST_WDT2,
    GLB_RST_SND_WDT2,
    GLB_RST_FST_WDT3,
    GLB_RST_SND_WDT3,
    GLB_RST_FST_WDT4,
    GLB_RST_SND_WDT4,
} eCRU_WdtRstType;

struct CRU_BANK_INFO {
    uint32_t cruBase;
    uint32_t selOffset;
    uint32_t gateOffset;
    uint32_t softOffset;
};

struct HAL_CRU_DEV {
    const struct CRU_BANK_INFO *banks;
    uint8_t banksNum;
};

struct HAL_PVT_CFG {
    eCLOCK_Name clk;
    uint64_t rate;
    uint32_t length;
};

extern const struct HAL_CRU_DEV g_cruDev;
# 200 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
int HAL_CRU_FreqGetMux4(uint32_t freq, uint32_t freq0, uint32_t freq1,
                        uint32_t freq2, uint32_t freq3);
int HAL_CRU_FreqGetMux3(uint32_t freq, uint32_t freq0, uint32_t freq1,
                        uint32_t freq2);
int HAL_CRU_FreqGetMux2(uint32_t freq, uint32_t freq0, uint32_t freq1);
int HAL_CRU_FreqGetMuxArray(uint32_t freq, uint32_t *table, int num);

uint32_t HAL_CRU_MuxGetFreq4(uint32_t muxName, uint32_t freq0, uint32_t freq1,
                             uint32_t freq2, uint32_t freq3);
uint32_t HAL_CRU_MuxGetFreq3(uint32_t muxName, uint32_t freq0, uint32_t freq1,
                             uint32_t freq2);
uint32_t HAL_CRU_MuxGetFreq2(uint32_t muxName, uint32_t freq0, uint32_t freq1);
uint32_t HAL_CRU_MuxGetFreqArray(uint32_t muxName, uint32_t *table, int num);

int HAL_CRU_RoundFreqGetMux4(uint32_t freq, uint32_t pFreq0, uint32_t pFreq1,
                             uint32_t pFreq2, uint32_t pFreq3, uint32_t *pFreqOut);
int HAL_CRU_RoundFreqGetMux3(uint32_t freq, uint32_t pFreq0, uint32_t pFreq1,
                             uint32_t pFreq2, uint32_t *pFreqOut);
int HAL_CRU_RoundFreqGetMux2(uint32_t freq, uint32_t pFreq0, uint32_t pFreq1,
                             uint32_t *pFreqOut);
int HAL_CRU_RoundFreqGetMuxArray(uint32_t freq, uint32_t *table, int num, uint32_t *pFreqOut, 
# 220 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h" 3 4
                                                                                             _Bool 
# 220 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
                                                                                                  is_div);
# 233 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
uint32_t HAL_CRU_GetPllFreq(struct PLL_SETUP *pSetup);







HAL_Status HAL_CRU_SetPllFreq(struct PLL_SETUP *pSetup, uint32_t rate);






HAL_Status HAL_CRU_SetPllPowerUp(struct PLL_SETUP *pSetup);






HAL_Status HAL_CRU_SetPllPowerDown(struct PLL_SETUP *pSetup);






HAL_Check HAL_CRU_ClkIsEnabled(uint32_t clk);






HAL_Status HAL_CRU_ClkEnable(uint32_t clk);
# 278 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_ClkDisableUnused(uint32_t bank, uint32_t index, uint32_t val);






HAL_Status HAL_CRU_ClkDisable(uint32_t clk);






HAL_Check HAL_CRU_ClkIsReset(uint32_t clk);






HAL_Status HAL_CRU_ClkResetAssert(uint32_t clk);






HAL_Status HAL_CRU_ClkResetDeassert(uint32_t clk);







HAL_Status HAL_CRU_ClkResetSyncAssert(int numClks, uint32_t *clks);







HAL_Status HAL_CRU_ClkResetSyncDeassert(int numClks, uint32_t *clks);
# 331 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_ClkSetFracDiv(uint32_t fracDivName,
                                 uint32_t numerator,
                                 uint32_t denominator);
# 342 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_ClkGetFracDiv(uint32_t fracDivName,
                                 uint32_t *numerator,
                                 uint32_t *denominator);







HAL_Status HAL_CRU_ClkSetDiv(uint32_t divName, uint32_t divValue);






uint32_t HAL_CRU_ClkGetDiv(uint32_t divName);







HAL_Status HAL_CRU_ClkSetMux(uint32_t muxName, uint32_t muxValue);






uint32_t HAL_CRU_ClkGetMux(uint32_t muxName);
# 384 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_FracdivGetConfig(uint32_t rateOut, uint32_t rate,
                                    uint32_t *numerator,
                                    uint32_t *denominator);
# 396 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_FracdivGetConfigV2(uint32_t rateOut, uint32_t rate,
                                      uint32_t *numerator,
                                      uint32_t *denominator);






uint32_t HAL_CRU_ClkGetFreq(eCLOCK_Name clockName);
# 414 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_ClkSetFreq(eCLOCK_Name clockName, uint32_t rate);







HAL_Status HAL_CRU_VopDclkEnable(uint32_t gateId);







HAL_Status HAL_CRU_VopDclkDisable(uint32_t gateId);







HAL_Status HAL_CRU_PvtConfig(struct HAL_PVT_CFG *pvtCfg);
# 448 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_ClkNp5BestDiv(eCLOCK_Name clockName, uint32_t rate, uint32_t pRate, uint32_t *bestdiv);






HAL_Status HAL_CRU_SetGlbSrst(eCRU_GlbSrstType type);







HAL_Status HAL_CRU_WdtGlbRstEnable(eCRU_WdtRstType wdtType);
# 472 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_PllCompensation(eCLOCK_Name clockName, int ppm);
# 482 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
HAL_Status HAL_CRU_PllIoIn(eCLOCK_Name clockName, uint32_t ioRate, uint32_t rate);






HAL_Status HAL_CRU_Suspend(void);






HAL_Status HAL_CRU_Resume(void);
# 59 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 87 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_dma.h" 1
# 28 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_dma.h"
typedef enum {
    DMA_MEM_TO_MEM,
    DMA_MEM_TO_DEV,
    DMA_DEV_TO_MEM,
    DMA_DEV_TO_DEV,
    DMA_TRANS_NONE,
} eDMA_TRANSFER_DIRECTION;





typedef enum {
    DMA_SLAVE_BUSWIDTH_UNDEFINED = 0,
    DMA_SLAVE_BUSWIDTH_1_BYTE = 1,
    DMA_SLAVE_BUSWIDTH_2_BYTES = 2,
    DMA_SLAVE_BUSWIDTH_3_BYTES = 3,
    DMA_SLAVE_BUSWIDTH_4_BYTES = 4,
    DMA_SLAVE_BUSWIDTH_8_BYTES = 8,
    DMA_SLAVE_BUSWIDTH_16_BYTES = 16,
    DMA_SLAVE_BUSWIDTH_32_BYTES = 32,
    DMA_SLAVE_BUSWIDTH_64_BYTES = 64,
} eDMA_SLAVE_BUSWIDTH;




struct DMA_SLAVE_CONFIG {
    eDMA_TRANSFER_DIRECTION direction;
    eDMA_SLAVE_BUSWIDTH srcAddrWidth;


    eDMA_SLAVE_BUSWIDTH dstAddrWidth;
    uint32_t srcAddr;
    uint32_t dstAddr;
    uint16_t srcMaxBurst;





    uint16_t dstMaxBurst;
    uint16_t srcInterlaceSize;
    uint16_t dstInterlaceSize;
};




typedef void (*DMA_Callback)(void *cparam);





typedef uint32_t (*DMA_ToDmaAddrFunc)(uint32_t mem_addr);
# 92 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_dma.h"
static inline 
# 92 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_dma.h" 3 4
               _Bool 
# 92 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_dma.h"
                    HAL_DMA_IsSlaveDirection(eDMA_TRANSFER_DIRECTION direction)
{
    return (direction == DMA_MEM_TO_DEV) || (direction == DMA_DEV_TO_MEM);
}
# 88 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 125 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h" 1
# 20 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h" 1
# 27 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
typedef enum {
    IOFUNC_SEL_M0,
    IOFUNC_SEL_M1,
    IOFUNC_SEL_M2,
} eIOFUNC_SEL;

typedef enum {

    GPIO0_A0 = 0,
    GPIO0_A1,
    GPIO0_A2,
    GPIO0_A3,
    GPIO0_A4,
    GPIO0_A5,
    GPIO0_A6,
    GPIO0_A7,
    GPIO0_B0 = 8,
    GPIO0_B1,
    GPIO0_B2,
    GPIO0_B3,
    GPIO0_B4,
    GPIO0_B5,
    GPIO0_B6,
    GPIO0_B7,
    GPIO0_C0 = 16,
    GPIO0_C1,
    GPIO0_C2,
    GPIO0_C3,
    GPIO0_C4,
    GPIO0_C5,
    GPIO0_C6,
    GPIO0_C7,
    GPIO0_D0 = 24,
    GPIO0_D1,
    GPIO0_D2,
    GPIO0_D3,
    GPIO0_D4,
    GPIO0_D5,
    GPIO0_D6,
    GPIO0_D7,


    GPIO1_A0 = 32,
    GPIO1_A1,
    GPIO1_A2,
    GPIO1_A3,
    GPIO1_A4,
    GPIO1_A5,
    GPIO1_A6,
    GPIO1_A7,
    GPIO1_B0 = 40,
    GPIO1_B1,
    GPIO1_B2,
    GPIO1_B3,
    GPIO1_B4,
    GPIO1_B5,
    GPIO1_B6,
    GPIO1_B7,
    GPIO1_C0 = 48,
    GPIO1_C1,
    GPIO1_C2,
    GPIO1_C3,
    GPIO1_C4,
    GPIO1_C5,
    GPIO1_C6,
    GPIO1_C7,
    GPIO1_D0 = 56,
    GPIO1_D1,
    GPIO1_D2,
    GPIO1_D3,
    GPIO1_D4,
    GPIO1_D5,
    GPIO1_D6,
    GPIO1_D7,


    GPIO2_A0 = 64,
    GPIO2_A1,
    GPIO2_A2,
    GPIO2_A3,
    GPIO2_A4,
    GPIO2_A5,
    GPIO2_A6,
    GPIO2_A7,
    GPIO2_B0 = 72,
    GPIO2_B1,
    GPIO2_B2,
    GPIO2_B3,
    GPIO2_B4,
    GPIO2_B5,
    GPIO2_B6,
    GPIO2_B7,
    GPIO2_C0 = 80,
    GPIO2_C1,
    GPIO2_C2,
    GPIO2_C3,
    GPIO2_C4,
    GPIO2_C5,
    GPIO2_C6,
    GPIO2_C7,
    GPIO2_D0 = 88,
    GPIO2_D1,
    GPIO2_D2,
    GPIO2_D3,
    GPIO2_D4,
    GPIO2_D5,
    GPIO2_D6,
    GPIO2_D7,
# 884 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
    GPIO_NUM_MAX
} ePINCTRL_PIN;


typedef enum {
    PINCTRL_IOMUX_FUNC0,
    PINCTRL_IOMUX_FUNC1,
    PINCTRL_IOMUX_FUNC2,
    PINCTRL_IOMUX_FUNC3,
    PINCTRL_IOMUX_FUNC4,
    PINCTRL_IOMUX_FUNC5,
    PINCTRL_IOMUX_FUNC6,
    PINCTRL_IOMUX_FUNC7,
    PINCTRL_IOMUX_FUNC8,
    PINCTRL_IOMUX_FUNC9,
    PINCTRL_IOMUX_FUNC10,
    PINCTRL_IOMUX_FUNC11,
    PINCTRL_IOMUX_FUNC12,
    PINCTRL_IOMUX_FUNC13,
    PINCTRL_IOMUX_FUNC14,
    PINCTRL_IOMUX_FUNC15
} ePINCTRL_iomuxFunc;


typedef enum {
    PINCTRL_PULL_OD,
    PINCTRL_PULL_UP,
    PINCTRL_PULL_DOWN,
    PINCTRL_PULL_KEEP
} ePINCTRL_pullMode;


typedef enum {
    PINCTRL_DRIVE_LEVEL0,
    PINCTRL_DRIVE_LEVEL1,
    PINCTRL_DRIVE_LEVEL2,
    PINCTRL_DRIVE_LEVEL3,
    PINCTRL_DRIVE_LEVEL4,
    PINCTRL_DRIVE_LEVEL5,
    PINCTRL_DRIVE_LEVEL6,
    PINCTRL_DRIVE_LEVEL7
} ePINCTRL_driveLevel;


typedef enum {
    PINCTRL_SLEWRATE_SLOW,
    PINCTRL_SLEWRATE_FAST
} ePINCTRL_slewRate;


typedef enum {
    PINCTRL_SCHMITT_DIS,
    PINCTRL_SCHMITT_EN
} ePINCTRL_schmitt;
# 964 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
typedef enum {
    PIN_CONFIG_MUX_FUNC0 = (0x0 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC1 = (0x1 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC2 = (0x2 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC3 = (0x3 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC4 = (0x4 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC5 = (0x5 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC6 = (0x6 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC7 = (0x7 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC8 = (0x8 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC9 = (0x9 << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC10 = (0xa << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC11 = (0xb << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC12 = (0xc << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC13 = (0xd << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC14 = (0xe << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_FUNC15 = (0xf << (0) | (1UL << (31))),
    PIN_CONFIG_MUX_DEFAULT = PIN_CONFIG_MUX_FUNC0,
# 996 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
    PIN_CONFIG_PUL_NORMAL = (0x0 << (4) | (1UL << (30))),
    PIN_CONFIG_PUL_UP = (0x1 << (4) | (1UL << (30))),
    PIN_CONFIG_PUL_DOWN = (0x2 << (4) | (1UL << (30))),
    PIN_CONFIG_PUL_KEEP = (0x3 << (4) | (1UL << (30))),
    PIN_CONFIG_PUL_DEFAULT = PIN_CONFIG_PUL_NORMAL,



    PIN_CONFIG_DRV_LEVEL0 = (0x1 << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL1 = (0x3 << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL2 = (0x7 << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL3 = (0xf << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL4 = (0x1f << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL5 = (0x3f << (8) | (1UL << (29))),
    PIN_CONFIG_DRV_LEVEL_DEFAULT = PIN_CONFIG_DRV_LEVEL2,
# 1038 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
    PIN_CONFIG_SRT_SLOW = (0x0 << (16) | (1UL << (28))),
    PIN_CONFIG_SRT_FAST = (0x3 << (16) | (1UL << (28))),
    PIN_CONFIG_SRT_DEFAULT = PIN_CONFIG_SRT_FAST,
# 1059 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
    PIN_CONFIG_SMT_DISABLE = (0x0 << (18) | (1UL << (27))),
    PIN_CONFIG_SMT_ENABLE = (0x1 << (18) | (1UL << (27))),
    PIN_CONFIG_SMT_DEFAULT = PIN_CONFIG_SMT_DISABLE,


    PIN_CONFIG_MAX = 0xFFFFFFFFU,
} ePINCTRL_configParam;

typedef enum {
    GRF_MUX_INFO = 0,
    GRF_PUL_INFO,
    GRF_DRV_INFO,
    GRF_SRT_INFO,
    GRF_SMT_INFO,
    GRF_INFO_NUM
} ePIN_GRF_INFO_ID;
# 1096 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
typedef enum {
    GPIO_PIN_A0 = 0x00000001U,
    GPIO_PIN_A1 = 0x00000002U,
    GPIO_PIN_A2 = 0x00000004U,
    GPIO_PIN_A3 = 0x00000008U,
    GPIO_PIN_A4 = 0x00000010U,
    GPIO_PIN_A5 = 0x00000020U,
    GPIO_PIN_A6 = 0x00000040U,
    GPIO_PIN_A7 = 0x00000080U,
    GPIO_PIN_B0 = 0x00000100U,
    GPIO_PIN_B1 = 0x00000200U,
    GPIO_PIN_B2 = 0x00000400U,
    GPIO_PIN_B3 = 0x00000800U,
    GPIO_PIN_B4 = 0x00001000U,
    GPIO_PIN_B5 = 0x00002000U,
    GPIO_PIN_B6 = 0x00004000U,
    GPIO_PIN_B7 = 0x00008000U,
    GPIO_PIN_C0 = 0x00010000U,
    GPIO_PIN_C1 = 0x00020000U,
    GPIO_PIN_C2 = 0x00040000U,
    GPIO_PIN_C3 = 0x00080000U,
    GPIO_PIN_C4 = 0x00100000U,
    GPIO_PIN_C5 = 0x00200000U,
    GPIO_PIN_C6 = 0x00400000U,
    GPIO_PIN_C7 = 0x00800000U,
    GPIO_PIN_D0 = 0x01000000U,
    GPIO_PIN_D1 = 0x02000000U,
    GPIO_PIN_D2 = 0x04000000U,
    GPIO_PIN_D3 = 0x08000000U,
    GPIO_PIN_D4 = 0x10000000U,
    GPIO_PIN_D5 = 0x20000000U,
    GPIO_PIN_D6 = 0x40000000U,
    GPIO_PIN_D7 = 0x80000000U,
} ePINCTRL_GPIO_PINS;
# 1139 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
struct PINCTRL_GRF_INFO {
    uint16_t offset;
    uint8_t bitsPerPin;
    uint8_t pinsPerReg;
};

struct PINCTRL_MUX_RECAL_DATA {
    uint32_t reg;
    uint8_t bank;
    uint8_t pin;
    uint8_t bit;
    uint8_t mask;
};

struct PINCTRL_MUX_ROUTE_DATA {
    uint32_t routeReg;
    uint32_t routeVal;
    uint32_t pin;
    uint8_t bank;
    uint8_t func;
};

struct PINCTRL_BANK_INFO {
    struct PINCTRL_GRF_INFO GRFInfo[GRF_INFO_NUM];
    uint32_t grfBase;
    uint8_t pinCount;
    uint8_t channel;
};

struct HAL_PINCTRL_DEV {
    const struct PINCTRL_BANK_INFO *banks;
    const struct PINCTRL_MUX_RECAL_DATA *muxRecalData;
    const struct PINCTRL_MUX_ROUTE_DATA *muxRouteData;
    uint8_t banksNum;
    uint8_t muxRecalDataNum;
    uint8_t muxRouteDataNum;
};






extern const struct HAL_PINCTRL_DEV g_pinDev;
# 1191 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
HAL_Status HAL_PINCTRL_Suspend(void);
HAL_Status HAL_PINCTRL_Resume(void);

HAL_Status HAL_PINCTRL_Init(void);
HAL_Status HAL_PINCTRL_DeInit(void);

HAL_Status HAL_PINCTRL_SetParam(eGPIO_bankId bank, uint32_t mPins, ePINCTRL_configParam param);
HAL_Status HAL_PINCTRL_SetIOMUX(eGPIO_bankId bank, uint32_t mPins, ePINCTRL_configParam param);




HAL_Status HAL_PINCTRL_IOFuncSelForCIF(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForEMMC(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForFLASH(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForFSPI(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForLCDC(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForMIPICSI(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForRGMII(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForGMAC0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForGMAC1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSDIO(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSDMMC0(eIOFUNC_SEL mode);

HAL_Status HAL_PINCTRL_IOFuncSelForCAN0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForCAN1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForCAN2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForCAN3(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForCAN4(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForCAN5(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C3(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C4(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2C5(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2S0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2S1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForI2S2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM3(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM4(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM5(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM6(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM7(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM8(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM9(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM10(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForPWM11(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI3(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI4(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForSPI5(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART0(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART1(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART2(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART3(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART4(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART5(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART6(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART7(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART8(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART9(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART10(eIOFUNC_SEL mode);
HAL_Status HAL_PINCTRL_IOFuncSelForUART11(eIOFUNC_SEL mode);
# 21 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h" 2
# 42 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h"
typedef enum {
    GPIO_LOW,
    GPIO_HIGH
} eGPIO_pinLevel;


typedef enum {
    GPIO_IN,
    GPIO_OUT
} eGPIO_pinDirection;


typedef enum {
    GPIO_DEBOUNCE_DIS,
    GPIO_DEBOUNCE_EN
} eGPIO_pinDebounce;


typedef enum {
    GPIO_INT_DISABLE,
    GPIO_INT_ENABLE
} eGPIO_intEnable;


typedef enum {
    GPIO_INT_TYPE_NONE = 0x00000000,
    GPIO_INT_TYPE_EDGE_RISING = 0x00000001,
    GPIO_INT_TYPE_EDGE_FALLING = 0x00000002,
    GPIO_INT_TYPE_EDGE_BOTH = (GPIO_INT_TYPE_EDGE_FALLING | GPIO_INT_TYPE_EDGE_RISING),
    GPIO_INT_TYPE_LEVEL_HIGH = 0x00000004,
    GPIO_INT_TYPE_LEVEL_LOW = 0x00000008,
    GPIO_INT_TYPE_LEVEL_MASK = (GPIO_INT_TYPE_LEVEL_LOW | GPIO_INT_TYPE_LEVEL_HIGH),
    GPIO_INT_TYPE_SENSE_MASK = 0x0000000f,
    GPIO_INT_TYPE_DEFAULT = GPIO_INT_TYPE_SENSE_MASK,
} eGPIO_intType;


typedef enum {
    GPIO_INT_MODE_EDGE_RISING,
    GPIO_INT_MODE_EDGE_FALLING,
    GPIO_INT_MODE_EDGE_RISING_FALLING,
    GPIO_INT_MODE_LEVEL_HIGH,
    GPIO_INT_MODE_LEVEL_LOW,
    GPIO_INT_MODE_INVALID
} eGPIO_intMode;


typedef enum {
    GPIO_VIRTUAL_MODEL_OS_A,
    GPIO_VIRTUAL_MODEL_OS_B,
    GPIO_VIRTUAL_MODEL_OS_C,
    GPIO_VIRTUAL_MODEL_OS_D,
} eGPIO_VirtualModel;
# 140 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h"
eGPIO_pinDirection HAL_GPIO_GetPinDirection(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin);
eGPIO_pinLevel HAL_GPIO_GetPinLevel(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin);
eGPIO_pinLevel HAL_GPIO_GetPinData(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin);
uint32_t HAL_GPIO_GetBankLevel(struct GPIO_REG *pGPIO);

HAL_Status HAL_GPIO_SetPinLevel(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin, eGPIO_pinLevel level);
HAL_Status HAL_GPIO_SetPinDirection(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin, eGPIO_pinDirection direction);
HAL_Status HAL_GPIO_SetIntType(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin, eGPIO_intType mode);

HAL_Status HAL_GPIO_SetPinsLevel(struct GPIO_REG *pGPIO, uint32_t mPins, eGPIO_pinLevel level);
HAL_Status HAL_GPIO_SetPinsDirection(struct GPIO_REG *pGPIO, uint32_t mPins, eGPIO_pinDirection direction);

void HAL_GPIO_EnableIRQ(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin);
void HAL_GPIO_DisableIRQ(struct GPIO_REG *pGPIO, ePINCTRL_GPIO_PINS pin);
void HAL_GPIO_IRQHandler(struct GPIO_REG *pGPIO, eGPIO_bankId bank);
# 163 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h"
void HAL_GPIO_IRQDispatch(eGPIO_bankId bank, uint32_t pin);
# 126 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 154 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h" 1
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h" 1
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h" 2
# 47 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
typedef enum {
    REG_CON_MOD_TX = 0,
    REG_CON_MOD_REGISTER_TX,
    REG_CON_MOD_RX,
    REG_CON_MOD_REGISTER_RX
} eI2C_Mode;




typedef enum {
    I2C_100K = 0,
    I2C_400K,
    I2C_1000K
} eI2C_BusSpeed;




typedef enum {
    I2C_POLL = 0,
    I2C_IT
} eI2C_TransferType;




typedef enum {
    STATE_IDLE = 0,
    STATE_START,
    STATE_READ,
    STATE_WRITE,
    STATE_STOP
} eI2C_State;




struct HAL_I2C_DEV {
    struct I2C_REG *pReg;
    eCLOCK_Name clkID;
    uint32_t clkGateID;
    uint32_t pclkGateID;
    IRQn_Type irqNum;
    ePM_RUNTIME_ID runtimeID;
};




struct I2C_MSG {
    uint16_t addr;
    uint16_t flags;
    uint16_t len;
    uint8_t *buf;
};





struct I2C_HANDLE {
    struct I2C_REG *pReg;
    eI2C_Mode mode;
    eI2C_TransferType type;
    eI2C_BusSpeed speed;
    struct I2C_MSG msg;
    eI2C_State state;
    uint32_t cfg;
    uint32_t processed;
    HAL_Status error;
    
# 118 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h" 3 4
   _Bool 
# 118 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
        isLastMSG;
};
# 128 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
HAL_Status HAL_I2C_AdaptDIV(struct I2C_HANDLE *pI2C, uint32_t rate);
HAL_Status HAL_I2C_IRQHandler(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_ConfigureMode(struct I2C_HANDLE *pI2C, eI2C_Mode mode,
                                 uint32_t addr, uint32_t regAddr);
HAL_Status HAL_I2C_SetupMsg(struct I2C_HANDLE *pI2C, uint16_t addr, uint8_t *buf,
                            uint16_t len, uint16_t flags);
HAL_Status HAL_I2C_Transfer(struct I2C_HANDLE *pI2C, eI2C_TransferType type, 
# 134 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h" 3 4
                                                                            _Bool 
# 134 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
                                                                                 last);
HAL_Status HAL_I2C_ForceStop(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_Close(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_WriteFinish(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_StopFinish(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_StartTX(struct I2C_HANDLE *pI2C, uint16_t addr,
                           uint8_t *buf, uint16_t len);
HAL_Status HAL_I2C_StartTXU32(struct I2C_HANDLE *pI2C, uint32_t *buf,
                              uint16_t len32, uint16_t len8);
HAL_Status HAL_I2C_StopTX(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_CloseTX(struct I2C_HANDLE *pI2C);
HAL_Status HAL_I2C_Init(struct I2C_HANDLE *pI2C, struct I2C_REG *pReg, uint32_t rate,
                        eI2C_BusSpeed speed);
HAL_Status HAL_I2C_DeInit(struct I2C_HANDLE *pI2C);
# 155 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 186 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_mbox.h" 1
# 41 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_mbox.h"
typedef enum {
    MBOX_CH_0 = 0,
    MBOX_CH_1,
    MBOX_CH_2,
    MBOX_CH_3,
    MBOX_CH_MAX = 1
} eMBOX_CH;




struct MBOX_CMD_DAT {
    volatile uint32_t CMD;
    volatile uint32_t DATA;
};


struct MBOX_CLIENT {
    char name[16];
    int irq;
    void (*RXCallback)(struct MBOX_CMD_DAT *msg, void *cbData);
    void *callbackData;
};
# 72 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_mbox.h"
HAL_Status HAL_MBOX_IrqHandler(int irq, struct MBOX_REG *pReg);
HAL_Status HAL_MBOX_Init(struct MBOX_REG *pReg, uint8_t isA2B);
HAL_Status HAL_MBOX_DeInit(struct MBOX_REG *pReg);
HAL_Status HAL_MBOX_RecvMsg(struct MBOX_REG *pReg, eMBOX_CH chan);
HAL_Status HAL_MBOX_SendMsg(struct MBOX_REG *pReg, eMBOX_CH chan,
                            const struct MBOX_CMD_DAT *msg);
HAL_Status HAL_MBOX_SendMsg2(struct MBOX_REG *pReg, eMBOX_CH chan,
                             const struct MBOX_CMD_DAT *msg, uint8_t isA2B);
HAL_Status HAL_MBOX_RegisterClient(struct MBOX_REG *pReg, eMBOX_CH chan,
                                   const struct MBOX_CLIENT *cl);
HAL_Status HAL_MBOX_UnregisterClient(struct MBOX_REG *pReg, eMBOX_CH chan,
                                     const struct MBOX_CLIENT *cl);
HAL_Status HAL_MBOX_Suspend(struct MBOX_REG *pReg);
HAL_Status HAL_MBOX_Resume(struct MBOX_REG *pReg);
# 187 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 212 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h" 1
# 213 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 228 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 1
# 52 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
typedef enum {
    HAL_PWM_ONE_SHOT = 0,
    HAL_PWM_CONTINUOUS,
    HAL_PWM_CAPTURE,
} ePWM_Mode;




typedef enum {
    HAL_PWM_CAP_LPR_INT = 1,
    HAL_PWM_CAP_HPR_INT,
} ePWM_captureIntMode;




typedef enum {
    HAL_PWM_LEFT_ALIGNED = 1,
    HAL_PWM_CENTER_ALIGNED,
    HAL_PWM_UNALIGNED,
} ePWM_alignedMode;




typedef enum {
    HAL_PWM_WAVE_TABLE_8BITS_WIDTH,
    HAL_PWM_WAVE_TABLE_16BITS_WIDTH,
} ePWM_waveTableWidthMode;




typedef enum {




    HAL_PWM_WAVE_INCREASING,




    HAL_PWM_WAVE_INCREASING_THEN_DECREASING,
} ePWM_waveUpdateMode;




struct HAL_PWM_DEV {
    struct PWM_REG *pReg;
    eCLOCK_Name clkID;
    uint32_t clkGateID;
    uint32_t pclkGateID;
    IRQn_Type irqNum[(8)];
};




struct HAL_PWM_CONFIG {
    uint8_t channel;
    uint32_t periodNS;
    uint32_t dutyNS;
    
# 117 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 117 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        polarity;
    ePWM_alignedMode alignedMode;
};




struct PWM_CAPTURE {
    uint32_t period;
    uint32_t posCycles;
    uint32_t negCycles;
    
# 128 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 128 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        pol;
    
# 129 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 129 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        active;
};




struct PWM_MATCH {
    uint32_t match[(16)];
    uint8_t matchCount;
    uint16_t lpreMin;
    uint16_t lpreMax;
    uint16_t hpreMin;
    uint16_t hpreMax;
    uint16_t ldMin;
    uint16_t ldMax;
    uint16_t hdZeroMin;
    uint16_t hdZeroMax;
    uint16_t hdOneMin;
    uint16_t hdOneMax;
};





struct PWM_CHANNEL_HANDLE {
    struct PWM_REG *pReg;
    struct PWM_CAPTURE result;
    ePWM_Mode mode;
};




struct PWM_HANDLE {
    struct PWM_CHANNEL_HANDLE pChHandle[(8)];
    uint32_t freq;
    uint32_t channelNum;
    uint32_t scaler;
    uint8_t globalGrantMask;
    uint8_t globalMask;
    
# 170 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 170 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        freqMeterSupport;
    
# 171 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 171 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        counterSupport;
    
# 172 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 172 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        waveSupport;
};
# 192 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
struct PWM_WAVE_TABLE {
    uint16_t offset;
    uint16_t len;
    uint64_t *data;
};
# 219 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
struct PWM_WAVE_CONFIG {
    struct PWM_WAVE_TABLE *dutyTable;
    struct PWM_WAVE_TABLE *periodTable;
    
# 222 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 222 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        enable;
    
# 223 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 223 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        dutyEnable;
    
# 224 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h" 3 4
   _Bool 
# 224 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
        periodEnable;
    uint16_t rpt;
    uint32_t widthMode;
    uint32_t updateMode;
    uint32_t dutyMax;
    uint32_t dutyMin;
    uint32_t periodMax;
    uint32_t periodMin;
    uint32_t offset;
    uint32_t middle;
    uint32_t maxHold;
    uint32_t minHold;
    uint32_t middleHold;
    uint64_t clkRate;
};
# 249 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
HAL_Status HAL_PWM_IRQHandler(struct PWM_HANDLE *pPWM);
HAL_Status HAL_PWM_ChannelIRQHandler(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_SetConfig(struct PWM_HANDLE *pPWM, uint8_t channel,
                             const struct HAL_PWM_CONFIG *config);
HAL_Status HAL_PWM_SetOneshot(struct PWM_HANDLE *pPWM, uint8_t channel, uint32_t count);
HAL_Status HAL_PWM_SetCapturedFreq(struct PWM_HANDLE *pPWM, uint8_t channel, uint32_t freq);
HAL_Status HAL_PWM_SetMatch(struct PWM_HANDLE *pPWM, uint8_t channel, const struct PWM_MATCH *data);
uint64_t HAL_PWM_GetCaptureHighNs(struct PWM_HANDLE *pPWM, uint8_t channel);
uint64_t HAL_PWM_GetCaptureLowNs(struct PWM_HANDLE *pPWM, uint8_t channel);

HAL_Status HAL_PWM_SetOutputOffset(struct PWM_HANDLE *pPWM, uint8_t channel, uint32_t offsetNS);







HAL_Status HAL_PWM_GlobalLock(struct PWM_HANDLE *pPWM, uint8_t channelMask);
HAL_Status HAL_PWM_GlobalUnlock(struct PWM_HANDLE *pPWM, uint8_t channelMask);
# 280 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
HAL_Status HAL_PWM_EnableCounter(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_DisableCounter(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_ClearCounterRes(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_GetCounterRes(struct PWM_HANDLE *pPWM, uint8_t channel, uint64_t *cntRes);
# 302 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
ePWM_Mode HAL_PWM_GetMode(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_Enable(struct PWM_HANDLE *pPWM, uint8_t channel, ePWM_Mode mode);
HAL_Status HAL_PWM_Disable(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_Init(struct PWM_HANDLE *pPWM, struct PWM_REG *pReg, uint32_t freq);
HAL_Status HAL_PWM_DeInit(struct PWM_HANDLE *pPWM);

HAL_Status HAL_PWM_EnableCaptureInt(struct PWM_HANDLE *pPWM, uint8_t channel, ePWM_captureIntMode mode);
HAL_Status HAL_PWM_DisableCaptureInt(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_GlobalUpdate(struct PWM_HANDLE *pPWM);
HAL_Status HAL_PWM_GlobalEnable(struct PWM_HANDLE *pPWM);
HAL_Status HAL_PWM_GlobalDisable(struct PWM_HANDLE *pPWM);
HAL_Status HAL_PWM_EnableFreqMeter(struct PWM_HANDLE *pPWM, uint8_t channel, uint32_t delayMs);
HAL_Status HAL_PWM_DisableFreqMeter(struct PWM_HANDLE *pPWM, uint8_t channel);
HAL_Status HAL_PWM_GetFreqMeterRes(struct PWM_HANDLE *pPWM, uint8_t channel, uint32_t delayMs, uint32_t *freqHz);





inline HAL_Status HAL_PWM_SetWaveTable(struct PWM_HANDLE *pPWM, uint8_t channel, struct PWM_WAVE_TABLE *table,
                                       ePWM_waveTableWidthMode widthMode, uint64_t clkRate)
{
    return HAL_OK;
}
inline HAL_Status HAL_PWM_SetWave(struct PWM_HANDLE *pPWM, uint8_t channel, struct PWM_WAVE_CONFIG *config)
{
    return HAL_OK;
}
# 229 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2


# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h" 1
# 27 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
typedef enum {
    PWR_ID_NULL = 0,
    PWR_ID_CORE,
    PWR_ID_LOG,
    PWR_ID_DSP_CORE,
    PWR_ID_VCC_MIPI,
    PWR_ID_VCC_AUDIO,
    PWR_ID_DSP_VCC_MIPI,
    PWR_ID_MEMORY,
    PWR_ID_TOP,
    PWR_ID_BUCK_1V8,
    PWR_ID_VCCIO_3V3,
    PWR_ID_VDD_1V1,
    PWR_ID_VCCIO_1V8,
    PWR_ID_VCCIO_1V8_PMU,
    PWR_ID_VCC_3V0_BL,
    PWR_ID_VCC_1V8_BUCK,
    PWR_ID_VCC_1V8_LDO,
    PWR_ID_VCC33_CODEC,
    PWR_ID_VCC33_AUDIO,
    PWR_ID_VCC1,
    PWR_ID_VLDO3,
    PWR_ID_VLDO6,
    PWR_ID_MAX,
} ePWR_ID;

typedef enum {
    PWR_CTRL_VOLT_RUN = 0,
    PWR_CTRL_VOLT_SSPD,
    PWR_CTRL_PWR_EN,
    PWR_CTRL_PWR_SSPD,
    PWR_CTRL_VOLT_ST,
    PWR_CTRL_MAX
} ePWR_CtrlType;
# 107 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
struct PWR_LINEAR_RANGE {
    unsigned int minUV;
    unsigned int minSel;
    unsigned int maxSel;
    unsigned int uVStep;
};

struct PWR_LINEAR_RANGE_TABLE {
    int nEntry;
    struct PWR_LINEAR_RANGE *entry;
};

union U_PWR_VOLT_LIST {
    int stepVolt;
    const uint32_t *voltTable;
    struct PWR_LINEAR_RANGE_TABLE linearTables;
};

struct PWR_CTRL_INFO {
    uint16_t pwrId : 8;
    uint16_t enCnt : 4;
};

struct PWR_INTREG_DESC {
    struct PWR_CTRL_INFO info;
    uint16_t flag;
    uint8_t voltMask;
    uint8_t voltCnt;
    volatile uint32_t *preg[PWR_CTRL_MAX];
    uint8_t shift[PWR_CTRL_MAX];
    uint32_t minVolt;
    union U_PWR_VOLT_LIST volt_list;
};
# 161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
int HAL_PWR_LinearRangeSelToVolt(const struct PWR_LINEAR_RANGE_TABLE *linearTables, uint32_t sel);
int HAL_PWR_LinearRangeVoltToSel(const struct PWR_LINEAR_RANGE_TABLE *linearTables, uint32_t volt);
# 232 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 247 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_saradc.h" 1
# 29 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_saradc.h"
typedef enum {
    SARADC_INT_MOD,
    SARADC_POL_MOD,
} eSARADC_mode;







HAL_Status HAL_SARADC_Start(struct SARADC_REG *reg, eSARADC_mode mode, uint32_t chn);
HAL_Status HAL_SARADC_Stop(struct SARADC_REG *reg);
uint32_t HAL_SARADC_GetRaw(struct SARADC_REG *reg, uint32_t chn);
HAL_Check HAL_SARADC_PollIsEOC(struct SARADC_REG *reg, uint32_t chn);
void HAL_SARADC_IrqHandler(struct SARADC_REG *reg);
void HAL_SARADC_ClearIrq(struct SARADC_REG *reg);
void HAL_SARADC_SetHighThreshold(struct SARADC_REG *reg, uint32_t chn, uint32_t val);
void HAL_SARADC_EnableHighThresholdIrq(struct SARADC_REG *reg, uint32_t chn);
void HAL_SARADC_ClearHighThresholdIrq(struct SARADC_REG *reg, uint32_t chn);
# 248 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 299 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_timer.h" 1
# 29 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_timer.h"
typedef enum {
    TIMER_FREE_RUNNING = 0,
    TIMER_USER_DEFINED,
    TIMER_MODE_MAX
} eTIMER_MODE;
# 43 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_timer.h"
HAL_Status HAL_TIMER_Stop(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_Start(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_Stop_IT(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_Start_IT(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_SetCount(struct TIMER_REG *pReg, uint64_t usTick);
uint64_t HAL_TIMER_GetCount(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER0_Handler(void);
HAL_Status HAL_TIMER1_Handler(void);
HAL_Status HAL_TIMER_Init(struct TIMER_REG *pReg, eTIMER_MODE mode);
HAL_Status HAL_TIMER_SysTimerInit(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_DeInit(struct TIMER_REG *pReg);
HAL_Status HAL_TIMER_ClrInt(struct TIMER_REG *pReg);
# 300 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_driver.h" 2
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h" 2
# 39 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
typedef enum {
    HAL_TICK_FREQ_10HZ = 100U,
    HAL_TICK_FREQ_100HZ = 10U,
    HAL_TICK_FREQ_1KHZ = 1U,
    HAL_TICK_FREQ_DEFAULT = HAL_TICK_FREQ_1KHZ
} eHAL_tickFreq;
# 53 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
HAL_Status HAL_Init(void);
HAL_Status HAL_DeInit(void);
HAL_Status HAL_InitTick(uint32_t tickPriority);
HAL_Status HAL_IncTick(void);
uint32_t HAL_GetTick(void);
HAL_Status HAL_SetTickFreq(eHAL_tickFreq freq);
eHAL_tickFreq HAL_GetTickFreq(void);

HAL_Status HAL_DelayUs(uint32_t us);
HAL_Status HAL_DelayMs(uint32_t ms);
HAL_Status HAL_CPUDelayUs(uint32_t us);
HAL_Status HAL_SystemCoreClockUpdate(uint32_t hz, eHAL_systickClkSource clkSource);

uint64_t HAL_DivU64Rem(uint64_t numerator, uint32_t denominator, uint32_t *pRemainder);
uint64_t HAL_GetSysTimerCount(void);

void HAL_CPU_EnterIdle(void);
# 87 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
static inline uint64_t HAL_DivU64(uint64_t numerator, uint32_t denominator)
{
    return HAL_DivU64Rem(numerator, denominator, 
# 89 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h" 3 4
                                                ((void *)0)
# 89 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
                                                    );
}







static inline uint32_t HAL_DivRoundClosest(uint32_t numerator, uint32_t denominator)
{
    return (numerator + (denominator / 2)) / denominator;
}
# 44 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h" 1
# 32 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h"
struct clk_gate
{
    uint32_t gate_id;
    int enable_count;
    int ref_count;
    rt_slist_t node;
};

struct clk_init
{
    const char *name;
    uint32_t clk_id;
    uint32_t init_rate;
};

struct clk_unused
{
    uint32_t bank;
    uint32_t gate_con;
    uint32_t gate_val;
};

struct pd
{
    uint32_t pd_id;
    int enable_count;
    int ref_count;
    rt_slist_t node;
};







static inline rt_err_t clk_enable_by_id(int gate_id)
{

    return (HAL_CRU_ClkEnable(gate_id) == HAL_OK) ? 0 : -1;



}







static inline rt_err_t clk_disable_by_id(int gate_id)
{

    return (HAL_CRU_ClkDisable(gate_id) == HAL_OK) ? 0 : -1;



}

struct clk_gate *get_clk_gate_from_id(int gate_id);
void put_clk_gate(struct clk_gate *gate);
rt_err_t clk_enable(struct clk_gate *gate);
rt_err_t clk_disable(struct clk_gate *gate);
int clk_is_enabled(struct clk_gate *gate);
uint32_t clk_get_rate(eCLOCK_Name clk_id);
rt_err_t clk_set_rate(eCLOCK_Name clk_id, uint32_t rate);






void clk_init(const struct clk_init *clk_inits, 
# 105 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h" 3 4
                                               _Bool 
# 105 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h"
                                                    clk_dump);
void clk_disable_unused(const struct clk_unused *clks_unused);
# 46 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2

# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h" 1
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h" 1
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h" 1
# 25 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h" 2

extern struct pwr_i2c_desc pmic_pwr_i2c_desc;


struct pwr_i2c_desc
{
    struct rt_i2c_bus_device *bus;
    char *name;
    rt_uint8_t addr;
};

struct pwr_i2cbus_desc
{
    struct PWR_CTRL_INFO info;
    uint16_t flag;
    uint8_t voltMask;
    uint8_t voltCnt;
    struct pwr_i2c_desc *i2c;
    uint8_t shift[PWR_CTRL_MAX];
    uint8_t reg[PWR_CTRL_MAX];
    uint32_t minVolt;
    union U_PWR_VOLT_LIST volt_list;
};
# 88 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h"
typedef enum
{
    RK817_ID_DCDC1 = 0,
    RK817_ID_DCDC2,
    RK817_ID_DCDC3,
    RK817_ID_DCDC4,
    RK817_ID_LDO1,
    RK817_ID_LDO2,
    RK817_ID_LDO3,
    RK817_ID_LDO4,
    RK817_ID_LDO5,
    RK817_ID_LDO6,
    RK817_ID_LDO7,
    RK817_ID_LDO8,
    RK817_ID_LDO9,
    RK817_NUM_REGULATORS
} ePMIC_RK817Id;
# 169 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h"
typedef enum
{
    RK816_ID_DCDC1,
    RK816_ID_DCDC2,
    RK816_ID_DCDC3,
    RK816_ID_DCDC4,
    RK816_ID_LDO1,
    RK816_ID_LDO2,
    RK816_ID_LDO3,
    RK816_ID_LDO4,
    RK816_ID_LDO5,
    RK816_ID_LDO6,
    RK816_NUM_REGULATORS
} ePMIC_RK816Id;
# 247 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h"
typedef enum
{
    PMIC_SLEEP_ACTIVE_LOW = 0U,
    PMIC_SLEEP_ACTIVE_HIGH,
} ePMIC_SleepPinPolarity;

typedef enum
{
    PMIC_SLEEP_NO_EFFECT = 0U,
    PMIC_SLEEP_SLEEP_FUNC,
    PMIC_SLEEP_SHUTDOWN_FUNC,
    PMIC_SLEEP_RESTART_FUNC,
} ePMIC_SleepPinFunc;
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm_regulator.h" 1
# 27 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm_regulator.h"
struct pwr_pwm_info_desc
{
    char *name;
    uint32_t chanel;
    
# 31 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm_regulator.h" 3 4
   _Bool 
# 31 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm_regulator.h"
        invert;
};

struct pwr_pwm_desc
{
    struct PWR_CTRL_INFO info;
    uint16_t flag;
    uint16_t pwrId;
    uint32_t period;
    uint32_t minVolt;
    uint32_t maxVlot;
    uint32_t voltage;
    struct pwr_pwm_info_desc *pwm;
};
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h" 2

typedef rt_mutex_t regulator_mutex_t;
# 36 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h"
union U_PWR_REG_DESC
{
    struct PWR_INTREG_DESC intreg_desc;
    struct pwr_i2cbus_desc i2c_desc;
    struct pwr_pwm_desc pwm_desc;
};

struct regulator_desc
{
    uint8_t flag;
    union U_PWR_REG_DESC desc;
    regulator_mutex_t lock;
    uint16_t setup_fixed;
    uint16_t setup_step;
    uint32_t currentVolt;
};

struct regulator_init
{
    const char *name;
    ePWR_ID pwrId;
    uint32_t init_voltage;
    uint32_t suspend_voltage;
    uint8_t enable : 4;
    uint8_t suspend_enable : 4;
};
# 48 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.h" 1
# 73 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.h"
struct dvfs_table
{
    uint32_t freq;
    uint32_t volt;
};

struct req_val_ctrl
{
    struct
    {
        uint8_t ttl_req: 3;
    } info;
    uint8_t max_val_id;
    uint8_t req_bits;
    uint32_t *req_vals;



};

struct req_pwr_desc
{
    uint8_t pwr_id;
    struct regulator_desc *desc;
    struct req_val_ctrl req_ctrl;
};

struct req_clk_desc
{
    eCLOCK_Name clk_id;
    struct req_val_ctrl req_ctrl;
};

struct rk_dvfs_desc
{

    eCLOCK_Name clk_id;

    uint8_t pwr_id;
    struct regulator_desc *pwr_desc;
    uint8_t tbl_idx;
    uint8_t tbl_cnt;
    const struct dvfs_table *table;
# 124 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.h"
};

void regulator_req_init(void);
void regulator_req_desc_init(struct req_pwr_desc *desc_arr);
struct req_pwr_desc *regulator_get_req_volt_id(ePWR_ID pwrid, uint8_t *req_id);
rt_err_t regulator_req_set_voltage(struct req_pwr_desc *req_pwr, uint8_t req_id,
                                   uint32_t volt);
uint32_t regulator_req_get_voltage(struct req_pwr_desc *req_pwr);
uint32_t regulator_req_get_max_voltage(struct req_pwr_desc *req_pwr);
uint32_t regulator_req_get_set_voltage(struct req_pwr_desc *req_pwr, uint8_t req_id);
rt_err_t regulator_req_voltage_release(struct req_pwr_desc *req_pwr, uint8_t req_id);
rt_err_t regulator_req_release(struct req_pwr_desc *req_pwr, uint8_t req_id);

void clk_req_desc_init(struct req_clk_desc *desc_array);
void clk_req_init(void);

struct req_clk_desc *clk_get_req_rate_id(eCLOCK_Name clk_id, uint8_t *req_id);
rt_err_t clk_req_set_rate(struct req_clk_desc *req_clk, uint8_t req_id, uint32_t rate);
uint32_t clk_req_get_rate(struct req_clk_desc *req_clk);
uint32_t clk_req_get_max_rate(struct req_clk_desc *req_clk);
uint32_t clk_req_get_set_rate(struct req_clk_desc *req_clk, uint8_t req_id);
rt_err_t clk_req_rate_release(struct req_clk_desc *req_clk, uint8_t req_id);
rt_err_t clk_req_release(struct req_clk_desc *req_clk, uint8_t req_id);

rt_err_t dvfs_set_rate(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id, uint32_t rate);
rt_err_t dvfs_set_rate_by_idx(struct rk_dvfs_desc *dvfs_desc,
                              uint8_t tbl_idx, uint8_t dvfs_clk_req_id);
struct rk_dvfs_desc *dvfs_get_by_clk(eCLOCK_Name clk_id, uint8_t *dvfs_clk_req_id);
uint32_t dvfs_req_get_rate(struct rk_dvfs_desc *dvfs_desc);
uint32_t dvfs_req_get_max_rate(struct rk_dvfs_desc *dvfs_desc);
uint32_t dvfs_req_get_set_rate(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id);
void rk_dvfs_req_rate_release(struct rk_dvfs_desc *dvfs_desc,
                              uint8_t dvfs_clk_req_id);
void rk_dvfs_req_release(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id);
void dvfs_desc_init(struct rk_dvfs_desc *dvfs_array);
void dvfs_init(void);
# 49 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 2





struct rk_req_clk_volt_ctrl
{
# 68 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
};
# 1154 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
void regulator_req_init(void)
{
    return;
}

void regulator_req_desc_init(struct req_pwr_desc *desc_array)
{
    return;
}

struct req_pwr_desc *regulator_get_req_volt_id(ePWR_ID pwrid,
        uint8_t *req_id)
{
    return 
# 1167 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 3 4
          ((void *)0)
# 1167 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
              ;
}

rt_err_t regulator_req_set_voltage(struct req_pwr_desc *req_pwr,
                                   uint8_t req_id, uint32_t volt)
{
    return -1;
}

rt_err_t regulator_req_voltage_release(struct req_pwr_desc *req_pwr, uint8_t req_id)
{
    return -1;
}

rt_err_t regulator_req_release(struct req_pwr_desc *req_pwr, uint8_t req_id)
{
    return -1;
}
uint32_t regulator_req_get_voltage(struct req_pwr_desc *req_pwr)
{
    return 0;
}

uint32_t regulator_req_get_max_voltage(struct req_pwr_desc *req_pwr)
{
    return 0;
}

uint32_t regulator_req_get_set_voltage(struct req_pwr_desc *req_pwr,
                                       uint8_t req_id)
{
    return 0;
}



void clk_req_desc_init(struct req_clk_desc *desc_array)
{
    return;
}

void clk_req_init(void)
{
    return;
}
struct req_clk_desc *clk_get_req_rate_id(eCLOCK_Name clk_id, uint8_t *req_id)
{
    return 
# 1214 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 3 4
          ((void *)0)
# 1214 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
              ;
}
rt_err_t clk_req_set_rate(struct req_clk_desc *req_clk, uint8_t req_id, uint32_t rate)
{
    return -1;
}
rt_err_t clk_req_rate_release(struct req_clk_desc *req_clk, uint8_t req_id)
{
    return -1;
}
rt_err_t clk_req_release(struct req_clk_desc *req_clk, uint8_t req_id)
{
    return -1;
}

uint32_t clk_req_get_rate(struct req_clk_desc *req_clk)
{
    return 0;
}
uint32_t clk_req_get_max_rate(struct req_clk_desc *req_clk)
{
    return 0;
}

uint32_t clk_req_get_set_rate(struct req_clk_desc *req_clk, uint8_t req_id)
{
    return 0;
}



rt_err_t dvfs_set_rate(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id,
                       uint32_t rate)
{
    return -1;
}

rt_err_t dvfs_set_rate_by_idx(struct rk_dvfs_desc *dvfs_desc,
                              uint8_t tbl_idx, uint8_t dvfs_clk_req_id)
{
    return -1;
}

struct rk_dvfs_desc *dvfs_get_by_clk(eCLOCK_Name clk_id, uint8_t *dvfs_clk_req_id)
{
    return 
# 1259 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c" 3 4
          ((void *)0)
# 1259 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.c"
              ;
}

uint32_t dvfs_req_get_rate(struct rk_dvfs_desc *dvfs_desc)
{
    return 0;
}
uint32_t dvfs_req_get_max_rate(struct rk_dvfs_desc *dvfs_desc)
{
    return 0;
}

uint32_t dvfs_req_get_set_rate(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id)
{
    return 0;
}

void rk_dvfs_req_rate_release(struct rk_dvfs_desc *dvfs_desc,
                              uint8_t dvfs_clk_req_id)
{
    return;
}

void rk_dvfs_req_release(struct rk_dvfs_desc *dvfs_desc, uint8_t dvfs_clk_req_id)
{
    return;
}
void dvfs_desc_init(struct rk_dvfs_desc *dvfs_array)
{
    return;
}
void dvfs_init()
{
    return;
}
