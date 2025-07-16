# Instalar si no lo tienes
#install.packages("RMySQL")

library(RMySQL)

# Conexión
con <- dbConnect(MySQL(), dbname = "wordpress", host = "localhost",user = "nuevo_admin", password = "MiClaveSegura")

# Consultar la tabla wp_db_upload
datos <- dbGetQuery(con, "SELECT * FROM wp_db_upload")

# Ver los primeros datos
head(datos)

# Cerrar la conexión
dbDisconnect(con)
