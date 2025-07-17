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
# Leer archivo
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir fecha
datos$Fecha <- as.POSIXct(datos$Fecha, format = "%d-%m-%Y %H:%M", tz = "UTC")

# Filtrar filas con valores clave no faltantes
datos <- datos %>% filter(!is.na(Nombre_Genero_Victima_Texto), !is.na(Edad), !is.na(Nombre_Comuna))

# 1. Barras por género de la víctima
graf1 <- ggplot(datos, aes(x = Nombre_Genero_Victima_Texto)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Casos por género de la víctima", x = "Género", y = "Cantidad")
ggsave("001_grafico_genero_victima.png", plot = graf1, width = 6, height = 4, dpi = 300)

# 2. Barras agrupadas víctima vs agresor
graf2 <- ggplot(datos, aes(x = Nombre_Genero_Victima_Texto, fill = Nombre_Genero_Agresor_Texto)) +
  geom_bar(position = "dodge") +
  labs(title = "Víctima vs Agresor por género", x = "Víctima", fill = "Agresor")
ggsave("001_grafico_victima_agresor.png", plot = graf2, width = 6, height = 4, dpi = 300)

# 3. Barras por comuna
graf3 <- ggplot(datos, aes(x = Nombre_Comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Casos por comuna", x = "Comuna", y = "Cantidad") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("001_grafico_comuna.png", plot = graf3, width = 8, height = 5, dpi = 300)

# 4. Dispersión Edad vs Comuna
graf4 <- ggplot(datos, aes(x = Edad, y = Nombre_Comuna, color = Nombre_Genero_Victima_Texto)) +
  geom_point(size = 2) +
  labs(title = "Edad de víctimas por comuna", x = "Edad", y = "Comuna")
ggsave("001_grafico_edad_vs_comuna.png", plot = graf4, width = 6, height = 5, dpi = 300)

# 5. Pastel por género víctima
tabla_victima <- datos %>%
  group_by(Nombre_Genero_Victima_Texto) %>%
  summarise(Frecuencia = n())

graf5 <- ggplot(tabla_victima, aes(x = "", y = Frecuencia, fill = Nombre_Genero_Victima_Texto)) +
  geom_col() +
  coord_polar("y", start = 0) +
  labs(title = "Proporción por género de víctima", fill = "Género")
ggsave("001_grafico_pastel_genero.png", plot = graf5, width = 5, height = 5, dpi = 300)

# 6. Histograma de casos por fecha
graf6 <- ggplot(datos, aes(x = Fecha)) +
  geom_histogram(binwidth = 86400, fill = "purple") +
  labs(title = "Distribución temporal de casos", x = "Fecha", y = "Número de casos")
ggsave("001_grafico_casos_por_fecha.png", plot = graf6, width = 7, height = 4, dpi = 300)

dbDisconnect(con)
