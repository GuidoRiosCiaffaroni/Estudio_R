#!/usr/bin/env bash

#
# instala_php83.sh
# Instala PHP 8.3 y extensiones habituales para WordPress en Ubuntu 24.04 LTS
#-------------------------------------------------------------

PHPVERSION=8.3

#############################################################################################################
set -e        # abortar si ocurre algún error

echo "==> Actualizando índices de paquetes…"
sudo apt update

echo "==> Instalando PHP 8.3 y módulos requeridos…"
sudo apt install php8.3 -y
sudo apt install libapache2-mod-php8.3 -y
sudo apt install php8.3-mysql -y
sudo apt install php8.3-cli -y
sudo apt install php8.3-curl -y
sudo apt install php8.3-gd -y
sudo apt install php8.3-mbstring -y
sudo apt install php8.3-xml -y
# Nota: desde PHP 8.0 el módulo xmlrpc fue eliminado del core.
# Si realmente lo necesitas, instálalo vía PECL o usa una librería en PHP.
# sudo apt install php8.3-xmlrpc -y   # puede no existir en los repos oficiales
sudo apt install php8.3-zip -y
sudo apt install php8.3-bcmath -y
sudo apt install php8.3-intl -y
sudo apt install php8.3-soap -y

echo "==> Reiniciando Apache para cargar el módulo PHP 8.3…"
service apache2 restart

echo "-------------------------------------------------------------"
echo "PHP instalado. Comprobando versión y módulos cargados:"
php -v
echo
php -m | grep -E 'curl|gd|mbstring|mysql|xml|zip|bcmath|intl|soap'
echo
echo "¡Listo! PHP 8.3 y sus extensiones están operativos."

sudo apt install php8.3-{fpm,cli,common,mysql,curl,gd,imagick,mbstring,xml,zip,bcmath,intl,soap,exif,fileinfo,opcache} -y


#############################################################################################################

#############################################################################################################

#############################################################################################################

###############################################################################
# 1. Límites de tiempo, memoria y carga
###############################################################################
sudo sed -i 's/^max_execution_time = .*/max_execution_time = 300/'        /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^max_execution_time = .*/max_execution_time = 300/'        /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^max_input_time = .*/max_input_time = 600/'                /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^max_input_time = .*/max_input_time = 600/'                /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^memory_limit = .*/memory_limit = 512M/'                   /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^memory_limit = .*/memory_limit = 512M/'                   /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^post_max_size = .*/post_max_size = 256M/'                 /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^post_max_size = .*/post_max_size = 256M/'                 /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 256M/'     /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 256M/'     /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^max_file_uploads = .*/max_file_uploads = 50/'             /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^max_file_uploads = .*/max_file_uploads = 50/'             /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^max_input_vars = .*/max_input_vars = 3000/'               /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^max_input_vars = .*/max_input_vars = 3000/'               /etc/php/${PHPVERSION}/cli/php.ini

###############################################################################
# 2. Zona horaria
###############################################################################
sudo sed -i 's~^;*date.timezone =.*~date.timezone = America/Santiago~'    /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's~^;*date.timezone =.*~date.timezone = America/Santiago~'    /etc/php/${PHPVERSION}/cli/php.ini

###############################################################################
# 3. Seguridad básica
###############################################################################
sudo sed -i 's/^;*expose_php = .*/expose_php = Off/'                      /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*expose_php = .*/expose_php = Off/'                      /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^display_errors = .*/display_errors = Off/'                /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^display_errors = .*/display_errors = Off/'                /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*log_errors = .*/log_errors = On/'                       /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*log_errors = .*/log_errors = On/'                       /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's~^;*error_log = .*~error_log = /var/log/php_errors.log~'    /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's~^;*error_log = .*~error_log = /var/log/php_errors.log~'    /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*disable_functions = .*/disable_functions = exec,passthru,shell_exec,system,proc_open,popen/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*disable_functions = .*/disable_functions = exec,passthru,shell_exec,system,proc_open,popen/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini

###############################################################################
# 4. Extensiones necesarias (descomentar si estuvieran comentadas)
###############################################################################
for EXT in curl ftp fileinfo gd mbstring mysqli zip xml intl bcmath soap exif imagick opcache; do
  sudo sed -i "s/^;extension=${EXT}/extension=${EXT}/"                   /etc/php/${PHPVERSION}/apache2/php.ini
  sudo sed -i "s/^;extension=${EXT}/extension=${EXT}/"                   /etc/php/${PHPVERSION}/cli/php.ini
done

###############################################################################
# 5. OPcache y realpath cache (rendimiento)
###############################################################################
sudo sed -i 's/^;*opcache.enable=.*/opcache.enable=1/'                    /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*opcache.memory_consumption=.*/opcache.memory_consumption=128/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=16/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*opcache.max_accelerated_files=.*/opcache.max_accelerated_files=10000/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*opcache.revalidate_freq=.*/opcache.revalidate_freq=60/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*opcache.validate_timestamps=.*/opcache.validate_timestamps=1/' \
                                                                            /etc/php/${PHPVERSION}/apache2/php.ini

sudo sed -i 's/^;*realpath_cache_size = .*/realpath_cache_size = 4096k/'  /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;*realpath_cache_ttl = .*/realpath_cache_ttl = 120/'      /etc/php/${PHPVERSION}/apache2/php.ini

# (Opcional) replicar OPcache y realpath cache en CLI:
sudo sed -i 's/^;*opcache.enable=.*/opcache.enable=1/'                    /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*opcache.memory_consumption=.*/opcache.memory_consumption=128/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=16/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*opcache.max_accelerated_files=.*/opcache.max_accelerated_files=10000/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*opcache.revalidate_freq=.*/opcache.revalidate_freq=60/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*opcache.validate_timestamps=.*/opcache.validate_timestamps=1/' \
                                                                            /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*realpath_cache_size = .*/realpath_cache_size = 4096k/'  /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;*realpath_cache_ttl = .*/realpath_cache_ttl = 120/'      /etc/php/${PHPVERSION}/cli/php.ini

###############################################################################
# 6. Reiniciar Apache para aplicar los cambios
###############################################################################
sudo service apache2 restart

echo "---------------------------------------------------------------"
echo "Parámetros PHP ajustados y Apache reiniciado. ¡Listo para WordPress!"