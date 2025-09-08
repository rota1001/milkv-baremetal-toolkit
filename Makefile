all: kernel.img

kernel.bin:
	make -C example
	cp example/kernel.bin .

fip.bin: kernel.bin
	fiptool/fiptool \
		--fsbl fiptool/data/fsbl/cv181x.bin \
		--ddr_param fiptool/data/ddr_param.bin \
		--opensbi ./pre-build-binary/fw_dynamic.bin \
		--uboot kernel.bin \
		--rtos fiptool/data/cvirtos.bin

kernel.img: fip.bin
	pre-build-binary/genimage \
		--config \
		genimage.cfg \
		--rootpath `mktemp -d` \
		--tmppath `mktemp -d` \
		--inputpath . \
		--outputpath .

qemu:
	make -C example qemu

clean:
	make -C example clean
	rm fip.bin kernel.bin boot.vfat kernel.img
