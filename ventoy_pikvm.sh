#!/bin/bash
echo "===== mount ====="
#mount ventoy.img to directory
if [ -d "/media/ventoy" ]; then
	continue 
else
	sudo mkdir /media/ventoy
fi
sudo mount "/dev/$ventoy_loop"p1 /media/ventoy
echo "===== copy ====="
#copy images
echo "Full path to directory you wish to trasnsfer ALL files from (ex: /home/ubuntu/Downloads)"
echo -n "/path/to/dir: " && read iso_dir
sudo cp -v $iso_dir/* /media/ventoy

#Transferring to PiKVM
echo "===== Transfer ventoy.img to PiKVM ====="
echo "what is the IP of your PiKVM?"
echo -n "IP: " && read PiKVMIP
echo $PiKVMIP
echo "===== changing dir to rw ====="
ssh root@$PiKVMIP "mount -o remount,rw /var/lib/kvmd/msd"
echo "===== transferring ventoy.img ====="
scp -v ventoy.img root@$PiKVMIP:/var/lib/kvmd/msd
echo "===== create complete file && changing dir to ro ====="
ssh root@$PiKVMIP "touch /var/lib/kvmd/msd/.__ventoy.img.complete && mount -o remount,ro /var/lib/kvmd/msd"
#echo "===== changing dir to ro ====="
#ssh root@$PiKVMIP "mount -o remount,ro /var/lib/kvmd/msd"

echo "===== cleanup ====="
sudo umount /media/ventoy
sudo losetup -d /dev/$ventoy_loop
#sudo rm -rf /media/ventoy
