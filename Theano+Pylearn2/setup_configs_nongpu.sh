#!/bin/bash
if grep -q "THEANO_FLAGS" $HOME/.bashrc; then
    echo "THEANO_FLAGS is already defined"
else
	echo 'export THEANO_FLAGS="mode=FAST_RUN,floatX=float64"' >> $HOME/.bashrc
fi
if grep -q "PYLEARN2_DATA_PATH" $HOME/.bashrc; then
    echo "PYLEARN2_DATA_PATH is already defined"
else
	echo 'export PYLEARN2_DATA_PATH="/home/kkastner/pylearn2_data"' >> $HOME/.bashrc
fi
