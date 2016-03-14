#!/bin/bash
sudo apt-get install -y xmonad xmobar suckless-tools trayer xclip openssh-server screen valgrind vim scrot flashplugin-installer xbacklight

CUR_DIR=`pwd`
mkdir ~/.xmonad
ln -sf $CUR_DIR/xmonad.hs $HOME/.xmonad/xmonad.hs
ln -sf $CUR_DIR/xmobarrc $HOME/.xmobarrc
