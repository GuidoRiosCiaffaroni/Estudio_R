# ────────────────────────────────────────────────────────────────────────────────
# 015_Funcion_Graficar_violencia_por_edad_comuna_genero.R
# Genera un gráfico de barras de tipos de violencia a partir de la tabla
# `wp_db_upload` de la base de datos “wordpress”, filtrando por edad, comuna
# y género de la víctima. El PNG resultante se guarda en /home/r/Estudio_R/salidas
# ────────────────────────────────────────────────────────────────────────────────

## 1. Librerías ==================================================================
paquetes <- c("RMariaDB", "DBI", "dbplyr", "dplyr", "janitor", "ggplot2")
instalar <- paquetes[!vapply(paquetes, requireNamespace,
                             quietly = TRUE, FUN.VALUE = logical(1))]
if (length(instalar)) install.packages(instalar)

library(DBI)          # Conexión a bases de datos
library(RMariaDB)     # Driver MariaDB/MySQL
library(dbplyr)       # Traducción dplyr ↔ SQL
library(dplyr)        # Gramática de manipulación de datos
library(janitor)      # Limpieza de nombres de columnas
library(ggplot2)      # Gráficos

## 2. Directorio de salida =======================================================
dir_out_global <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out_global)) dir.create(dir_out_global, recursive = TRUE)

## 3. Conexión a la base de datos ===============================================
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)       # Se cerrará al terminar el script

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
  # 4.1 Normalizar comuna a minúsculas
  nombre_comuna <- tolower(nombre_comuna)

  # 4.2 Traer solo los registros necesarios (filtrado en SQL)
  datos_filtrados <- tbl(con_bd, tabla) %>%
    janitor::clean_names() %>%
    filter(
      edad == !!edad_objetivo,
      lower(nombre_comuna) == !!nombre_comuna,
      genero_victima == !!genero_victima
    ) %>%
    collect()                         # Descarga el resultado al R local

  # 4.3 Validación: ¿hay datos?
  if (nrow(datos_filtrados) == 0) {
    message(
      "Sin registros para la comuna '", nombre_comuna,
      "', edad ", edad_objetivo,
      " y género ", genero_victima, "."
    )
    return(invisible(NULL))
  }

  # 4.4 Construir gráfico
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

  # 4.5 Guardar PNG en el directorio designado
  archivo_salida <- file.path(dir_out, salida)
  ggsave(
    filename = archivo_salida,
    plot     = p,
    width    = 10,
    height   = 7,
    dpi      = 300
  )

  message("Gráfico guardado en: ", archivo_salida)
  invisible(archivo_salida)
}

## 5. Ejemplo de uso =============================================================
# Puedes comentar o eliminar esta sección si lo usarás como librería externa
if (interactive()) {
  genero <- 1                  # 1 = mujer, 0 = hombre (ajusta según tu codificación)
  comuna <- "maipu"
  edad   <- 22

  graficar_violencia_por_edad_comuna_y_genero(
    edad_objetivo  = edad,
    nombre_comuna  = comuna,
    genero_victima = genero,
    salida         = sprintf(
      "011_violencia_%s_%s_%d.png",
      comuna,
      ifelse(genero == 1, "mujer", "hombre"),
      edad
    )
  )
}
