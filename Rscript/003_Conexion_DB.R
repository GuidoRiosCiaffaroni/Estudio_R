# Instalar RMariaDB si no está instalado
# install.packages("RMariaDB")

library(RMariaDB)

# Conexión a la base de datos
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura"
)

# Consultar la tabla wp_db_upload
datos <- dbGetQuery(con, "SELECT * FROM wp_db_upload")

# Ver los primeros registros
head(datos)

# Cerrar la conexión
dbDisconnect(con)
