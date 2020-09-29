#!/bin/sh

mkdir -p binary/.disk
xorriso -as mkisofs -r -V 'VyOS' -o live-image-armhf.hybrid.iso -J -joliet-long -cache-inodes -e boot/grub/efi.img -no-emul-boot -append_partition 2 0xef /boot/grub/efi.img -partition_cyl_align all binary
