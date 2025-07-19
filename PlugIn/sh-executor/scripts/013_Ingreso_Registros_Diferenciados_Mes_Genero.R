# ────────────────────────────────────────────────────────────────────────────────
# 013 – Distribución de ingresos por hora del día
# ────────────────────────────────────────────────────────────────────────────────

# 1. Carga de librerías ----------------------------------------------------------
if (!requireNamespace("janitor",   quietly = TRUE)) install.packages("janitor")
if (!requireNamespace("RMariaDB",  quietly = TRUE)) install.packages("RMariaDB")
if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")

library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)

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
  clean_names()                                                   # snake_case

# 4. Cálculo de hora decimal -----------------------------------------------
datos <- datos %>%
  mutate(
    fecha        = dmy_hm(fecha),                                 # “09-09-2021 14:09”
    hora_decimal = hour(fecha) + minute(fecha) / 60
  )

# 5. Directorio y nombre de archivo ---------------------------------------------
dir_out <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "013_ingresos_horario.png")

# 6. Gráfico ---------------------------------------------------------------------
graf <- ggplot(datos, aes(x = hora_decimal)) +
  geom_histogram(binwidth = 0.25, fill = "darkorange", colour = "black") +  # cada 15 min
  scale_x_continuous(breaks = seq(0, 24, by = 1),
                     labels = sprintf("%02d:00", 0:24)) +
  labs(title  = "Distribución detallada de ingresos por hora del día",
       x      = "Hora del día",
       y      = "Número de ingresos") +
  theme_minimal()

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 10, height = 6, dpi = 300
)

message("Gráfico guardado en: ", file_out)
