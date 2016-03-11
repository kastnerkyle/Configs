#!/bin/bash
addline="# This line added by Theano+Pylearn2 install script"
if grep -q "THEANO_FLAGS" $HOME/.bashrc; then
    echo "THEANO_FLAGS is already defined"
else
    echo $addline >> $HOME/.bashrc
    echo 'export THEANO_FLAGS="mode=FAST_RUN,floatX=float64,blas.ldflags=-L/usr/lib/ -lblas"' >> $HOME/.bashrc
fi
if grep -q "PYLEARN2_DATA_PATH" $HOME/.bashrc; then
    echo "PYLEARN2_DATA_PATH is already defined"
else
    echo $addline >> $HOME/.bashrc
	echo 'export PYLEARN2_DATA_PATH="/home/kkastner/pylearn2_data"' >> $HOME/.bashrc
fi

sudo apt-get install libopenblas-dev g++
