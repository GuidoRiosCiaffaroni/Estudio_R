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
dir_out <- "/home/r/Estudio_R/salidas"                # mismo directorio que 005
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "005_violencia_hacia_mujeres.png")

# ────────────────────────────────────────────────────────────────────────────────
#  GRÁFICO ----------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Filtrar solo los casos donde la víctima es mujer
datos_mujeres <- datos %>% filter(Genero.Victima == 1)

graf <- ggplot(datos_mujeres, aes(x = Nombre_Violencia)) +
  geom_bar(fill = "orchid") +
  labs(title = "Tipos de Violencia Sufrida por Mujeres",
       x = "Tipo de Violencia",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 12,   # pulgadas
  height   = 7,
  dpi      = 300
)

message("Gráfico guardado correctamente en: ", file_out)
