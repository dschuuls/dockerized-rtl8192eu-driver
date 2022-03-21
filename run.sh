#!/bin/bash

SYSTEM_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
KERNEL_VERSION=$(uname -r)

echo "system version is $SYSTEM_VERSION"
echo "kernel version is $KERNEL_VERSION"

echo loading rtl8192eu driver ...

insmod /lib/modules/$KERNEL_VERSION/kernel/net/wireless/cfg80211.ko
insmod 8192eu.ko && lsmod | grep 8192eu

while true; do
	sleep 60
done
