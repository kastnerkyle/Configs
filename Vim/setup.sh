#!/bin/bash
mkdir $HOME/.vim plugin doc autoload bundle
ln -s plugin $HOME/.vim/plugin
ln -s doc $HOME/.vim/doc
ln -s autoload $HOME/.vim/autoload
ln -s bundle $HOME/.vim/bundle 
ln -s vimrc $HOME/.vimrc
wget -O autoload/pathogen.vim http://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
