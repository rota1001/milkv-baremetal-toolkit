# How to build the toolchain from source
## opensbi
Here we need the vendor-modified version of OpenSBI. The easiest way is to use the official Buildroot SDK:
```shell
git clone https://github.com/milkv-duo/duo-buildroot-sdk-v2.git --depth=1
git clone https://github.com/milkv-duo/host-tools.git
cp -a host-tools duo-buildroot-sdk-v2/
```

In the following steps, make sure you are using `bash`, or you might run into problems.
```shell
cd duo-buildroot-sdk-v2
source build/envsetup_milkv.sh
```
At this point, it will list several options for choosing the development board. If you are using the RISC-V version of Milk-V Duo-256M, select option 3.

Now proceed with the build:
```shell
build_fsbl
```
After this, you should find the file opensbi/build/platform/generic/firmware/fw_dynamic.bin, which is the compiled OpenSBI firmware.

## genimage
```shell
git clone https://github.com/pengutronix/genimage.git
cd genimage
./autogen.sh
./configure
```
During this process, you may encounter errors due to missing dependencies.
If that happens, you can ask ChatGPT—it will help you solve them.

If the commands above succeed, a `Makefile` will be generated.
Now you can start the actual build:
```shell
make
```
Once it’s done, you will have a `genimage` executable.
