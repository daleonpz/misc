deps_config := \
	/home/dnl/esp/esp-idf/components/app_trace/Kconfig \
	/home/dnl/esp/esp-idf/components/aws_iot/Kconfig \
	/home/dnl/esp/esp-idf/components/bt/Kconfig \
	/home/dnl/esp/esp-idf/components/esp32/Kconfig \
	/home/dnl/esp/esp-idf/components/ethernet/Kconfig \
	/home/dnl/esp/esp-idf/components/fatfs/Kconfig \
	/home/dnl/esp/esp-idf/components/freertos/Kconfig \
	/home/dnl/esp/esp-idf/components/heap/Kconfig \
	/home/dnl/esp/esp-idf/components/libsodium/Kconfig \
	/home/dnl/esp/esp-idf/components/log/Kconfig \
	/home/dnl/esp/esp-idf/components/lwip/Kconfig \
	/home/dnl/esp/esp-idf/components/mbedtls/Kconfig \
	/home/dnl/esp/esp-idf/components/openssl/Kconfig \
	/home/dnl/esp/esp-idf/components/pthread/Kconfig \
	/home/dnl/esp/esp-idf/components/spi_flash/Kconfig \
	/home/dnl/esp/esp-idf/components/spiffs/Kconfig \
	/home/dnl/esp/esp-idf/components/tcpip_adapter/Kconfig \
	/home/dnl/esp/esp-idf/components/wear_levelling/Kconfig \
	/home/dnl/esp/esp-idf/components/bootloader/Kconfig.projbuild \
	/home/dnl/esp/esp-idf/components/esptool_py/Kconfig.projbuild \
	/home/dnl/esp/esp-idf/components/partition_table/Kconfig.projbuild \
	/home/dnl/esp/esp-idf/Kconfig

include/config/auto.conf: \
	$(deps_config)


$(deps_config): ;
