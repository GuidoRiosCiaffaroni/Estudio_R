#!/bin/bash
echo "✅ Instalando dependencias de sistema..."
sudo apt update
sudo apt install -y libmariadb-dev libssl-dev libcurl4-openssl-dev libxml2-dev

echo "✅ Instalando paquete RMariaDB en R..."
Rscript -e "install.packages('RMariaDB', repos = 'https://cloud.r-project.org/')"

echo "✅ Verificando que se cargue correctamente..."
Rscript -e "library(RMariaDB); print('✔ Todo bien con RMariaDB')"
