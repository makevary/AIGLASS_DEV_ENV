# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
# 22 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
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
# 23 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 2
# 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h" 1
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
# 24 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 2
# 39 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
static volatile int __rt_errno;


static rt_device_t _console_device = (0);







rt_err_t rt_get_errno(void)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
    {

        return __rt_errno;
    }

    tid = rt_thread_self();
    if (tid == (0))
        return __rt_errno;

    return tid->error;
}
;






void rt_set_errno(rt_err_t error)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
    {

        __rt_errno = error;

        return;
    }

    tid = rt_thread_self();
    if (tid == (0))
    {
        __rt_errno = error;

        return;
    }

    tid->error = error;
}
;






int *_rt_errno(void)
{
    rt_thread_t tid;

    if (rt_interrupt_get_nest() != 0)
        return (int *)&__rt_errno;

    tid = rt_thread_self();
    if (tid != (0))
        return (int *) & (tid->error);

    return (int *)&__rt_errno;
}
;
# 126 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
void *rt_memset(void *s, int c, rt_ubase_t count)
{
# 140 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
    int i;
    char *m = (char *)s;
    rt_uint32_t buffer;
    rt_uint32_t *aligned_addr;
    rt_uint32_t d = c & 0xff;

    if (!((count) < (sizeof(rt_int32_t))) && !((rt_int32_t)s & ((sizeof(rt_int32_t)) - 1)))
    {

        aligned_addr = (rt_uint32_t *)s;




        if ((sizeof(rt_int32_t)) == 4)
        {
            buffer = (d << 8) | d;
            buffer |= (buffer << 16);
        }
        else
        {
            buffer = 0;
            for (i = 0; i < (sizeof(rt_int32_t)); i ++)
                buffer = (buffer << 8) | d;
        }

        while (count >= (sizeof(rt_int32_t)) * 4)
        {
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            count -= 4 * (sizeof(rt_int32_t));
        }

        while (count >= (sizeof(rt_int32_t)))
        {
            *aligned_addr++ = buffer;
            count -= (sizeof(rt_int32_t));
        }


        m = (char *)aligned_addr;
    }

    while (count--)
    {
        *m++ = (char)d;
    }

    return s;





}
;
# 209 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
void *rt_memcpy(void *dst, const void *src, rt_ubase_t count)
{
# 236 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
    char *dst_ptr = (char *)dst;
    char *src_ptr = (char *)src;
    rt_int32_t *aligned_dst;
    rt_int32_t *aligned_src;
    int len = count;



    if (!((len) < (sizeof(rt_int32_t) << 2)) && !(((rt_int32_t)src_ptr & (sizeof(rt_int32_t) - 1)) | ((rt_int32_t)dst_ptr & (sizeof(rt_int32_t) - 1))))
    {
        aligned_dst = (rt_int32_t *)dst_ptr;
        aligned_src = (rt_int32_t *)src_ptr;


        while (len >= (sizeof(rt_int32_t) << 2))
        {
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            len -= (sizeof(rt_int32_t) << 2);
        }


        while (len >= (sizeof(rt_int32_t)))
        {
            *aligned_dst++ = *aligned_src++;
            len -= (sizeof(rt_int32_t));
        }


        dst_ptr = (char *)aligned_dst;
        src_ptr = (char *)aligned_src;
    }

    while (len--)
        *dst_ptr++ = *src_ptr++;

    return dst;





}
;
# 293 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
void *rt_memmove(void *dest, const void *src, rt_ubase_t n)
{
    char *tmp = (char *)dest, *s = (char *)src;

    if (s < tmp && tmp < s + n)
    {
        tmp += n;
        s += n;

        while (n--)
            *(--tmp) = *(--s);
    }
    else
    {
        while (n--)
            *tmp++ = *s++;
    }

    return dest;
}
;
# 324 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_int32_t rt_memcmp(const void *cs, const void *ct, rt_ubase_t count)
{
    const unsigned char *su1, *su2;
    int res = 0;

    for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
        if ((res = *su1 - *su2) != 0)
            break;

    return res;
}
;
# 345 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
char *rt_strstr(const char *s1, const char *s2)
{
    int l1, l2;

    l2 = rt_strlen(s2);
    if (!l2)
        return (char *)s1;
    l1 = rt_strlen(s1);
    while (l1 >= l2)
    {
        l1 --;
        if (!rt_memcmp(s1, s2, l2))
            return (char *)s1;
        s1 ++;
    }

    return (0);
}
;
# 373 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_uint32_t rt_strcasecmp(const char *a, const char *b)
{
    int ca, cb;

    do
    {
        ca = *a++ & 0xff;
        cb = *b++ & 0xff;
        if (ca >= 'A' && ca <= 'Z')
            ca += 'a' - 'A';
        if (cb >= 'A' && cb <= 'Z')
            cb += 'a' - 'A';
    }
    while (ca == cb && ca != '\0');

    return ca - cb;
}
;
# 401 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
char *rt_strncpy(char *dst, const char *src, rt_ubase_t n)
{
    if (n != 0)
    {
        char *d = dst;
        const char *s = src;

        do
        {
            if ((*d++ = *s++) == 0)
            {

                while (--n != 0)
                    *d++ = 0;
                break;
            }
        } while (--n != 0);
    }

    return (dst);
}
;
# 433 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_int32_t rt_strncmp(const char *cs, const char *ct, rt_ubase_t count)
{
    register signed char __res = 0;

    while (count)
    {
        if ((__res = *cs - *ct++) != 0 || !*cs++)
            break;
        count --;
    }

    return __res;
}
;
# 456 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_int32_t rt_strcmp(const char *cs, const char *ct)
{
    while (*cs && *cs == *ct)
        cs++, ct++;

    return (*cs - *ct);
}
;
# 476 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_size_t rt_strnlen(const char *s, rt_ubase_t maxlen)
{
    const char *sc;

    for (sc = s; *sc != '\0' && (rt_ubase_t)(sc - s) < maxlen; ++sc)
        ;

    return sc - s;
}
;
# 495 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_size_t rt_strlen(const char *s)
{
    const char *sc;

    for (sc = s; *sc != '\0'; ++sc)
        ;

    return sc - s;
}
;
# 514 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
char *rt_strdup(const char *s)
{
    rt_size_t len = rt_strlen(s) + 1;
    char *tmp = (char *)rt_malloc(len);

    if (!tmp)
        return (0);

    rt_memcpy(tmp, s, len);

    return tmp;
}
;
# 535 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
void rt_show_version(void)
{
    rt_kprintf("\n \\ | /\n");
    rt_kprintf("- RT -     Thread Operating System\n");
    rt_kprintf(" / | \\     %d.%d.%d build %s\n",
               3L, 1L, 3L, "Nov  7 2025");
    rt_kprintf(" 2006 - 2019 Copyright by rt-thread team\n");
}
;




