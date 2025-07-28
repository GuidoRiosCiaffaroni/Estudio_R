# ────────────────────────────────────────────────────────────────────────────────
#  CARGA DE LIBRERÍAS -----------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# install.packages(c("RMariaDB", "dplyr", "ggplot2", "lubridate", "stringr"))
library(DBI)        # Conexión a BD
library(RMariaDB)   # Driver MariaDB / MySQL
library(dplyr)      # Manipulación de datos
library(ggplot2)    # Gráficos
library(lubridate)  # Fechas robustas
library(stringr)    # Utilidades de texto

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
# Directorio de salida (igual que en 005)
dir_out <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# Nombre de archivo
file_out <- file.path(dir_out, "006_distribucion_comunas.png")

# ────────────────────────────────────────────────────────────────────────────────
#  GRÁFICO ----------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
graf <- ggplot(datos, aes(x = Nombre_Comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Distribución de casos por Comuna",
       x = "Comuna",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 10,      # pulgadas
  height   = 8,
  dpi      = 300
)

message("Gráfico guardado correctamente en: ", file_out)

