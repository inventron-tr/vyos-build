#!/bin/sh
CWD=$(pwd)
KERNEL_SRC=linux

if [ ! -d ${KERNEL_SRC} ]; then
    echo "Linux Kernel source directory does not exists, please 'git clone'"
    exit 1
fi

echo "I: Copy Kernel config (x86_64_vyos_defconfig) to Kernel Source"
cp vyos_arm_defconfig ${KERNEL_SRC}/.config
cp lsdk.config ${KERNEL_SRC}/arch/arm/configs
#cp x86_64_vyos_defconfig ${KERNEL_SRC}/arch/arm64/configs

cd ${KERNEL_SRC}

KERNEL_VERSION=$(make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- kernelversion)
KERNEL_SUFFIX=-armhf-vyos

# VyOS requires some small Kernel Patches - apply them here
# It's easier to habe them here and make use of the upstream
# repository instead of maintaining a full Kernel Fork.
# Saving time/resources is essential :-)
PATCH_DIR=${CWD}/patches/kernel
for patch in $(ls ${PATCH_DIR})
do
    echo "I: Apply Kernel patch: ${PATCH_DIR}/${patch}"
    patch -p1 < ${PATCH_DIR}/${patch}
done

echo "I: make x86_64_vyos_defconfig"
# Select Kernel configuration - currently there is only one
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j4
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- lsdk.config -j4

echo "I: Generate environment file containing Kernel variable"
cat << EOF >${CWD}/kernel-vars
#!/bin/sh
export KERNEL_VERSION=${KERNEL_VERSION}
export KERNEL_SUFFIX=${KERNEL_SUFFIX}
export KERNEL_DIR=${CWD}/${KERNEL_SRC}
EOF

echo "I: Build Debian Kernel package"
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bindeb-pkg BUILD_TOOLS=1 LOCALVERSION=${KERNEL_SUFFIX} KDEB_PKGVERSION=${KERNEL_VERSION}-1 KBUILD_DEBARCH=armhf -j $(getconf _NPROCESSORS_ONLN)
