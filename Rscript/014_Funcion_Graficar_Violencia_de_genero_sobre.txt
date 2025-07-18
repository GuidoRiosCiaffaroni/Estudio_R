# ────────────────────────────────────────────────────────────────────────────────
# 014 – Distribución de ingresos por hora del día
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
dir_out <- "/home/r/Estudio_R/salidas"                            # mismo dir que 005
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

file_out <- file.path(dir_out, "013_ingresos_horario.png")

# 6. Gráfico ---------------------------------------------------------------------
###########################################################################
###########################################################################
# Funcion Graficar Violencia de genero sobre genero 

  
  # Leer archivo
  datos <- read.csv2(archivo_csv, encoding = "UTF-8", stringsAsFactors = FALSE)
  
  # Convertir a numérico
  datos$Genero.Victima <- as.numeric(as.character(datos$Genero.Victima))
  datos$Genero.Agresor <- as.numeric(as.character(datos$Genero.Agresor))
  
  # Filtrar
  datos_filtrados <- datos %>%
    filter(Genero.Victima == genero_victima,
           Genero.Agresor == genero_agresor)
  
  # Si no hay datos, no crear el gráfico
  if (nrow(datos_filtrados) == 0) {
    message("No se encontraron registros para esos géneros.")
    return(NULL)
  }
  
  # Intentar crear gráfico
  tryCatch({
    png(salida, width = 1000, height = 700)
    print(
      ggplot(datos_filtrados, aes(x = Nombre_Violencia)) +
        geom_bar(fill = "steelblue") +
        labs(
          title = paste("Tipos de Violencia - Víctima:", genero_victima, "| Agresor:", genero_agresor),
          x = "Tipo de Violencia",
          y = "Frecuencia"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    )
    dev.off()
    message(paste(" Gráfico guardado en:", salida))
  }, error = function(e) {
    message(" Error al generar el gráfico: ", e$message)
    dev.off()  # cierra dispositivo en caso de error
  })
}
###########################################################################

graficar_violencia_por_genero("Data_modificado.csv", 1, 1, "014_mujeres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 1, "014_mujeres_sobre_hombres.png")
graficar_violencia_por_genero("Data_modificado.csv", 1, 0, "014_hombres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 0, "014_hombres_sobre_hombres.png")

############################################################################
############################################################################
