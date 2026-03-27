#include "sensor_2a_common.h"

struct ae_awb_init_cfg g_2a_init_info =
{
    .head = 0,
    .len = 0,
    .crc32 = 0,
    .ae = {
        .black_lvl = 256,
        .adc_calib_type = 1,
        .adc_range_type = 1,
        .adc_table_len = 13,
        .adc_table_low = {
            {0, 1},
            {7, 130},
            {17, 163},
            {23, 187},
            {35, 302},
            {59, 480},
            {76, 612},
            {110, 828},
            {210, 930},
            {405, 938},
            {825, 945},
            {1280, 950},
            {20000, 1023},
        },
        .start_exp = {1, 10, 100},
    },
    .awb = {
        .rg_gain_base = FIX2INT16(1.0),
        .bg_gain_base = FIX2INT16(1.0),
        .awb_gain_rad = FIX2INT16(1.0),
        .awb_gain_dis = FIX2INT16(1.0),
    }
};
