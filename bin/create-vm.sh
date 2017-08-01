#!/bin/bash

##
# Usage:
# ./create-vm.sh /path/to/live_cd.iso
#
# This scrip creates a VM with 16G disk space, loads the disk image and the installtion iso into RAM 
# and starts the VM with the installation process.
# After the installation process it moves back the disk and iso onto the storage device and creates a run.sh script.
# You can then simply run the run.sh script and it will boot the VM in the same manner (by loading the disk image into ramfs and stuff).
#
# Requirements:
# * qemu
#
# Requirements for this configuration (can be changed) :
# * about 20GB of free ram + a little more for the live cd iso.
# * KVM support
# * a cpu with at least 4 threads.
 
set -e

INSTALL_CD="$1"

OS_NAME="${INSTALL_CD%.iso}"
OS_NAME="${OS_NAME##*/}"
OS_PATH="$(pwd)/$OS_NAME"

DISK_SPACE="16G"

mkdir "$OS_PATH"
mkdir "$OS_PATH/disks"
cp "$INSTALL_CD" "$OS_PATH/disks/install.iso"
cd "$OS_PATH/disks"
qemu-img create -f raw disk.iso $DISK_SPACE
cd ..


QEMU_CMD="qemu-system-x86_64 -smp 4 -enable-kvm -cpu host -m 4G "
OS_DISKS="$OS_PATH/disks"
RAM_FS="/dev/shm/$OS_NAME"

# create run.sh script
echo "rm -rf $OS_DISKS.bak" > run.sh
echo "mv $OS_DISKS $OS_DISKS.bak" >> run.sh
echo "cp -a $OS_DISKS.bak $RAM_FS" >> run.sh
echo "ln -s $RAM_FS $OS_DISKS" >> run.sh
echo "$QEMU_CMD -drive format=raw,file=$OS_PATH/disks/disk.iso" >> run.sh
echo "rm $OS_DISKS && mv $RAM_FS $OS_DISKS" >> run.sh
chmod +x run.sh

# move the disk into ram
mv $OS_DISKS $OS_DISKS.bak
cp -a $OS_DISKS.bak $RAM_FS
ln -s $RAM_FS $OS_DISKS

# run installations iso with the disk in qemu
$QEMU_CMD \
  -cdrom $OS_DISKS/install.iso -boot order=d \
  -drive format=raw,file="$OS_DISKS/disk.iso"


# unram the disks
rm $OS_DISKS
mv $RAM_FS $OS_DISKS
