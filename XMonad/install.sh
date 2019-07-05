#!/bin/bash
sudo apt-get install -y xmonad xmobar suckless-tools trayer xclip openssh-server screen vim scrot

CUR_DIR=`pwd`
mkdir ~/.xmonad
ln -sf $CUR_DIR/xmonad.hs $HOME/.xmonad/xmonad.hs
ln -sf $CUR_DIR/xmobarrc $HOME/.xmobarrc
ln -sf $CUR_DIR/screenrc $HOME/.screenrc
ln -sf $CUR_DIR/bright.sh $HOME/bright.sh
ln -sf $CUR_DIR/Xmodmap $HOME/.Xmodmap
