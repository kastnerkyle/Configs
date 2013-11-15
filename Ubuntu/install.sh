#!/bin/bash
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install linux-source linux-headers-`uname -r`
sudo apt-get install xmonad xmobar suckless-tools trayer build-essential xclip openssh-server screen valgrind vim scrot flashplugin-installer nvidia-cuda-toolkit nvidia-current-updates
sudo apt-get install python-pip

#5100 drivers for T400  http://wireless.kernel.org/en/users/Drivers/iwlwifi/?n=downloads#Download
#http://kuscsik.blogspot.com/2007/06/how-to-install-intel-4965-wireless.html
