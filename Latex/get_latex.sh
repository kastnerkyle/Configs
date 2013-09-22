#!/bin/bash

WEB_TEX=http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
TAR_NAME=tex.tar.gz
wget $WEB_TEX -O $TAR_NAME 
tar xzf $TAR_NAME 
pushd .
cd install-tl*
echo "I" | sudo ./install-tl
popd
echo 'export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux' >> ~/.bashrc
