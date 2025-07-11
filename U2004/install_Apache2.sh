#!/bin/bash

#############################################################################################################
sudo apt install -y apache2 
sudo apt install -y apache2-utils
service apache2 restart
#############################################################################################################


#############################################################################################################
sudo cp wordpress.conf /etc/apache2/sites-available/


sudo mkdir -p /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress
find /var/www/wordpress -type d -exec chmod 755 {} \;
find /var/www/wordpress -type f -exec chmod 644 {} \;


sudo a2enmod headers          # necesario para directivas Header
sudo a2enmod expires deflate  # si en tu vHost usas Expires/Deflate
sudo a2enmod rewrite          # imprescindible para enlaces permanentes


sudo a2ensite wordpress
sudo a2dissite 000-default      # opcional, desactiva la página “It works”
sudo service apache2 restart 