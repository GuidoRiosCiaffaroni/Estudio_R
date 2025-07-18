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
dir_out <- "/home/r/Estudio_R/salidas"          #
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "003_distribucion_edades.png")

# ────────────────────────────────────────────────────────────────────────────────
#  GRÁFICO ----------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Asegurarse de que la columna Edad sea numérica
datos$Edad <- as.numeric(as.character(datos$Edad))

graf <- ggplot(datos, aes(x = Edad)) +
  geom_histogram(binwidth = 1, fill = "seagreen", colour = "black") +
  labs(title = "Distribución de Edad de las Víctimas",
       x = "Edad",
       y = "Frecuencia") +
  theme_minimal()

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 10,     # pulgadas
  height   = 8,
  dpi      = 300
)

message("Gráfico guardado correctamente en: ", file_out)


