# fullmoon
A simple script to manange qemu vms


Based On

* http://cdn.kernel.org/pub/linux/kernel/people/will/docs/qemu/qemu-arm64-howto.html


# Troubleshooting

## Aarch64 - Arch Linux ARM

### Missing dependencies for qemu-system-x86

	[freethink@x13s code]$ sudo pacman -S qemu-system-x86
	resolving dependencies...
	warning: cannot resolve "edk2-ovmf", a dependency of "qemu-system-x86"
	warning: cannot resolve "seabios", a dependency of "qemu-system-x86"
	:: The following package cannot be upgraded due to unresolvable dependencies:
	      qemu-system-x86

**Fix**

	wget https://geo.mirror.pkgbuild.com/extra/os/x86_64/edk2-ovmf-202308-3-any.pkg.tar.zst
	wget https://geo.mirror.pkgbuild.com/extra/os/x86_64/seabios-1.16.2-2-any.pkg.tar.zst

	sudo pacman -U edk2-ovmf-202308-3-any.pkg.tar.zst
	sudo pacman -U seabios-1.16.2-2-any.pkg.tar.zst

If you already have qemu installed you will need to remove it, install the above, then reinstall qemu due to permission conflicts. Eitherway you'll need to use the `--overwrite` command. 

	sudo pacman --overwrite /usr/share/qemu/vgabios-*.bin,/usr/share/qemu/bios*.bin -S qemu-system-x86


**Thanks**

* https://archlinuxarm.org/forum/viewtopic.php?t=16037#p69689