#deb https://cloud.r-project.org/bin/linux/debian bullseye-cran40/
#/etc/apt/sources.list
sudo apt update
sudo apt install --no-install-recommends dirmngr ca-certificates gnupg
wget -qO- https://cloud.r-project.org/bin/linux/debian/apt.asc | sudo tee /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

sudo apt update
sudo apt upgrade # Esto actualizará todos los paquetes del sistema, incluyendo R si hay una nueva versión disponible.
# Si 'upgrade' no instala la última versión de R, puedes forzar la instalación específica
sudo apt install r-base r-base-dev
