#!/bin/bash
pip install markdown
pip install pelican
sudo apt-get install -y pandoc
cd /home/kkastner/src
git clone http://kastnerkyle@github.com/kastnerkyle/pelican-plugins
git clone http://kastnerkyle@github.com/kastnerkyle/octopress-pelican-theme
git clone http://kastnerkyle@github.com/kastnerkyle/kastnerkyle.github.io
git clone http://kastnerkyle@github.com/kastnerkyle/kastnerkyle.github.io-pelican
