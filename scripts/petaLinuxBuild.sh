#!/bin/bash

echo "Welcome to the build script of PetaLinux.. Do not forget to source the PetaLinux tool before using the script.."

echo "Please enter the project name and press ENTER:"
read proj_name
echo "Project name $proj_name has been selected.."


echo "Please provide the path of the xsa file :"
read xsa_path
echo "$xsa_path has been selected.."

echo "Please provide the path of the bitstream file:"
read bit_path
echo "$bit_path has been selected.."

petalinux-create --type project --template zynqMP --name $proj_name 
cd $proj_name
petalinux-config --get-hw-description $xsa_path 
petalinux-config -c uboot
petalinux-build
petalinux-package --boot --u-boot --fpga $bit_path --format BIN

cd images/linux
echo "You can find boot.scr, BOOT.BIN, image.ub and rootfs.tar.gz files inside the directory.."