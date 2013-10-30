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
FNAME=libertine.tgz
wget -O $FNAME http://sourceforge.net/projects/linuxlibertine/files/linuxlibertine/5.3.0/LinLibertineWOFF_5.3.0_2012_07_02.tgz/download
tar xzf $FNAME
mv *.*tf /usr/local/share/fonts
