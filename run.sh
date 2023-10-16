#!/usr/bin/bash

qemu-system-x86_64 -bios \
  -drive if=pflash,format=raw,file=efi.img,readonly=on      \
  -drive if=pflash,format=raw,file=varstore.img         \
  -drive if=virtio,format=qcow2,file=disk.img,id=disk01           \
  -object rng-random,filename=/dev/urandom,id=rng0      \
  -device virtio-rng-pci,rng=rng0               \
  -device virtio-net-pci,romfile=,netdev=net0                \
  -drive if=virtio,format=raw,file=install73.img \
