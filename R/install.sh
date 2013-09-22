#!/bin/bash
#http://gradstudents.wcas.northwestern.edu/~jaf502/blog/2013/03/11/installing-r-in-linux/
# Grabs your version of Ubuntu as a BASH variable
CODENAME=`grep CODENAME /etc/lsb-release | cut -c 18-`

# Appends the CRAN repository to your sources.list file 
CMDSTR="deb http://cran.rstudio.com/bin/linux/ubuntu $CODENAME/"
sudo sh -c "echo $CMDSTR >> /etc/apt/sources.list"

# Appends the CRAN repository to your sources.list file 
CMDSTR="deb-src http://cran.rstudio.com/bin/linux/ubuntu $CODENAME/"
sudo sh -c "echo $CMDSTR >> /etc/apt/sources.list"

# Adds the CRAN GPG key, which is used to sign the R packages for security.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

sudo apt-get update
sudo apt-get install r-base r-base-dev r-recommended libjpeg62
wget http://download1.rstudio.org/rstudio-0.97.551-amd64.deb
sudo dpkg -i rstudio*.deb
