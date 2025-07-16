#!/bin/bash

# --- CONFIGURACIÓN ---
MYSQL_ROOT_USER=""
MYSQL_ROOT_PASS=""

NUEVO_USUARIO="nuevo_admin"
NUEVA_CLAVE="MiClaveSegura"
HOST="localhost"  # Usa '%' si quieres permitir acceso remoto

# --- EJECUCIÓN ---
echo "Creando usuario '$NUEVO_USUARIO' con privilegios de root en MySQL..."

mysql -u "$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASS" <<EOF
CREATE USER IF NOT EXISTS '$NUEVO_USUARIO'@'$HOST' IDENTIFIED BY '$NUEVA_CLAVE';
GRANT ALL PRIVILEGES ON *.* TO '$NUEVO_USUARIO'@'$HOST' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "✅ Usuario '$NUEVO_USUARIO' creado con éxito y con privilegios root."
