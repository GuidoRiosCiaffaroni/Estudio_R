# ────────────────────────────────────────────────────────────────────────────────
# 016_grafico_violencia_3d.R  (versión corregida)
# ────────────────────────────────────────────────────────────────────────────────

## 1. Librerías =================================================================
paquetes <- c("RMariaDB", "DBI", "dbplyr", "dplyr", "janitor",
              "scatterplot3d")
instalar <- paquetes[!vapply(paquetes, requireNamespace,
                             quietly = TRUE, FUN.VALUE = logical(1))]
if (length(instalar)) install.packages(instalar)

library(DBI)
library(RMariaDB)
library(dbplyr)
library(dplyr)
library(janitor)
library(scatterplot3d)

## 2. Directorio de salida =======================================================
dir_out_global <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out_global)) dir.create(dir_out_global, recursive = TRUE)

## 3. Conexión a la base “wordpress” ============================================
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(if (DBI::dbIsValid(con)) DBI::dbDisconnect(con), add = TRUE)

## 4. Función para graficar en 3D ===============================================
graficar_violencia_3d <- function(
  genero_victima = NULL,                         # NULL = todos
  salida         = "grafico_3d.png",
  dir_out        = dir_out_global,
  con_bd         = con,
  tabla          = "wp_db_upload"
) {
  # 4.1 Normalizar nombres primero
  datos_tbl <- tbl(con_bd, tabla) %>%
    janitor::clean_names()                       # → edad, genero_victima, nombre_comuna

  # 4.2 Filtro opcional por género
  if (!is.null(genero_victima)) {
    datos_tbl <- datos_tbl %>% filter(genero_victima == !!genero_victima)
  }

  # 4.3 Filtrado de NAs y descarga
  datos <- datos_tbl %>%
    filter(!is.na(edad), !is.na(genero_victima), !is.na(nombre_comuna)) %>%
    select(edad, genero_victima, nombre_comuna) %>%
    collect()

  # 4.4 Validación
  if (nrow(datos) == 0) {
    message("No hay datos para el criterio especificado.")
    return(invisible(NULL))
  }

  # 4.5 Codificar comuna
  datos <- datos %>%
    mutate(comuna_cod = as.numeric(factor(nombre_comuna)))

  # 4.6 Generar PNG
  archivo_png <- file.path(dir_out, salida)
  tryCatch({
    png(filename = archivo_png, width = 1000, height = 800)
    scatterplot3d(
      x = datos$edad,
      y = datos$comuna_cod,
      z = datos$genero_victima,
      pch   = 16,
      color = "steelblue",
      xlab  = "Edad",
      ylab  = "Comuna (codificada)",
      zlab  = "Género de la Víctima",
      main  = "Gráfico 3D: Edad, Comuna, Género de la Víctima"
    )
    dev.off()
    message("Gráfico guardado en: ", archivo_png)
  }, error = function(e) {
    dev.off()
    message("Error al generar el gráfico: ", e$message)
  })

  invisible(archivo_png)
}

## 5. Generar los tres gráficos ==================================================
graficar_violencia_3d(salida = "016_violencia_3d_todas.png")        # todos
graficar_violencia_3d(genero_victima = 1,
                      salida = "016_violencia_3d_mujeres.png")      # mujeres
graficar_violencia_3d(genero_victima = 0,
                      salida = "016_violencia_3d_hombres.png")      # hombres

## 6. Cerrar conexión explícitamente ============================================
if (DBI::dbIsValid(con)) DBI::dbDisconnect(con)
