# Information

This script will create a fastboot flashable efiesp.img for convient testing of grub/mainline/windows

# Requirements

You need to know the size of your boot partition 

Linux , wsl wont work

# Usage

`./create-efiesp.sh size`    `./create-efiesp.sh 64` for example

Grant the script root permissions when asked it needs it for setting up the image file.

When it asks you to copy over your EFI folder to the esp directory and press any key to continue.

You will get an efiesp.img file which you can flash by doing `fastboot flash boot efiesp.img`

If you have a A/B device its wise to flash only to the inactive slot , for edk2 it wont matter it will work anyway