static __inline rt_int32_t divide(rt_int32_t *n, rt_int32_t base)
{
    rt_int32_t res;


    if (base == 10)
    {
        res = ((rt_uint32_t) * n) % 10U;
        *n = ((rt_uint32_t) * n) / 10U;
    }
    else
    {
        res = ((rt_uint32_t) * n) % 16U;
        *n = ((rt_uint32_t) * n) / 16U;
    }

    return res;
}

static __inline int skip_atoi(const char **s)
{
    register int i = 0;
    while (((unsigned)((**s) - '0') < 10))
        i = i * 10 + *((*s)++) - '0';

    return i;
}
# 585 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
static char *print_number(char *buf,
                          char *end,
                          long num,
                          int base,
                          int s,
                          int precision,
                          int type)
# 600 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
{
    char c, sign;



    char tmp[16];

    int precision_bak = precision;
    const char *digits;
    static const char small_digits[] = "0123456789abcdef";
    static const char large_digits[] = "0123456789ABCDEF";
    register int i;
    register int size;

    size = s;

    digits = (type & (1 << 6)) ? large_digits : small_digits;
    if (type & (1 << 4))
        type &= ~(1 << 0);

    c = (type & (1 << 0)) ? '0' : ' ';


    sign = 0;
    if (type & (1 << 1))
    {
        if (num < 0)
        {
            sign = '-';
            num = -num;
        }
        else if (type & (1 << 2))
            sign = '+';
        else if (type & (1 << 3))
            sign = ' ';
    }
# 647 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
    i = 0;
    if (num == 0)
        tmp[i++] = '0';
    else
    {
        while (num != 0)
            tmp[i++] = digits[divide(&num, base)];
    }


    if (i > precision)
        precision = i;
    size -= precision;




    if (!(type & ((1 << 0) | (1 << 4))))
    {
        if ((sign) && (size > 0))
            size--;

        while (size-- > 0)
        {
            if (buf <= end)
                *buf = ' ';
            ++ buf;
        }
    }

    if (sign)
    {
        if (buf <= end)
        {
            *buf = sign;
            -- size;
        }
        ++ buf;
    }
# 711 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
    if (!(type & (1 << 4)))
    {
        while (size-- > 0)
        {
            if (buf <= end)
                *buf = c;
            ++ buf;
        }
    }


    while (i < precision--)
    {
        if (buf <= end)
            *buf = '0';
        ++ buf;
    }



    while (i-- > 0 && (precision_bak != 0))
    {
        if (buf <= end)
            *buf = tmp[i];
        ++ buf;
    }

    while (size-- > 0)
    {
        if (buf <= end)
            *buf = ' ';
        ++ buf;
    }

    return buf;
}

