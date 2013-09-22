#!/bin/bash
CURDIR=`pwd`
mkdir $HOME/.vim plugin doc autoload bundle
ln -s $CURDIR/plugin $HOME/.vim/plugin
ln -s $CURDIR/doc $HOME/.vim/doc
ln -s $CURDIR/autoload $HOME/.vim/autoload
ln -s $CURDIR/bundle $HOME/.vim/bundle 
ln -s $CURDIR/vimrc $HOME/.vimrc
git clone https://github.com/gmarik/vundle.git bundle/vundle
#Need this for proper autocomplete with jedi-vim
echo 'export PYTHONPATH="$HOME/anaconda/lib/python2.7/site-packages":$PYTHONPATH' >> $HOME/.bashrc
vim +BundleInstall +qall
