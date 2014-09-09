#!/bin/bash
CURDIR=`pwd`
mkdir $HOME/.vim plugin doc autoload bundle
ln -s $CURDIR/plugin $HOME/.vim/plugin
ln -s $CURDIR/doc $HOME/.vim/doc
ln -s $CURDIR/autoload $HOME/.vim/autoload
ln -s $CURDIR/bundle $HOME/.vim/bundle 
ln -s $CURDIR/vimrc $HOME/.vimrc
git clone --recursive https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
