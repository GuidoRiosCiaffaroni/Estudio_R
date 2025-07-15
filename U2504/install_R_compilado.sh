#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y locales

sudo apt install -y dirmngr 
sudo apt install gnupg -y 
sudo apt install apt-transport-https -y 
sudo apt install ca-certificates -y
sudo apt install software-properties-common -y

#paquete suplementarios
sudo apt install libcurl4-openssl-dev -y 
sudo apt install libssl-dev -y
sudo apt install libxml2-dev -y
sudo apt install libfontconfig1-dev -y 
sudo apt install libharfbuzz-dev -y
sudo apt install libfribidi-dev -y
sudo apt install libfreetype6-dev -y
sudo apt install libpng-dev -y
sudo apt install libtiff5-dev -y
sudo apt install libjpeg-dev -y

sudo apt install libcurl4-openssl-dev -y 
sudo apt install libssl-dev -y 
sudo apt install libxml2-dev -y
sudo apt install libfontconfig1-dev -y
sudo apt install libharfbuzz-dev -y
sudo apt install libfribidi-dev -y
sudo apt install libfreetype6-dev -y
sudo apt install libpng-dev -y
sudo apt install libtiff5-dev -y
sudo apt install libjpeg-dev -y
sudo apt install build-essential -y

sudo apt install wget -y

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/"

sudo apt update
sudo apt install -y r-base

# 
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.0-496-amd64.deb
chmod 777 rstudio-2025.05.0-496-amd64.deb
sudo dpkg -i rstudio-*.deb
sudo apt install -f

wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.04.0-735-amd64.deb
sudo apt install ./rstudio-server-2024.04.0-735-amd64.deb

sudo R --no-save <<EOF
install.packages("tidyverse", repos="https://cloud.r-project.org")
install.packages("ggplot2", repos="https://cloud.r-project.org")
EOF