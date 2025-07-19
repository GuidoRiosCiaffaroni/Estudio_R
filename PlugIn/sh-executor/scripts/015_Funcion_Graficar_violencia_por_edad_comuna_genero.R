# ────────────────────────────────────────────────────────────────────────────────
# 015_grafico_violencia.R
# Genera un gráfico PNG de tipos de violencia según edad, comuna y género
# Fuente de datos: tabla `wp_db_upload` en la BD MariaDB “wordpress”.
# El PNG se guarda en /var/www/wordpress/wp-content/plugins/sh-executor/archives
# ────────────────────────────────────────────────────────────────────────────────

## 1. Librerías =================================================================
paquetes <- c("RMariaDB", "DBI", "dbplyr", "dplyr", "janitor", "ggplot2")
instalar <- paquetes[!vapply(paquetes, requireNamespace,
                             quietly = TRUE, FUN.VALUE = logical(1))]
if (length(instalar)) install.packages(instalar)

library(DBI)          # Conexión bases de datos
library(RMariaDB)     # Driver MariaDB/MySQL
library(dbplyr)       # dplyr ↔ SQL
library(dplyr)        # Manipulación de datos
library(janitor)      # Limpieza de nombres de columnas
library(ggplot2)      # Gráficos

## 2. Directorio de salida =======================================================
dir_out_global <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out_global)) dir.create(dir_out_global, recursive = TRUE)

## 3. Conexión a la base de datos “wordpress” ====================================
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
# Si algo falla más adelante, la conexión se cerrará
on.exit(if (DBI::dbIsValid(con)) DBI::dbDisconnect(con), add = TRUE)

## 4. Función para graficar ======================================================
graficar_violencia_por_edad_comuna_y_genero <- function(
  edad_objetivo,
  nombre_comuna,
  genero_victima,
  salida  = "violencia_edad_comuna_genero.png",
  dir_out = dir_out_global,
  con_bd  = con,
  tabla   = "wp_db_upload"
) {
  nombre_comuna <- tolower(nombre_comuna)

  # 4.1 Filtrado en el servidor SQL
  datos_filtrados <- tbl(con_bd, tabla) %>%
    janitor::clean_names() %>%
    filter(
      edad == !!edad_objetivo,
      lower(nombre_comuna) == !!nombre_comuna,
      genero_victima == !!genero_victima
    ) %>%
    collect()

  if (nrow(datos_filtrados) == 0) {
    message(
      "Sin registros para la comuna '", nombre_comuna,
      "', edad ", edad_objetivo,
      " y género ", genero_victima, "."
    )
    return(invisible(NULL))
  }

  # 4.2 Gráfico
  p <- ggplot(datos_filtrados, aes(x = nombre_violencia)) +
    geom_bar(fill = "tomato") +
    labs(
      title = paste(
        "Violencia - Comuna:",
        tools::toTitleCase(nombre_comuna),
        "| Edad:", edad_objetivo,
        "| Género:", genero_victima
      ),
      x = "Tipo de Violencia",
      y = "Frecuencia"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

  # 4.3 Guardar PNG
  archivo_salida <- file.path(dir_out, salida)
  ggsave(archivo_salida, p, width = 10, height = 7, dpi = 300)

  message("Gráfico guardado en: ", archivo_salida)
  invisible(archivo_salida)
}

## 5. Parámetros del gráfico =====================================================
# ——— Personaliza aquí los valores que necesites ———
genero <- 1           # 1 = mujer, 0 = hombre (ajusta a tu codificación)
comuna <- "maipu"
edad   <- 22

nombre_archivo <- sprintf(
  "015_FuncionParametro_violencia_%s_%s_%d.png",
  comuna,
  ifelse(genero == 1, "mujer", "hombre"),
  edad
)

## 6. Llamada a la función (siempre se ejecuta) =================================
graficar_violencia_por_edad_comuna_y_genero(
  edad_objetivo  = edad,
  nombre_comuna  = comuna,
  genero_victima = genero,
  salida         = nombre_archivo
)

## 7. Cerrar conexión explícitamente (evita warnings) ===========================
if (DBI::dbIsValid(con)) DBI::dbDisconnect(con)
