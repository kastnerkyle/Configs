#!/bin/bash
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install linux-source linux-headers-`uname -r`
sudo apt-get install xmonad xmobar suckless-tools trayer texlive-full build-essential xclip openssh-server screen valgrind vim scrot flashplugin-installer nvidia-cuda-toolkit nvidia-current-updates

