#!/bin/bash
CURDIR=`pwd`
mkdir $HOME/.vim plugin doc autoload bundle
ln -s $CURDIR/plugin $HOME/.vim/plugin
ln -s $CURDIR/doc $HOME/.vim/doc
ln -s $CURDIR/autoload $HOME/.vim/autoload
ln -s $CURDIR/bundle $HOME/.vim/bundle 
ln -s $CURDIR/vimrc $HOME/.vimrc
ln -s $CURDIR/colors $HOME/.vim/colors
ln -s $CURDIR/syntax $HOME/.vim/syntax
# For MILA machines, had to install VIM + Python with conda, then 
# add runtimepath in vimrc and also $VIMRUNTIME point to default
# what a mess
# function vim {
#    VIMRUNTIME=/usr/share/vim/vim74/ ~/anaconda/bin/vim $@
#}
git clone --recursive https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#Need this for proper autocomplete with jedi-vim
echo '# This line set by Vim autosetup script' >> $HOME/.bashrc
echo 'export PYTHONPATH="$HOME/anaconda2/lib/python2.7/site-packages":$PYTHONPATH' >> $HOME/.bashrc
vim +BundleInstall +qall
echo ''
echo ''
echo 'Installing argparse package - pip install argparse'
echo ''
pip install argparse
