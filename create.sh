#!/usr/bin/bash

# Create Disks

qemu-img create -f qcow2 disk.img 16G
truncate -s 64m varstore.img
truncate -s 64m efi.img
dd if=/usr/share/ovmf/x64/OVMF.fd of=efi.img conv=notrunc

echo "Done"