# ────────────────────────────────────────────────────────────────
#  009 ‒ Violencia cometida hacia las mujeres
# ────────────────────────────────────────────────────────────────
# Instalación (una sola vez):
# install.packages(c("RMariaDB", "dplyr", "ggplot2", "janitor"))

library(DBI)
library(RMariaDB)
library(dplyr)
library(ggplot2)
library(janitor)   # ← para clean_names()

# ── CONEXIÓN ────────────────────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# ── LECTURA Y LIMPIEZA ─────────────────────────────────────────
datos <- dbReadTable(con, "wp_db_upload") %>% 
  clean_names()                               # todo a snake_case

# La BD trae dos campos de género: numérico y texto
#   genero_victima               → 0 / 1  ▸ numérico
#   nombre_genero_victima_texto  → "Hombre"/"Mujer" ▸ texto:contentReference[oaicite:0]{index=0}

datos <- datos %>% 
  rename(
    genero_victima = nombre_genero_victima_texto,  # usamos la versión textual
    violencia      = nombre_violencia,
    comuna         = nombre_comuna
  )

# ── FILTRO: sólo mujeres ───────────────────────────────────────
mujeres <- datos %>% 
  filter(genero_victima == "Mujer")              # <- aquí estaba el error

# ── DIRECTORIO DE SALIDA ───────────────────────────────────────
dir_out <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# ── GRÁFICO: 10 tipos de violencia más frecuentes ──────────────
graf <- mujeres %>% 
  count(violencia, sort = TRUE) %>% 
  slice_head(n = 10) %>% 
  ggplot(aes(x = reorder(violencia, n), y = n)) +
  geom_col(fill = "violetred3") +
  coord_flip() +
  labs(title = "Violencia cometida hacia las mujeres",
       x = "Tipo de violencia",
       y = "Número de casos") +
  theme_minimal()

ggsave(file.path(dir_out, "009_violencia_mujeres.png"),
       plot   = graf,
       width  = 8,
       height = 5,
       dpi    = 300)

message("Gráfico generado correctamente en: ", dir_out)
