#include <linux/module.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/gpio/consumer.h>
#include <linux/spi/spi.h>

#define DRIVER_NAME "ada100"

/* ADA100 Register Definitions */
#define ADA100_RESET_REG          0x0010
#define ADA100_CLOCK_CAL_REG      0x0080
#define ADA100_LNA_REG            0x0087
#define ADA100_VGA_REG            0x0109
#define ADA100_APB_EN_REG         0x0092
#define ADA100_KWS_RESULT_REG     0x00BB

/* Mode Definitions */
#define VAD_MODE                 0x01
#define KWS_MODE                 0x02
#define VADANDKWS_MODE           0x00
#define MASTER_KWS_MODE          0x03
#define MASTER_VADANDKWS_MODE    0x04

/* Model Definitions */
#define ASR_MODEL                0x00
#define NSC_MODEL                0x01
#define THM_MODEL                0x02

/* I2C Timing */
#define I2C_DELAY_US             5       /* Delay between SCL edges in microseconds */
#define I2C_TIMEOUT_MS           100     /* Timeout for I2C operations */

struct ada100_data {
    struct gpio_desc *sda_gpio;
    struct gpio_desc *scl_gpio;
    struct gpio_desc *reset_gpio;
    struct gpio_desc *int_gpio; // For VAD and KWS interrupts
    struct spi_device *spi_device;
    int irq;
    bool use_i2c;
    uint8_t model_flag;
    uint8_t current_mode;
    uint8_t i2c_addr;            // I2C device address
};

/* Software I2C Functions */
static void i2c_delay(void)
{
    udelay(I2C_DELAY_US);
}

static void i2c_start(struct gpio_desc *sda, struct gpio_desc *scl)
{
    /* SDA high to low while SCL is high */
    gpiod_direction_output(sda, 1);
    gpiod_direction_output(scl, 1);
    i2c_delay();
    gpiod_direction_output(sda, 0);
    i2c_delay();
    gpiod_direction_output(scl, 0);
    i2c_delay();
}

static void i2c_stop(struct gpio_desc *sda, struct gpio_desc *scl)
{
    /* SDA low to high while SCL is high */
    gpiod_direction_output(sda, 0);
    gpiod_direction_output(scl, 1);
    i2c_delay();
    gpiod_direction_output(sda, 1);
    i2c_delay();
}

static int i2c_write_bit(struct gpio_desc *sda, struct gpio_desc *scl, bool bit)
{
    int ack;
    
    gpiod_direction_output(sda, bit);
    i2c_delay();
    gpiod_direction_output(scl, 1);
    i2c_delay();
    gpiod_direction_output(scl, 0);
    i2c_delay();
    
    /* For ACK check */
    if (bit) {
        gpiod_direction_input(sda);
        i2c_delay();
        gpiod_direction_output(scl, 1);
        i2c_delay();
        ack = !gpiod_get_value(sda); // ACK is low
        gpiod_direction_output(scl, 0);
        i2c_delay();
        gpiod_direction_output(sda, 1); // Release SDA
    } else {
        ack = 1; // No ACK check when writing data bits
    }
    
    return ack;
}

static bool i2c_read_bit(struct gpio_desc *sda, struct gpio_desc *scl)
{
    bool bit;
    
    gpiod_direction_input(sda);
    i2c_delay();
    gpiod_direction_output(scl, 1);
    i2c_delay();
    bit = gpiod_get_value(sda);
    gpiod_direction_output(scl, 0);
    i2c_delay();
    
    return bit;
}

static int i2c_write_byte(struct gpio_desc *sda, struct gpio_desc *scl, uint8_t byte)
{
    int i, ack;
    
    for (i = 7; i >= 0; i--) {
        i2c_write_bit(sda, scl, (byte >> i) & 0x01);
    }
    
    /* Check for ACK */
    ack = i2c_write_bit(sda, scl, 1); // Read ACK
    
    return ack ? 0 : -EIO;
}

static uint8_t i2c_read_byte(struct gpio_desc *sda, struct gpio_desc *scl, bool ack)
{
    uint8_t byte = 0;
    int i;
    
    for (i = 7; i >= 0; i--) {
        if (i2c_read_bit(sda, scl)) {
            byte |= (1 << i);
        }
    }
    
    /* Send ACK or NACK */
    i2c_write_bit(sda, scl, !ack);
    
    return byte;
}

