#!/bin/bash
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install linux-source linux-headers-`uname -r`
sudo apt-get install xmonad xmobar suckless-tools trayer texlive-full build-essential xclip openssh-server screen valgrind vim scrot flashplugin-installer nvidia-cuda-toolkit nvidia-current-updates

CUR_DIR=`pwd`
ln -s $CUR_DIR/../Vim/vimrc ~/.vimrc
mkdir ~/.xmonad
ln -s $CUR_DIR/../XMonad/xmonad.hs ~/.xmonad/.xmonad.hs
ln -s $CUR_DIR/../XMonad/xmobarrc  ~/.xmobarrc
echo 'export THEANO_FLAGS="mode=FAST_RUN,floatX=float32,device=gpu"' >> ~/.bashrc
echo 'export PYLEARN2_DATA_PATH="/home/kkastner/pylearn2_data"' >> ~/.bashrc