rt_int32_t rt_vsnprintf(char *buf,
                        rt_size_t size,
                        const char *fmt,
                        va_list args)
{



    rt_uint32_t num;

    int i, len;
    char *str, *end, c;
    const char *s;

    rt_uint8_t base;
    rt_uint8_t flags;
    rt_uint8_t qualifier;
    rt_int32_t field_width;


    int precision;


    str = buf;
    end = buf + size - 1;


    if (end < buf)
    {
        end = ((char *) - 1);
        size = end - buf;
    }

    for (; *fmt ; ++fmt)
    {
        if (*fmt != '%')
        {
            if (str <= end)
                *str = *fmt;
            ++ str;
            continue;
        }


        flags = 0;

        while (1)
        {

            ++ fmt;
            if (*fmt == '-') flags |= (1 << 4);
            else if (*fmt == '+') flags |= (1 << 2);
            else if (*fmt == ' ') flags |= (1 << 3);
            else if (*fmt == '#') flags |= (1 << 5);
            else if (*fmt == '0') flags |= (1 << 0);
            else break;
        }


        field_width = -1;
        if (((unsigned)((*fmt) - '0') < 10)) field_width = skip_atoi(&fmt);
        else if (*fmt == '*')
        {
            ++ fmt;

            field_width = 
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                         __builtin_va_arg(
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                         args
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                         ,
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                         int
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                         )
# 813 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                          ;
            if (field_width < 0)
            {
                field_width = -field_width;
                flags |= (1 << 4);
            }
        }



        precision = -1;
        if (*fmt == '.')
        {
            ++ fmt;
            if (((unsigned)((*fmt) - '0') < 10)) precision = skip_atoi(&fmt);
            else if (*fmt == '*')
            {
                ++ fmt;

                precision = 
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           __builtin_va_arg(
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                           args
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           ,
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                           int
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           )
# 832 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                            ;
            }
            if (precision < 0) precision = 0;
        }


        qualifier = 0;



        if (*fmt == 'h' || *fmt == 'l')

        {
            qualifier = *fmt;
            ++ fmt;







        }


        base = 10;

        switch (*fmt)
        {
        case 'c':
            if (!(flags & (1 << 4)))
            {
                while (--field_width > 0)
                {
                    if (str <= end) *str = ' ';
                    ++ str;
                }
            }


            c = (rt_uint8_t)
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           __builtin_va_arg(
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                           args
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           ,
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                           int
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                           )
# 872 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                            ;
            if (str <= end) *str = c;
            ++ str;


            while (--field_width > 0)
            {
                if (str <= end) *str = ' ';
                ++ str;
            }
            continue;

        case 's':
            s = 
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
               __builtin_va_arg(
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
               args
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
               ,
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
               char *
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
               )
# 885 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                   ;
            if (!s) s = "(NULL)";

            len = rt_strlen(s);

            if (precision > 0 && len > precision) len = precision;


            if (!(flags & (1 << 4)))
            {
                while (len < field_width--)
                {
                    if (str <= end) *str = ' ';
                    ++ str;
                }
            }

            for (i = 0; i < len; ++i)
            {
                if (str <= end) *str = *s;
                ++ str;
                ++ s;
            }

            while (len < field_width--)
            {
                if (str <= end) *str = ' ';
                ++ str;
            }
            continue;

        case 'p':
            if (field_width == -1)
            {
                field_width = sizeof(void *) << 1;
                flags |= (1 << 0);
            }

            str = print_number(str, end,
                               (long)
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                                    __builtin_va_arg(
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                    args
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                                    ,
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                    void *
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                                    )
# 924 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                                        ,
                               16, field_width, precision, flags);





            continue;

        case '%':
            if (str <= end) *str = '%';
            ++ str;
            continue;


        case 'o':
            base = 8;
            break;

        case 'X':
            flags |= (1 << 6);
        case 'x':
            base = 16;
            break;

        case 'd':
        case 'i':
            flags |= (1 << 1);
        case 'u':
            break;

        default:
            if (str <= end) *str = '%';
            ++ str;

            if (*fmt)
            {
                if (str <= end) *str = *fmt;
                ++ str;
            }
            else
            {
                -- fmt;
            }
            continue;
        }





        if (qualifier == 'l')

        {
            num = 
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 __builtin_va_arg(
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                 args
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 ,
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                 rt_uint32_t
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 )
# 978 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                          ;
            if (flags & (1 << 1)) num = (rt_int32_t)num;
        }
        else if (qualifier == 'h')
        {
            num = (rt_uint16_t)
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                              __builtin_va_arg(
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                              args
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                              ,
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                              rt_int32_t
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                              )
# 983 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                                      ;
            if (flags & (1 << 1)) num = (rt_int16_t)num;
        }
        else
        {
            num = 
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 __builtin_va_arg(
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                 args
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 ,
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                 rt_uint32_t
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
                 )
# 988 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                                          ;
            if (flags & (1 << 1)) num = (rt_int32_t)num;
        }

        str = print_number(str, end, num, base, field_width, precision, flags);



    }

    if (str <= end) *str = '\0';
    else *end = '\0';




    return str - buf;
}
;
# 1015 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_int32_t rt_snprintf(char *buf, rt_size_t size, const char *fmt, ...)
{
    rt_int32_t n;
    va_list args;

    
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_start(
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   args
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   ,
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   fmt
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1020 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                      ;
    n = rt_vsnprintf(buf, size, fmt, args);
    
# 1022 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_end(
# 1022 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   args
# 1022 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1022 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
               ;

    return n;
}
;
# 1035 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_int32_t rt_vsprintf(char *buf, const char *format, va_list arg_ptr)
{
    return rt_vsnprintf(buf, (rt_size_t) - 1, format, arg_ptr);
}
;







rt_int32_t rt_sprintf(char *buf, const char *format, ...)
{
    rt_int32_t n;
    va_list arg_ptr;

    
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_start(
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   arg_ptr
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   ,
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   format
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1052 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                            ;
    n = rt_vsprintf(buf, format, arg_ptr);
    
# 1054 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_end(
# 1054 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   arg_ptr
# 1054 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1054 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                  ;

    return n;
}
;
# 1068 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_device_t rt_console_get_device(void)
{
    return _console_device;
}
;
# 1083 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
rt_device_t rt_console_set_device(const char *name)
{
    rt_device_t new, old;


    old = _console_device;


    new = rt_device_find(name);
    if (new != (0))
    {
        if (_console_device != (0))
        {

            rt_device_close(_console_device);
        }


        rt_device_open(new, 0x003 | 0x040);
        _console_device = new;
    }

    return old;
}
;


__attribute__((weak)) void rt_hw_console_output(const char *str)
{

}
;






void rt_kputs(const char *str)
{
    if (!str) return;


    if (_console_device == (0))
    {
        rt_hw_console_output(str);
    }
    else
    {
        rt_uint16_t old_flag = _console_device->open_flag;

        _console_device->open_flag |= 0x040;
        rt_device_write(_console_device, 0, str, rt_strlen(str));
        _console_device->open_flag = old_flag;
    }



}

console_hook console_output_hook = (0);

void rt_console_set_output_hook(console_hook hook)
{
    console_output_hook = hook;
}






__attribute__((weak)) void rt_kprintf(const char *fmt, ...)
{
    va_list args;
    rt_size_t length;
    static char rt_log_buf[128];

    
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_start(
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   args
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   ,
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   fmt
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1161 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
                      ;





    length = rt_vsnprintf(rt_log_buf, sizeof(rt_log_buf) - 1, fmt, args);
    if (length > 128 - 1)
        length = 128 - 1;

    if (console_output_hook) {
        console_output_hook(rt_log_buf, 0);
    }


    if (_console_device == (0))
    {
        rt_hw_console_output(rt_log_buf);
    }
    else
    {
        rt_uint16_t old_flag = _console_device->open_flag;

        _console_device->open_flag |= 0x040;
        rt_device_write(_console_device, 0, rt_log_buf, length);
        _console_device->open_flag = old_flag;
    }



    
# 1191 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   __builtin_va_end(
# 1191 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
   args
# 1191 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c" 3 4
   )
# 1191 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
               ;
}
;
# 1206 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
void *rt_malloc_align(rt_size_t size, rt_size_t align)
{
    void *align_ptr;
    void *ptr;
    rt_size_t align_size;


    align = ((align + 0x03) & ~0x03);


    align_size = ((size + 0x03) & ~0x03) + align;

    ptr = rt_malloc(align_size);
    if (ptr != (0))
    {

        if (((rt_uint32_t)ptr & (align - 1)) == 0)
        {
            align_ptr = (void *)((rt_uint32_t)ptr + align);
        }
        else
        {
            align_ptr = (void *)(((rt_uint32_t)ptr + (align - 1)) & ~(align - 1));
        }


        *((rt_uint32_t *)((rt_uint32_t)align_ptr - sizeof(void *))) = (rt_uint32_t)ptr;

        ptr = align_ptr;
    }

    return ptr;
}
;







void rt_free_align(void *ptr)
{
    void *real_ptr;

    real_ptr = (void *) * (rt_uint32_t *)((rt_uint32_t)ptr - sizeof(void *));
    rt_free(real_ptr);
}
;



const rt_uint8_t __lowest_bit_bitmap[] =
{
             0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
             4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
};
# 1288 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/kservice.c"
int __rt_ffs(int value)
{
    if (value == 0) return 0;

    if (value & 0xff)
        return __lowest_bit_bitmap[value & 0xff] + 1;

    if (value & 0xff00)
        return __lowest_bit_bitmap[(value & 0xff00) >> 8] + 9;

    if (value & 0xff0000)
        return __lowest_bit_bitmap[(value & 0xff0000) >> 16] + 17;

    return __lowest_bit_bitmap[(value & 0xff000000) >> 24] + 25;
}