static int ada100_i2c_read_byte(struct ada100_data *data, uint16_t addr, uint8_t *val)
{
    struct gpio_desc *sda = data->sda_gpio;
    struct gpio_desc *scl = data->scl_gpio;
    uint8_t addr_high = addr >> 8;
    uint8_t addr_low = addr & 0xFF;
    int ret = 0;
    
    i2c_start(sda, scl);
    
    /* Send device address with write bit */
    if (i2c_write_byte(sda, scl, (data->i2c_addr << 1) | 0)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Send high address byte */
    if (i2c_write_byte(sda, scl, addr_high)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Send low address byte */
    if (i2c_write_byte(sda, scl, addr_low)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Repeated start */
    i2c_start(sda, scl);
    
    /* Send device address with read bit */
    if (i2c_write_byte(sda, scl, (data->i2c_addr << 1) | 1)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Read data byte with NACK */
    *val = i2c_read_byte(sda, scl, false);
    
exit:
    i2c_stop(sda, scl);
    return ret;
}

static int ada100_i2c_write_byte(struct ada100_data *data, uint16_t addr, uint8_t val)
{
    struct gpio_desc *sda = data->sda_gpio;
    struct gpio_desc *scl = data->scl_gpio;
    uint8_t addr_high = addr >> 8;
    uint8_t addr_low = addr & 0xFF;
    int ret = 0;
    
    i2c_start(sda, scl);
    
    /* Send device address with write bit */
    if (i2c_write_byte(sda, scl, (data->i2c_addr << 1) | 0)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Send high address byte */
    if (i2c_write_byte(sda, scl, addr_high)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Send low address byte */
    if (i2c_write_byte(sda, scl, addr_low)) {
        ret = -EIO;
        goto exit;
    }
    
    /* Send data byte */
    if (i2c_write_byte(sda, scl, val)) {
        ret = -EIO;
    }
    
exit:
    i2c_stop(sda, scl);
    return ret;
}

static void ada100_reset(struct ada100_data *data)
{
	uint8_t chip_version;

	ada100_i2c_write_byte(data,ADA100_RESET_REG, 0x01);	
	msleep(5);
	ada100_i2c_read_byte(data, 0x0000, &chip_version);
	if (chip_version == 0x10)
		ada100_i2c_write_byte(data, ADA100_CLOCK_CAL_REG, 0xBB);


}


static void ada100_configure_mode(struct ada100_data *data, uint8_t mode)
{
	ada100_i2c_write_byte(data, ADA100_APB_EN_REG, 0x01);

	ada100_i2c_write_byte(data, ADA100_LNA_REG, 0x07);
        ada100_i2c_write_byte(data, ADA100_VGA_REG, 0x96);

	ada100_i2c_write_byte(data, ADA100_APB_EN_REG, 0x00);
}

/* Rest of the driver remains largely the same, just replace i2c_client with ada100_data */
/* ... */

static int ada100_probe(struct platform_device *pdev)
{
    struct device *dev = &pdev->dev;
    struct ada100_data *data;
    int ret;
    
    data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
    if (!data)
        return -ENOMEM;
    
    data->use_i2c = true;
    platform_set_drvdata(pdev, data);
    
    /* Get I2C GPIOs */
    data->sda_gpio = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH);
    if (IS_ERR(data->sda_gpio)) {
        dev_err(dev, "Failed to get SDA GPIO\n");
        return PTR_ERR(data->sda_gpio);
    }
    
    data->scl_gpio = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH);
    if (IS_ERR(data->scl_gpio)) {
        dev_err(dev, "Failed to get SCL GPIO\n");
        return PTR_ERR(data->scl_gpio);
    }
    
    /* Get I2C address from device tree */
    if (of_property_read_u8(dev->of_node, "reg", &data->i2c_addr)) {
        dev_err(dev, "No I2C address specified\n");
        return -EINVAL;
    }
    
    /* Get reset GPIO */
   // data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   // if (IS_ERR(data->reset_gpio)) {
   //     dev_err(dev, "Failed to get reset GPIO\n");
   //     return PTR_ERR(data->reset_gpio);
   // }
    
    /* Get interrupt GPIOs */
   // data->int_gpio[0] = devm_gpiod_get(dev, "vad-int", GPIOD_IN);
   // if (IS_ERR(data->int_gpio[0])) {
   //     dev_err(dev, "Failed to get VAD interrupt GPIO\n");
   //     return PTR_ERR(data->int_gpio[0]);
   // }
    
    data->int_gpio = devm_gpiod_get(dev, "kws-int", GPIOD_IN);
    if (IS_ERR(data->int_gpio[0])) {
        dev_err(dev, "Failed to get KWS interrupt GPIO\n");
        return PTR_ERR(data->int_gpio);
    }
    
    /* Request interrupts */
   // data->irq[0] = gpiod_to_irq(data->int_gpio[0]);
  //  ret = devm_request_threaded_irq(dev, data->irq[0], NULL, ada100_vad_interrupt,
  //                                 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
  //                                 "ada100-vad", data);
  //  if (ret) {
  //      dev_err(dev, "Failed to request VAD interrupt\n");
  //      return ret;
  //  }
    
    data->irq = gpiod_to_irq(data->int_gpio);
    ret = devm_request_threaded_irq(dev, data->irq, NULL, ada100_kws_interrupt,
                                   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
                                   "ada100-kws", data);
    if (ret) {
        dev_err(dev, "Failed to request KWS interrupt\n");
        return ret;
    }
    
    /* Initialize the device */
    ada100_reset(data);
    
    /* Default to ASR model with VAD+KWS mode */
    data->model_flag = THM_MODEL;
    data->current_mode = KWS_MODE;
    ada100_configure_mode(data, data->current_mode);
    
    dev_info(dev, "ADA100 initialized successfully\n");
    return 0;
}

/* Update the rest of the driver to use platform_device instead of i2c_client */
/* ... */

static const struct of_device_id ada100_of_match[] = {
    { .compatible = "ada,ada100" },
    { }
};
MODULE_DEVICE_TABLE(of, ada100_of_match);

static struct platform_driver ada100_driver = {
    .driver = {
        .name = DRIVER_NAME,
        .of_match_table = ada100_of_match,
    },
    .probe = ada100_probe,
};

static int __init ada100_init(void)
{
    return platform_driver_register(&ada100_driver);
}

static void __exit ada100_exit(void)
{
    platform_driver_unregister(&ada100_driver);
}

module_init(ada100_init);
module_exit(ada100_exit);

MODULE_AUTHOR("Pan Zhiyong");
MODULE_DESCRIPTION("Linux driver for ADA100 audio processor");
MODULE_LICENSE("GPL");
