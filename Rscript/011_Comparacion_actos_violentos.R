# ────────────────────────────────────────────────────────────────────────────────
# 011 – Comparación de actos violentos por género  |  Opción A (sin renombrar)
# ────────────────────────────────────────────────────────────────────────────────

# 1. Carga de librerías ----------------------------------------------------------
if (!requireNamespace("janitor", quietly = TRUE)) install.packages("janitor")
if (!requireNamespace("RMariaDB", quietly = TRUE)) install.packages("RMariaDB")

library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(janitor)

# 2. Conexión --------------------------------------------------------------------
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# 3. Lectura y limpieza ----------------------------------------------------------
datos <- dbReadTable(con, "wp_db_upload") %>%
  clean_names()                                   # → snake_case

# 4. Conversión de género a factor ------------------------------------------------
# 0 = Hombre | 1 = Mujer
datos$genero_victima <- factor(datos$genero_victima,
                               levels = c(0, 1),
                               labels = c("Hombre", "Mujer"))

# 5. Directorio y archivo de salida ----------------------------------------------
dir_out <- "/home/r/Estudio_R/salidas"            # mismo dir que 005
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "007_violencia_hombres_mujeres.png")

# 6. Gráfico ----------------------------------------------------------------------
graf <- ggplot(datos, aes(x = nombre_violencia, fill = genero_victima)) +
  geom_bar(position = "dodge") +
  labs(title = "Comparación de Tipos de Violencia Sufrida por Hombres y Mujeres",
       x = "Tipo de violencia",
       y = "Frecuencia",
       fill = "Género de la víctima") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 12,      # pulgadas
  height   = 7,
  dpi      = 300
)

message("Gráfico guardado en: ", file_out)
