# ────────────────────────────────────────────────────────────────────────────────
# 012 – Ingreso de registros por mes y género
# ────────────────────────────────────────────────────────────────────────────────

# 1. Carga de librerías ----------------------------------------------------------
# Instala los paquetes que falten (solo la primera vez)
if (!requireNamespace("janitor",   quietly = TRUE)) install.packages("janitor")
if (!requireNamespace("RMariaDB",  quietly = TRUE)) install.packages("RMariaDB")
if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")

library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)

# 2. Conexión a la base de datos -------------------------------------------------
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
  clean_names()                               # → snake_case

# 4. Transformaciones ------------------------------------------------------------
#   • fecha  : POSIXct con día-mes-año hora:min
#   • mes    : factor ordenado enero-diciembre
#   • genero : factor con etiquetas
datos <- datos %>%
  mutate(
    fecha = dmy_hm(fecha),                                  # "09-09-2021 14:09"
    mes   = factor(month(fecha, label = TRUE, abbr = FALSE),
                   levels = month.name, ordered = TRUE),
    genero_victima = factor(genero_victima,
                            levels = c(0, 1, 2),
                            labels = c("Hombre", "Mujer", "Otro"))
  )

# 5. Directorio y nombre de archivo de salida ------------------------------------
dir_out <- "/home/r/Estudio_R/salidas"        # mismo directorio que 005
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "008_ingreso_meses_genero.png")

# 6. Gráfico ---------------------------------------------------------------------
graf <- ggplot(datos, aes(x = mes, fill = genero_victima)) +
  geom_bar(position = "dodge") +
  labs(title = "Cantidad de ingresos por mes y género",
       x = "Mes del año",
       y = "Número de registros",
       fill = "Género de la víctima") +
  theme_minimal()

ggsave(
  filename = file_out,
  plot     = graf,
  width    = 12,     # pulgadas
  height   = 7,
  dpi      = 300
)

message("Gráfico guardado en: ", file_out)

