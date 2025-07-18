# ────────────────────────────────────────────────────────────────────────────────
# 014 – Función para graficar violencia por género de víctima y agresor
# ────────────────────────────────────────────────────────────────────────────────

# 1. Carga de librerías ----------------------------------------------------------
if (!requireNamespace("dplyr",     quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("ggplot2",   quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("janitor",   quietly = TRUE)) install.packages("janitor")

library(dplyr)
library(ggplot2)
library(janitor)

# 2. Directorio de salida (igual que en el script 005) ---------------------------
dir_out <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# 3. Función para generar el gráfico --------------------------------------------
graficar_violencia_por_genero <- function(archivo_csv,
                                          genero_victima,
                                          genero_agresor,
                                          nombre_archivo) {
  # Leer archivo CSV
  datos <- read.csv2(archivo_csv, encoding = "UTF-8", stringsAsFactors = FALSE) %>%
           janitor::clean_names()                                  # snake_case
  
  # Convertir a numérico
  datos$genero_victima <- as.numeric(datos$genero_victima)
  datos$genero_agresor <- as.numeric(datos$genero_agresor)
  
  # Filtrar según parámetros
  datos_filtrados <- datos %>%
    filter(genero_victima == genero_victima,
           genero_agresor == genero_agresor)
  
  if (nrow(datos_filtrados) == 0) {
    message("No se encontraron registros para esos géneros.")
    return(invisible(NULL))
  }
  
  # Crear gráfico
  graf <- ggplot(datos_filtrados, aes(x = nombre_violencia)) +
    geom_bar(fill = "steelblue") +
    labs(
      title = paste("Tipos de Violencia – Víctima:", genero_victima,
                    "| Agresor:", genero_agresor),
      x = "Tipo de violencia",
      y = "Frecuencia"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  # Ruta de salida
  file_out <- file.path(dir_out, nombre_archivo)
  
  # Guardar gráfico
  ggsave(
    filename = file_out,
    plot     = graf,
    width    = 10,
    height   = 7,
    dpi      = 300
  )
  message("Gráfico guardado en: ", file_out)
}

# 4. Llamadas a la función -------------------------------------------------------
graficar_violencia_por_genero("Data_modificado.csv", 1, 1, "014_mujeres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 1, "014_mujeres_sobre_hombres.png")
graficar_violencia_por_genero("Data_modificado.csv", 1, 0, "014_hombres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 0, "014_hombres_sobre_hombres.png")
