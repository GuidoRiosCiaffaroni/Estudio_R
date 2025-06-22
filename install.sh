#!/bin/bash

PHPVERSION=8.2



############################################################################################################
sudo apt update -y
sudo apt upgrade -y
#############################################################################################################

#############################################################################################################
apt-get install -y apg                         # Generador de contraseñas aleatorias seguras
apt-get install -y atop                        # Monitor avanzado de uso de recursos del sistema
apt-get install -y bmon                        # Monitor de ancho de banda en tiempo real
apt-get install -y byobu                       # Entorno de terminal con paneles y multiplexación
apt-get install -y ccze                        # Colorea logs para facilitar la lectura
apt-get install -y cmatrix                     # Animación de texto al estilo "The Matrix"
apt-get install -y console-setup               # Configura el teclado y la consola del sistema
apt-get install -y console-setup-linux         # Archivos específicos de Linux para setup de consola
apt-get install -y cron                        # Herramienta para ejecutar tareas programadas
apt-get install -y cron-daemon-common          # Archivos comunes del servicio cron
apt-get install -y gawk                        # Versión GNU de AWK para procesamiento de texto
apt-get install -y gettext-base                # Herramienta para traducción y localización de software
apt-get install -y htop                        # Monitor interactivo de procesos del sistema
apt-get install -y iproute2                    # Herramientas modernas para configuración de red
apt-get install -y jp2a                        # Convierte imágenes JPEG a arte ASCII
apt-get install -y kbd                         # Configuración de teclado (mapas de teclas, etc.)
apt-get install -y keyboard-configuration      # Configura el teclado para consola y X
apt-get install -y libatm1t64                  # Soporte para conexiones ATM (Asynchronous Transfer Mode)
apt-get install -y libbpf1                     # Biblioteca para trabajar con eBPF
apt-get install -y libconfuse-common           # Archivos comunes para libConfuse (parser de config)
apt-get install -y libconfuse2                 # Biblioteca para parsear archivos de configuración
apt-get install -y libevent-core-2.1-7t64      # Biblioteca para programación basada en eventos
apt-get install -y libfribidi0                 # Soporte para texto bidireccional (ej. árabe, hebreo)
apt-get install -y libio-pty-perl              # Permite manejar pseudo-terminales en Perl
apt-get install -y libipc-run-perl             # Ejecuta procesos y comunica entre ellos en Perl
apt-get install -y libmnl0                     # Biblioteca minimalista para Netlink (interfaz kernel)
apt-get install -y libncurses6                 # Biblioteca para interfaces de texto enriquecido
apt-get install -y libnewt0.52                 # Biblioteca para diálogos en consola (TUI)
apt-get install -y libnl-3-200                 # Biblioteca para manipular netlink en C
apt-get install -y libnl-genl-3-200            # Extensión para mensajes genéricos Netlink
apt-get install -y libnl-route-3-200           # Ruta y manejo de red vía netlink
apt-get install -y libsigsegv2                 # Manejo de errores por violación de segmento (debugging)
apt-get install -y libslang2                   # Biblioteca para interfaces en modo texto
apt-get install -y libtime-duration-perl       # Manejo de duraciones de tiempo en Perl
apt-get install -y libtimedate-perl            # Manejo de fechas y tiempos en Perl
apt-get install -y libtirpc-common             # Archivos comunes para RPC (Remote Procedure Call)
apt-get install -y libtirpc3t64                # Implementación moderna de RPC para Linux
apt-get install -y liburing2                   # Biblioteca para syscalls asincrónicos (io_uring)
apt-get install -y libutempter0                # Maneja entradas en utmp al abrir pseudoterminales
apt-get install -y libxtables12                # Biblioteca base para iptables
apt-get install -y moreutils                   # Conjunto de herramientas útiles para la línea de comandos
apt-get install -y pastebinit                  # Envia texto o archivos a servicios pastebin desde terminal
apt-get install -y plocate                     # Reemplazo moderno y rápido de `locate`
apt-get install -y python3-newt                # Binding de Python para libnewt (interfaz TUI)
apt-get install -y python3-psutil              # Acceso a información de procesos y sistema en Python
apt-get install -y python3-typing-extensions   # Extensiones de tipado para Python 3
apt-get install -y python3-urwid               # Biblioteca para interfaces de usuario en texto (Python)
apt-get install -y python3-wcwidth             # Manejo de caracteres anchos en consola
apt-get install -y run-one                     # Evita que se ejecuten múltiples instancias del mismo comando
apt-get install -y speedometer                 # Visualiza velocidad de red o disco en consola
apt-get install -y tmux                        # Multiplexor de terminal, permite múltiples sesiones
apt-get install -y tree                        # Muestra estructura de directorios como árbol
apt-get install -y xkb-data                    # Datos de definición de teclados para X
apt-get install -y hollywood                   # Simula actividad de hacker en la terminal


