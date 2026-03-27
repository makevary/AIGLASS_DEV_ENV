/*
 * Copyright (c) 2022 iComm-semi Ltd.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/**
 * @file ble_hci.c
 * @brief BLE HCI function definitions
 */

/*******************************************************************************
 *         Include Files
 ******************************************************************************/

#include <linux/module.h>
#include <linux/version.h>
#include <linux/kthread.h>
#include <linux/inetdevice.h>
#include <linux/of.h>

#include "hci/drv_hci_ops.h"
#include "hci/ssv_hci.h"
#include "ipc_msg.h"
#include "ble_hci.h"
#include "ble_hci_msg.h"
#ifndef BLE_USE_LL_ONLY
#include "hcidev_ops.h"
#endif
#include "ssv_cfg.h"
#include "ssv_debug.h"

extern struct ssv6xxx_cfg ssv_cfg;
/*******************************************************************************
 *         Local Defines
 ******************************************************************************/


/*******************************************************************************
 *         Local Enumerations
 ******************************************************************************/


/*******************************************************************************
 *         Local Structures
 ******************************************************************************/


/*******************************************************************************
 *         Global Variables
 ******************************************************************************/

/*******************************************************************************
 *         Local Variables
 ******************************************************************************/

/*******************************************************************************
 *         Local Functions
 ******************************************************************************/


/*******************************************************************************
 *         Global Functions
 ******************************************************************************/

/* ssv_ble_hci_init must hook hci callback function
 * ex: ssv6xxx_hci_proc_rx_register()
 * */
int ssv_ble_hci_init(void **plat_sbsc, struct ssv6xxx_hci_ops *hci_ops, void *hci_priv, u8 *maddr, struct device *dev)
{
    struct ssv_ble_softc *sbsc = NULL;

    sbsc = kzalloc(sizeof(*sbsc), GFP_KERNEL);
    if (sbsc == NULL){
        SSV_LOG_DBG("Fail to alloc ble_softc\n");
        return -ENOMEM;
    }
    
    sbsc->hci_priv = hci_priv;
    sbsc->hci_ops = hci_ops;
    sbsc->dev = dev;
    memcpy(sbsc->maddr, maddr, 6);
    //Modify mac address 
    sbsc->maddr[5] ^= 0x1;
    // SSV_LOG_DBG("BLE mac address 0x%02X:0x%02X:0x%02X:0x%02X:0x%02X:0x%02X\n",
    //     sbsc->maddr[0], sbsc->maddr[1], sbsc->maddr[2], sbsc->maddr[3], sbsc->maddr[4], sbsc->maddr[5]);


    SSV_LOG_DBG("ble_hci_init\n");
    ssv6xxx_hci_proc_rx_register((void *)hci_priv, ssv_ble_hci_event, (void *)sbsc);

    #if (CONFIG_BLE_HCI_BUS == SSV_BLE_HCI_OVER_UART)
    ssv_drv_hci_ble_start(hci_priv, hci_ops);
    ssv_ble_hci_send_bleinit(sbsc, 0);
    #endif

    #if (CONFIG_BLE_HCI_BUS == SSV_BLE_HCI_OVER_HWIF)
    #ifdef BLE_USE_LL_ONLY
    ssv_drv_hci_ble_start(hci_priv, hci_ops);
    ssv_ble_hci_send_bleinit(sbsc, 0);
    #else
    SSV_LOG_DBG("cfg.ble_dtm %d\n", ssv_cfg.ble_dtm);
    if (ssv_cfg.ble_dtm) {
        ssv_drv_hci_ble_start(hci_priv, hci_ops);
        ssv_ble_hci_send_bleinit(sbsc, 0);
    } else
        ssv_ble_hci_dev_register(sbsc);
    #endif
    #endif
    
    *plat_sbsc = sbsc;
    
    return 0;
}
EXPORT_SYMBOL(ssv_ble_hci_init);

/* ssv_ble_hci_deinit must hook hci callback function
 * ex: ssv6xxx_hci_proc_rx_unregister()
 * */
void ssv_ble_hci_deinit(void *plat_sbsc)
{
    struct ssv_ble_softc *sbsc = (struct ssv_ble_softc *)plat_sbsc;

    ssv_ble_hci_send_bleinit(sbsc, 1);
    
    ssv6xxx_hci_proc_rx_unregister((void *)sbsc->hci_priv, ssv_ble_hci_event, NULL);

#ifndef BLE_USE_LL_ONLY
    ssv_ble_hci_dev_unregister(sbsc);
#endif
    SSV_LOG_DBG("ble_hci_deinit\n");
    kfree(sbsc);
    plat_sbsc = NULL;
}
EXPORT_SYMBOL(ssv_ble_hci_deinit);


