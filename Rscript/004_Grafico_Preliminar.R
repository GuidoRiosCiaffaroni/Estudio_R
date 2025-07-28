# install.packages(c("RMariaDB", "dplyr", "ggplot2"))
library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)

con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura"
)

# Leer toda la tabla
datos <- dbReadTable(con, "wp_db_upload")      # evita problemas de mayúsculas

# Conversión de variables categóricas y lógicas
datos <- datos %>% 
  mutate(
    Genero_Victima = factor(Genero_Victima,
                            levels = c(0, 1, 2),
                            labels = c("Hombre", "Mujer", "Otro")),
    Genero_Agresor = factor(Genero_Agresor,
                            levels = c(0, 1, 2),
                            labels = c("Hombre", "Mujer", "Otro")),
    si_no          = as.logical(si_no)
  )

# Gráfico de distribución por sexo (víctima)
png("001_genero_victima.png", 800, 600)
ggplot(datos, aes(x = Genero_Victima)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribución por sexo de la víctima",
       x = "Sexo",
       y = "Frecuencia") +
  theme_minimal()
dev.off()

dbDisconnect(con)
