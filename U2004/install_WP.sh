#!/usr/bin/env bash
# descarga_wordpress.sh
# Descarga y prepara la última versión de WordPress en Ubuntu 24.04 LTS

set -e  # Aborta si ocurre cualquier error

################################################################################
# Parámetros: ajusta si lo necesitas
################################################################################
WP_URL="https://wordpress.org/latest.zip"      # URL oficial (siempre apunta a la versión estable más reciente)
DEST_PATH="/var/www/wordpress"                 # Ruta donde quedará el sitio
APACHE_USER="www-data"                         # Usuario/grupo que ejecuta Apache / PHP-FPM

################################################################################
# 1. Dependencias mínimas
################################################################################
sudo apt update
sudo apt install -y unzip wget

################################################################################
# 2. Descargar y descomprimir WordPress
################################################################################
echo "==> Descargando WordPress..."
cd /tmp
wget -qO wordpress.zip "$WP_URL"

echo "==> Descomprimiendo..."
unzip -q wordpress.zip       # crea directorio ./wordpress

################################################################################
# 3. Copiar al destino y fijar permisos
################################################################################
echo "==> Copiando a $DEST_PATH..."
sudo rm -rf "$DEST_PATH"               # elimina instalación previa si la hubiese
sudo mv wordpress "$DEST_PATH"

echo "==> Asignando permisos y propietarios..."
sudo chown -R "$APACHE_USER":"$APACHE_USER" "$DEST_PATH"
sudo find "$DEST_PATH" -type d -exec chmod 755 {} \;
sudo find "$DEST_PATH" -type f -exec chmod 644 {} \;

################################################################################
# 4. Limpieza y resumen
################################################################################
rm wordpress.zip
echo "---------------------------------------------------------------"
echo "WordPress instalado en $DEST_PATH"
echo "Ahora crea el VirtualHost y el archivo wp-config.php para completar la instalación."
