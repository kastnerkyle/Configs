#!/bin/bash
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get install -y linux-source linux-headers-`uname -r`
sudo apt-get install -y xmonad xmobar suckless-tools trayer build-essential xclip openssh-server screen valgrind vim scrot flashplugin-installer nvidia-cuda-toolkit nvidia-current-updates
sudo apt-get install -y acpi
sudo sed -i 's:. /usr/share/acpi-support/screenblank:echo -n mem > /sys/power/state:' /etc/acpi/lid.sh
#http://repo.continuum.io/anaconda3/
wget http://repo.continuum.io/archive/Anaconda3-2.0.0-Linux-x86_64.sh
bash Anaconda*.sh
#echo "export PATH=$HOME/anaconda/bin:"'$PATH' >> ~/.bashrc

#5100 drivers for T400  http://wireless.kernel.org/en/users/Drivers/iwlwifi/?n=downloads#Download
#http://kuscsik.blogspot.com/2007/06/how-to-install-intel-4965-wireless.html
