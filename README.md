# esp32s3-linux-docker
Binary files for ESP32S3 Linux 6.5+

## Flashing
- grab thea files with `docker cp CONTAINER_NAME:/app/build/release/\* .`
- now you can burn the files from the 'release' folder with: 
- `python esptool.py --chip esp32s3 -p /dev/ttyUSB0 -b 921600 --before=default_reset --after=hard_reset write_flash 0x0 bootloader.bin 0x10000 network_adapter.bin 0x8000 partition-table.bin`
- next we can burn in the kernel and filesys with parttool, which is part of esp-idf
- `parttool.py write_partition --partition-name linux --input xipImage`
- `parttool.py write_partition --partition-name rootfs --input rootfs.cramfs`
- `parttool.py write_partition --partition-name etc --input rootfs.jffs2`

## ESP32S3 Partition Table
|Name      |Type|SubType|Offset  |Size |Flags|
|----------|----|-------|--------|-----|-----|
|nvs       |data|nvs    |0xa000  |20K  |     |
|phy_init  |data|phy    |0xf000  |4K   |     |
|factory   |app |factory|0x10000 |640K |     |
|etc       |64  |1      |0xb0000 |448K |     |
|linux     |64  |0      |0x120000|3456K|     |
|rootfs    |64  |1      |0x480000|3584K|     |

