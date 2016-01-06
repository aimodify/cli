#!/bin/bash

cat /proc/cpuinfo
lscpu

lspci
sudo lshw -class processor
sudo lshw -short

lsblk
blkid

hdparm -i /dev/sda

# Laptop Model Number
sudo dmidecode | less | grep 'SKU Number'

