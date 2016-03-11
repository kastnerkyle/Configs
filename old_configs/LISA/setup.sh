#!/bin/bash
echo 'if [ -e "/opt/lisa/os/.local.bashrc" ];then source /opt/lisa/os/.local.bashrc; else source /data/lisa/data/local_export/.local.bashrc; fi' >> ~/.bashrc
if [ ! -d "/data/lisatmp2/$USER" ]; then
    mkdir /data/lisatmp2/$USER
fi
if [ ! -d "/data/lisatmp2/$USER/src" ]; then
    ln -s /data/lisatmp2/$USER/src $HOME/src
fi
source ~/.bashrc
bash vim_install27.sh
