#!/bin/bash

# --- PASO 1: Actualizar la lista de paquetes existentes ---
echo "Paso 1: Actualizando la lista de paquetes del sistema..."
sudo apt update -y
echo "Lista de paquetes actualizada."
echo ""

# --- PASO 2: Instalar dependencias para repositorios HTTPS ---
echo "Paso 2: Instalando dependencias necesarias (gnupg, software-properties-common, apt-transport-https)..."
sudo apt install --no-install-recommends software-properties-common dirmngr apt-transport-https -y
echo "Dependencias instaladas."
echo ""

# --- PASO 3: Agregar la clave GPG del repositorio CRAN ---
# Esto asegura que los paquetes que descargues sean auténticos.
echo "Paso 3: Agregando la clave GPG de CRAN..."
# Para Ubuntu 22.04+ (y algunas versiones recientes de Debian), la clave se debe importar directamente al directorio de claves.
# Puedes verificar la versión de tu sistema con 'lsb_release -rs'
# Si tienes problemas, podrías necesitar un método alternativo para versiones muy antiguas de Ubuntu/Debian.
sudo wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc > /dev/null
# Nota: La forma preferida en sistemas modernos (Ubuntu 22.04+) es usar `gpg --dearmor`
# Alternativa moderna (si la anterior da problemas en sistemas muy nuevos):
# sudo mkdir -p /etc/apt/keyrings
# wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /etc/apt/keyrings/cran.gpg
echo "Clave GPG de CRAN agregada."
echo ""

# --- PASO 4: Agregar el repositorio de CRAN a las fuentes de APT ---
echo "Paso 4: Agregando el repositorio de CRAN al archivo sources.list.d..."
# Detectar la distribución y la versión para usar el repositorio correcto
LSB_RELEASE=$(lsb_release -cs) # Codename de la distribución (ej. jammy, focal, bullseye)
echo "Detectada distribución: $LSB_RELEASE"

# Los repositorios de CRAN tienen diferentes rutas para Debian y Ubuntu
if [ "$LSB_RELEASE" == "jammy" ] || [ "$LSB_RELEASE" == "focal" ] || [ "$LSB_RELEASE" == "bionic" ]; then
    # Para Ubuntu LTS (22.04, 20.04, 18.04)
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu $LSB_RELEASE-cran40/" | sudo tee /etc/apt/sources.list.d/cran.list
elif [ "$LSB_RELEASE" == "bookworm" ] || [ "$LSB_RELEASE" == "bullseye" ]; then
    # Para Debian (12, 11)
    echo "deb http://cloud.r-project.org/bin/linux/debian $LSB_RELEASE-cran40/" | sudo tee /etc/apt/sources.list.d/cran.list
else
    echo "ADVERTENCIA: Distribución $LSB_RELEASE no reconocida para el repositorio de R. Intentando con la URL genérica."
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu/ $LSB_RELEASE/" | sudo tee /etc/apt/sources.list.d/cran.list
fi
echo "Repositorio de CRAN agregado."
echo ""

# --- PASO 5: Actualizar la lista de paquetes nuevamente para incluir el repositorio de CRAN ---
echo "Paso 5: Actualizando la lista de paquetes después de agregar el repositorio de CRAN..."
sudo apt update -y
echo "Lista de paquetes actualizada con el repositorio de CRAN."
echo ""

# --- PASO 6: Instalar R Base y paquetes recomendados ---
echo "Paso 6: Instalando R Base, r-base-dev y r-base-html..."
sudo apt install r-base r-base-dev r-base-html -y
echo "R Base y sus dependencias han sido instalados."
echo ""

# --- PASO 7: Verificar la instalación ---
echo "Paso 7: Verificando la versión de R instalada..."
R --version
echo "Instalación de R completada. Para iniciar la consola de R, escribe 'R' en la terminal."
echo "Para salir de la consola de R, escribe 'q()' y luego 'n' para no guardar el espacio de trabajo."
echo ""