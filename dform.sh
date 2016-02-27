#!/bin/bash
#dForm - interactive tool for MKFS
#writer: azk4n (github.com/azk4n)

echo "+========================================================================+"
echo "|    dForm - device formatter (partitions, pendrive, SD Cards, etc)      |"
echo "+========================================================================+"
echo "-> searching devices..."
echo
sleep 1
cat /proc/partitions
echo
echo "-> enter the device unit to be formatted: example -> sda2, sdb1"
read unid
echo
sleep 1
echo "available formats:"
echo "- vfat (need pkg dosfstools to work)
- ext2
- ext3
- ext4
- ext4dev
- ntfs (need pkg ntfsprogs to work)																					
- btrfs
- cramfs
- minix
- msdos (need pkg dosfstools to work)
- xfs"
echo "-> format?"
read form
echo	
echo "working..."
sleep 1
echo "umount unit..."
sudo umount /dev/$unid 2> /dev/null
sleep 1
echo "formatting..."
sudo mkfs.$form /dev/$unid > /dev/null
if [[ $? -ne 0 ]]
   then
       echo "did not work.. :("
   else 
       echo
       echo "+====================+"
       echo "|formatting finished | device: /dev/$unid - format: $form"
       echo "+====================+"
       echo
fi
