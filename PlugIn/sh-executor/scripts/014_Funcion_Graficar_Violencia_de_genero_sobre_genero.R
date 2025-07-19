# ────────────────────────────────────────────────────────────────────────────────
# 014 – Graficar violencia de género (víctima/agresor) usando la BD “wordpress”
# ────────────────────────────────────────────────────────────────────────────────

# 1. Librerías ──────────────────────────────────────────────────────────────────
if (!requireNamespace("janitor",   quietly = TRUE)) install.packages("janitor")
if (!requireNamespace("RMariaDB",  quietly = TRUE)) install.packages("RMariaDB")
if (!requireNamespace("dplyr",     quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("ggplot2",   quietly = TRUE)) install.packages("ggplot2")

library(DBI)
library(RMariaDB)
library(janitor)
library(dplyr)
library(ggplot2)

# 2. Directorio de salida  ──────────────────────────
dir_out <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# 3. Conexión a la base de datos “wordpress” ────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",      # ← ajusta si usas otro usuario
  password = "MiClaveSegura",    # ← ajusta tu clave
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# 4. Cargamos y limpiamos la tabla principal ────────────────────────────────────
datos_bd <- dbReadTable(con, "wp_db_upload") %>%
  clean_names()        # nombres a snake_case: genero_victima, genero_agresor, etc.

# 5. Función de graficado ───────────────────────────────────────────────────────
graficar_violencia_por_genero <- function(data,
                                          genero_victima = 1,
                                          genero_agresor = 1,
                                          nombre_archivo = "grafico.png") {
  # Filtrar según los códigos de género solicitados
  sub <- data %>%
    filter(genero_victima == genero_victima,
           genero_agresor == genero_agresor)

  if (nrow(sub) == 0) {
    message("No se encontraron registros para esos géneros.")
    return(invisible(NULL))
  }

  graf <- ggplot(sub, aes(x = nombre_violencia)) +
    geom_bar(fill = "steelblue") +
    labs(
      title = paste0("Tipos de Violencia – Víctima: ", genero_victima,
                     " | Agresor: ", genero_agresor),
      x = "Tipo de violencia",
      y = "Frecuencia"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

  ggsave(
    filename = file.path(dir_out, nombre_archivo),
    plot     = graf,
    width    = 10,
    height   = 7,
    dpi      = 300
  )
  message("Gráfico guardado en: ",
          file.path(dir_out, nombre_archivo))
}

# 6. Ejemplos de uso ────────────────────────────────────────────────────────────
graficar_violencia_por_genero(datos_bd, 1, 1, "014_mujeres_sobre_mujeres.png")
graficar_violencia_por_genero(datos_bd, 0, 1, "014_mujeres_sobre_hombres.png")
graficar_violencia_por_genero(datos_bd, 1, 0, "014_hombres_sobre_mujeres.png")
graficar_violencia_por_genero(datos_bd, 0, 0, "014_hombres_sobre_hombres.png")
