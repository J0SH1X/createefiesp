#!/bin/bash

BOOT_SIZE=$1
DIR=mount
DIR2=esp

#Create the empty image
dd if=/dev/zero of=efiesp.img bs=1M count="$BOOT_SIZE"

#Format as fat32
mkfs.vfat efiesp.img

#Create the needed folder structure
if [[ ! -e $DIR ]]; then
    mkdir $DIR
elif [[ ! -d $DIR ]]; then
    echo "$DIR already exists but is not a directory" 1>&2
fi
if [[ ! -e $DIR2 ]]; then
    mkdir $DIR2
elif [[ ! -d $DIR2 ]]; then
    echo "$DIR2 already exists but is not a directory" 1>&2
fi

#Mount the new efiesp image to mountpoint
sudo mount -o loop,rw efiesp.img ./mount


#Wait for user to fill the esp folder with needed files
read -r -n 1 -p "Now copy your bootloader and kernel to esp folder and press any Key to continue"

#Copy the esp files into the image
sudo cp -r esp/* mount/

#Cleanup
sudo umount mount
rm -rf $DIR
rm -rf $DIR2

