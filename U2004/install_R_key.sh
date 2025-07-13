#!/bin/bash

#############################################################################################################
# Actualizacion del sistema
# sudo apt update -y
# sudo apt upgrade -y
#############################################################################################################

#############################################################################################################





#!/bin/bash

# Este script verifica y, si es necesario, añade la línea del repositorio de R Project para Debian Bullseye.

REPO_LINE="deb https://cloud.r-project.org/bin/linux/debian bullseye-cran40/"
SOURCES_LIST="/etc/apt/sources.list"
SOURCES_LIST_D_DIR="/etc/apt/sources.list.d"
R_LIST_FILE="${SOURCES_LIST_D_DIR}/r.list"

echo "Verificando la configuración del repositorio de R Project para Debian Bullseye..."

# Función para añadir la línea al archivo especificado
add_repo_line() {
    local target_file=$1
    if [ ! -f "$target_file" ]; then
        echo "El archivo $target_file no existe. Creándolo..."
        sudo touch "$target_file" || { echo "Error: No se pudo crear el archivo $target_file. ¿Permisos?"; exit 1; }
    fi
    echo "Añadiendo la línea del repositorio al archivo: $target_file"
    echo "$REPO_LINE" | sudo tee -a "$target_file" > /dev/null
    echo "Línea añadida con éxito."
}

# 1. Buscar la línea en /etc/apt/sources.list
if grep -qF "$REPO_LINE" "$SOURCES_LIST"; then
    echo "La línea del repositorio ya existe en $SOURCES_LIST."
else
    # 2. Buscar la línea en archivos dentro de /etc/apt/sources.list.d/
    found_in_d=false
    if [ -d "$SOURCES_LIST_D_DIR" ]; then
        for file in "$SOURCES_LIST_D_DIR"/*.list; do
            if [ -f "$file" ]; then
                if grep -qF "$REPO_LINE" "$file"; then
                    echo "La línea del repositorio ya existe en $file."
                    found_in_d=true
                    break
                fi
            fi
        done
    fi

    if [ "$found_in_d" = false ]; then
        echo "La línea del repositorio no se encontró en $SOURCES_LIST ni en $SOURCES_LIST_D_DIR/."
        echo "¿Desea añadirla a un nuevo archivo '$R_LIST_FILE' en $SOURCES_LIST_D_DIR/?"
        read -p "Escriba 's' para sí o 'n' para no: " choice
        case "$choice" in
            s|S )
                add_repo_line "$R_LIST_FILE"
                ;;
            * )
                echo "No se añadió la línea del repositorio. Por favor, revísalo manualmente."
                exit 0
                ;;
        esac
    fi
fi

echo "Actualizando la lista de paquetes (sudo apt update)..."
sudo apt update || { echo "Error: No se pudo actualizar la lista de paquetes. ¿Problemas de conexión o repositorio incorrecto?"; exit 1; }
echo "¡Script completado!"






























# 1. Recuperar la clave pública GPG
# Puedes obtenerla de un servidor de claves o directamente del repositorio si se ofrece.
# La forma más común es usar apt-key (aunque está deprecado en versiones modernas, aún funciona).
# En sistemas más recientes (Debian 11+ / Ubuntu 20.04+), la forma recomendada es con 'signed-by'.
# Intentemos la forma moderna primero:

# Asegúrate de tener dirmngr instalado para manejar llaves GPG si es necesario
sudo apt install --no-install-recommends dirmngr ca-certificates gnupg

# Descargar la clave GPG y añadirla al directorio de claves de apt de forma segura
# (Asumiendo que la clave de R-Project es 80F25BA8A78EAC741, que es la misma que la del error)
wget -qO- https://cloud.r-project.org/bin/linux/debian/apt.asc | sudo tee /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Si lo anterior falla o es un sistema muy antiguo, podrías intentar con apt-key (no recomendado para nuevas instalaciones):
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 80F25BA8A78EAC741

# 2. Actualizar la lista de paquetes nuevamente
sudo apt update
























#sudo apt install -y libcurl4-openssl-dev 
#sudo apt install -y libssl-dev 
#sudo apt install -y libxml2-dev 
#sudo apt install -y libgit2-dev
#sudo apt install -y  libfontconfig1-dev
#sudo apt install -y libharfbuzz-dev
#sudo apt install -y libfribidi-dev



#############################################################################################################

#############################################################################################################
# Instalacion de librerias
#sudo Rscript -e "install.packages(c('tidyverse'), repos='https://cloud.r-project.org/')"
#sudo Rscript -e "install.packages(c('scales'), repos='https://cloud.r-project.org/'"
sudo Rscript -e "install.packages('scales', repos = 'https://cloud.r-project.org/')"
#sudo Rscript -e "install.packages(c('ggplot2'), repos='https://cloud.r-project.org/')"
############################################################################################################

