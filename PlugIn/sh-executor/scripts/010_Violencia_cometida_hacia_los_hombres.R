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

# ── 4. Filtramos las víctimas mujeres (campo textual) ──────────────────────────
mujeres <- datos %>% 
  filter(nombre_genero_victima_texto == "Hombres")  # «Hombre» / «Mujer»

# ── 5. Gráfico: 10 tipos de violencia más frecuentes ───────────────────────────
graf <- mujeres %>% 
  count(nombre_violencia, sort = TRUE) %>% 
  slice_head(n = 10) %>% 
  ggplot(aes(x = reorder(nombre_violencia, n), y = n)) +
  geom_col(fill = "violetred3") +
  coord_flip() +
  labs(title = "Violencia cometida hacia los hombres",
       x = "Tipo de violencia",
       y = "Número de casos") +
  theme_minimal()

# ── 6. Guardar resultado en el directorio compartido ───────────────────────────
dir_out <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"    
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

ggsave(
  filename = file.path(dir_out, "010_violencia_hombres.png"),
  plot     = graf,
  width    = 8,                                   # pulgadas
  height   = 5,
  dpi      = 300
)

message("Gráfico guardado en: ", file.path(dir_out, "010_violencia_hombres.png"))
