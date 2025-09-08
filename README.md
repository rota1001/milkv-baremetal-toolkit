# milkv baremetal toolkit
This is a lightweight toolkit that builds ready-to-flash .img images for Milk-V duo 256M, enabling custom OS development from scratch.

I created this respository for the reason that I think the existing tutorials are not very newbie-friendly to me. This toolkit will tell you how to get all the toolchain you need and build the image in one click.

## Dependency
You should install the cross compile toolchain.
```shell
sudo apt update
sudo apt install gcc-riscv64-unknown-elf
```
## Usage
**Notice: For the convenience reason, I use some pre-build binaries. However, if you don't want to use the pre-build binaries for security reason, I have made a [full tutorial](docs/toolchain.md) of how to build these binaries from source.**

First, clone the repository.
```shell
git clone https://github.com/rota1001/milkv-baremetal-toolkit.git
```
Second, use `make` to compile and produce the kernel image.
```shell
cd milkv-baremetal-toolkit
make
```

Then you will get the `kernel.img`, you can flash it to the SD card. It will output the `helloworld` through the UART serial port.

## Previous Work
[Use Opensbi to boot your own operating system](https://forum.sophgo.com/t/use-opensbi-to-boot-your-own-operating-system/340)


## License and Third-Party Software

This project is licensed under **GPLv2** and includes the following third-party software:

1. **genimage**  
   - License: **GPLv2**  
   - Source code: [https://github.com/pengutronix/genimage](https://github.com/pengutronix/genimage)  
   - Note: We use genimage under its original GPLv2 license.  

2. **OpenSBI**  
   - License: **BSD-2-Clause**  
   - Original source code: [https://github.com/riscv-software-src/opensbi](https://github.com/riscv-software-src/opensbi)  
   - Modified version used: [https://github.com/milkv-duo/duo-buildroot-sdk-v2/tree/develop/opensbi](https://github.com/milkv-duo/duo-buildroot-sdk-v2/tree/develop/opensbi)  
   - Note: Due to the GPLv2 license of this project, we provide the OpenSBI source code used.  
3. **fiptool**
   - License: Please refer to the `fiptool/LICENSE` for the details

All third-party software is used according to their respective licenses.

**For full license details, please refer to `pre-build-binary/COPYING` (GPLv2), `pre-build-binary/COPYING.BSD` (BSD-2-Clause) and those licenses under the `genimage`, `fiptool` directories.**
