#!/usr/bin/env Rscript

#########################################################################
#instalacion SQL
install.packages("RMySQL")
install.packages("RMariaDB")

sudo apt update
sudo apt install -y libmysqlclient-dev libssl-dev libcurl4-openssl-dev
Rscript -e "install.packages('RMySQL', repos='https://cloud.r-project.org/')"
Rscript -e "install.packages('RMariaDB', repos='https://cloud.r-project.org/')"


#########################################################################

