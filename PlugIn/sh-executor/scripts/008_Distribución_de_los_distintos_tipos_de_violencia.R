# ────────────────────────────────────────────────────────────────────────────────
#  CARGA DE LIBRERÍAS -----------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# install.packages(c("RMariaDB", "dplyr", "ggplot2", "lubridate", "stringr"))
library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(lubridate)
library(stringr)

# ────────────────────────────────────────────────────────────────────────────────
#  CONEXIÓN ---------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  LECTURA DE DATOS -------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
datos <- dbReadTable(con, "wp_db_upload")

# ────────────────────────────────────────────────────────────────────────────────
#  DIRECTORIO Y SALIDA DE GRÁFICOS ---------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
dir_out <- "/home/r/Estudio_R/salidas"          # mismo directorio que 005
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "008_registro_violencia.png")

# ────────────────────────────────────────────────────────────────────────────────
#  GRÁFICO ----------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Asegúrate de que exista la columna con los tipos de violencia.
# Si el nombre difiere, cámbialo aquí:
col_violencia <- "Nombre_Violencia"

graf <- ggplot(datos, aes(x = .data[[col_violencia]])) +
  geom_bar(fill = "tomato") +
  labs(title = "Distribución por Tipo de Violencia",
       x = "Tipo de violencia",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 10,     # pulgadas
  height   = 7,
  dpi      = 300
)

message("Gráfico guardado correctamente en: ", file_out)
