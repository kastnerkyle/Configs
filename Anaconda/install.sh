#!/bin/bash
#wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.8.0-Linux-x86_64.sh
#bash Anaconda-1.8.0-Linux-x86_64.sh -b
#wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.9.2-Linux-x86_64.sh
wget http://repo.continuum.io/archive/Anaconda3-2.4.1-Linux-x86_64.sh
bash Anaconda*.sh 
echo "export PATH=$HOME/anaconda3/bin:"'$PATH' >> ~/.bashrc
