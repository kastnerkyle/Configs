#!/bin/bash
CUR_DIR=`pwd`
#ln -s $CUR_DIR/Vim/word_complete.vim $HOME/.vim/plugin/
#open supertab.vmb in vim
#:so %
#:q
mkdir ~/.vim
ln -s $CUR_DIR/Vim/plugin $HOME/.vim/plugin
ln -s $CUR_DIR/Vim/doc $HOME/.vim/doc
ln -s $CUR_DIR/Vim/autoload $HOME/.vim/autoload
ln -s $CUR_DIR/Vim/vimrc $HOME/.vimrc

mkdir ~/.xmonad
ln -s $CUR_DIR/XMonad/xmonad.hs $HOME/.xmonad/xmonad.hs
ln -s $CUR_DIR/XMonad/xmobarrc $HOME/.xmobarrc
if grep -q "THEANO_FLAGS" $HOME/.bashrc; then
    echo "THEANO_FLAGS is already defined"
else
	echo 'export THEANO_FLAGS="mode=FAST_RUN,floatX=float32,device=gpu"' >> $HOME/.bashrc
fi
if grep -q "PYLEARN2_DATA_PATH" $HOME/.bashrc; then
    echo "PYLEARN2_DATA_PATH is already defined"
else
	echo 'export PYLEARN2_DATA_PATH="/home/kkastner/pylearn2_data"' >> $HOME/.bashrc
fi
