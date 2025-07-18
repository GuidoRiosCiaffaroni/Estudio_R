# ────────────────────────────────────────────────────────────────────────────────
# 010 – Violencia cometida hacia los hombres  |  Opción A (sin renombrar columnas)
# ────────────────────────────────────────────────────────────────────────────────

# ── 1. Carga de librerías ───────────────────────────────────────────────────────
# Instalar janitor solo si falta (primera vez)
if (!requireNamespace("janitor", quietly = TRUE)) {
  install.packages("janitor")
}

# install.packages(c("RMariaDB", "dplyr", "ggplot2"))  # si faltan
library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(janitor)

# ── 2. Conexión a la base de datos ──────────────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",       # <-- ajusta si usas otro usuario
  password = "MiClaveSegura",     # <-- ajusta tu clave
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# ── 3. Lectura y limpieza de datos ──────────────────────────────────────────────
datos <- dbReadTable(con, "wp_db_upload") %>% 
  clean_names()                                   # convierte a snake_case

###########################################################################


# Asegurar que la columna Genero.Victima esté en formato factor
datos$Genero.Victima <- factor(datos$Genero.Victima,
                               levels = c(0, 1),
                               labels = c("Hombre", "Mujer"))

# Crear gráfico y guardar como imagen PNG
png("007_violencia_hombres_mujeres.png", width = 1200, height = 800)

ggplot(datos, aes(x = Nombre_Violencia, fill = Genero.Victima)) +
  geom_bar(position = "dodge") +
  labs(title = "Comparación de Tipos de Violencia Sufrida por Hombres y Mujeres",
       x = "Tipo de Violencia",
       y = "Frecuencia",
       fill = "Género de la Víctima") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

dev.off()
###########################################################################