#!/bin/bash
# https://www.techrepublic.com/article/how-to-use-a-ramdisk-on-linux/
## It'd be nice to set the size.
if [[ -z $2 ]]; then
  mountdir=/media/ramdisk
else
  mountdir=$2
fi
if [[ -z $1 ]]; then
  echo "usage: $0 <mount/umount> [path=/media/ramdisk]"
fi


if [[ "mount" == $1 ]]; then
# mounts a new ramdisk of 8g size at /media/ramdisk
sudo mount -t tmpfs -o size=8192M tmpfs $mountdir
fi

if [[ "umount" == $1 ]]; then
# mounts a new ramdisk of 8g size at /media/ramdisk
sudo umount $mountdir
fi
#
# 
# To make this permanent, add the following to /etc/fstab
#none /media/ramdisk tmpfs nodev,nosuid,noexec,nodiratime,size=2048M 0 0

