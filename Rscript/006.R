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
  timezone = "UTC"          # Evita desfases si tu servidor usa otra zona
)

# Garantiza desconexión aunque ocurra un error
on.exit(dbDisconnect(con), add = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  LECTURA DE DATOS -------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Usa dbReadTable sólo si la tabla no es enorme; para filtros grandes, prefiere
# dbGetQuery("SELECT campos_necesarios FROM ... WHERE ...")
datos <- dbReadTable(con, "wp_db_upload")

###########################################################################


# Crear gráfico y guardar como imagen PNG
png("002_distribucion_comunas.png", width = 1000, height = 800)

ggplot(datos, aes(x = Nombre_Comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Distribución de casos por Comuna",
       x = "Comuna",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotar nombres

dev.off()
###########################################################################
message("Gráficos generados correctamente en: ", dir_out)