############################################################################################################

#############################################################################################################
sudo apt install apache2 -y
service apache2 restart
#############################################################################################################

#############################################################################################################
sudo apt install php -y 
sudo apt install libapache2-mod-php -y 
sudo apt install php-mysql -y 
sudo apt install php-cli -y 
sudo apt install php-curl -y 
sudo apt install php-gd -y 
sudo apt install php-mbstring -y 
sudo apt install php-xml -y 
sudo apt install php-zip -y 
sudo apt install php-bcmath -y 
sudo apt install php-intl -y
service apache2 restart
service apache2 restart
############################################################################################################

#############################################################################################################
sudo sed -i 's/^max_execution_time = .*/max_execution_time = 300/' /etc/php/${PHPVERSION}/apache2/php.ini         # Tiempo máximo que un script puede ejecutarse
sudo sed -i 's/^max_execution_time = .*/max_execution_time = 300/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^max_input_time = .*/max_input_time = 600/' /etc/php/${PHPVERSION}/apache2/php.ini                   # Tiempo máximo que PHP espera datos de entrada (POST/GET)
sudo sed -i 's/^max_input_time = .*/max_input_time = 600/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^memory_limit = .*/memory_limit = 512M/' /etc/php/${PHPVERSION}/apache2/php.ini                      # Límite de memoria para scripts PHP
sudo sed -i 's/^memory_limit = .*/memory_limit = 512M/' /etc/php/${PHPVERSION}/cli/php.ini 
sudo sed -i 's/^post_max_size = .*/post_max_size = 256M/' /etc/php/${PHPVERSION}/apache2/php.ini                    # Tamaño máximo de datos POST (subidas incluidas)
sudo sed -i 's/^post_max_size = .*/post_max_size = 256M/' /etc/php/${PHPVERSION}/cli/php.ini  
sudo sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 256M/' /etc/php/${PHPVERSION}/apache2/php.ini        # Tamaño máximo permitido para subida de archivos
sudo sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 256M/' /etc/php/${PHPVERSION}/cli/php.ini  
sudo sed -i 's/^max_file_uploads = .*/max_file_uploads = 50/' /etc/php/${PHPVERSION}/apache2/php.ini                # Número máximo de archivos permitidos por subida
sudo sed -i 's/^max_file_uploads = .*/max_file_uploads = 50/' /etc/php/${PHPVERSION}/cli/php.ini 

# Activar extensiones comentadas (quita el `;` al inicio si existe)
sudo sed -i 's/^;extension=curl/extension=curl/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=curl/extension=curl/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=ftp/extension=ftp/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=ftp/extension=ftp/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=fileinfo/extension=fileinfo/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=fileinfo/extension=fileinfo/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=gd/extension=gd/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=gd/extension=gd/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=zip/extension=zip/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=zip/extension=zip/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=xml/extension=xml/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=xml/extension=xml/' /etc/php/${PHPVERSION}/cli/php.ini
sudo sed -i 's/^;extension=intl/extension=intl/' /etc/php/${PHPVERSION}/apache2/php.ini
sudo sed -i 's/^;extension=intl/extension=intl/' /etc/php/${PHPVERSION}/cli/php.ini

service apache2 restart
#############################################################################################################

#############################################################################################################

#############################################################################################################

