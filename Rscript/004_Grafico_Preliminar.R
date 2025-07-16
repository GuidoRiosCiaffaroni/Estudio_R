# install.packages("RMariaDB")     # Ejecutar sólo la primera vez
library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)

# 1. Conexión
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura"
)

# 2. Consulta
datos <- dbGetQuery(con, "SELECT * FROM wp_db_upload")

# 3. Limpieza / transformación
# Ajusta el nombre de la columna según aparezca en names(datos)
datos <- datos %>%
  rename(genero_victima = genero_victima) %>%   # <-- cámbialo si es distinto
  mutate(genero_victima = factor(
    genero_victima,
    levels = c(0, 1, 2),
    labels = c("Hombre", "Mujer", "Otro")
  ))

# 4. Plot
png("001_genero_victima.png", 800, 600)
ggplot(datos, aes(x = genero_victima)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribución por Sexo (Víctima)",
    x = "Sexo",
    y = "Frecuencia"
  ) +
  theme_minimal()
dev.off()

# 5. Cierra la conexión
dbDisconnect(con)
