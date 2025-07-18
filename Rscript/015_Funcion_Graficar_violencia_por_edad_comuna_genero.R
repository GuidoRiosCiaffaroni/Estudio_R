# ────────────────────────────────────────────────────────────────────────────────
# 015 – Función: graficar violencia por edad, comuna y género 
# ────────────────────────────────────────────────────────────────────────────────

# 1. Librerías -------------------------------------------------------------------
if (!requireNamespace("dbplyr",   quietly = TRUE)) install.packages("dbplyr")
if (!requireNamespace("janitor",  quietly = TRUE)) install.packages("janitor")
if (!requireNamespace("RMariaDB", quietly = TRUE)) install.packages("RMariaDB")
if (!requireNamespace("dplyr",    quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("ggplot2",  quietly = TRUE)) install.packages("ggplot2")

library(DBI);       library(RMariaDB)
library(dbplyr);    library(janitor)
library(dplyr);     library(ggplot2)

# 2. Directorio de salida --------------------------------------------------------
dir_out <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# 3. Conexión a la BD ------------------------------------------------------------
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",      # ← ajusta credenciales
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# 4. Función de graficado (lee directamente la tabla) ---------------------------
graficar_violencia_por_edad_comuna_y_genero <- function(
  edad_objetivo,
  nombre_comuna,
  genero_victima,
  salida = "violencia_edad_comuna_genero.png",
  dir_out = dir_out,
  con_bd  = con,                 # permite pasar otra conexión si lo deseas
  tabla   = "wp_db_upload"       # nombre de la tabla
) {
  # 4.1 Construir consulta SQL con dbplyr
  nombre_comuna <- tolower(nombre_comuna)

  datos_filtrados <- tbl(con_bd, tabla) %>%
    clean_names() %>%                          # normaliza nombres vía SQL
    filter(
      edad           == !!edad_objetivo,
      lower(nombre_comuna) == !!nombre_comuna, # usa lower() en SQL
      genero_victima == !!genero_victima
    ) %>%
    collect()                                  # trae sólo los registros filtrados

  if (nrow(datos_filtrados) == 0) {
    message("Sin registros para la comuna '", nombre_comuna,
            "', edad ", edad_objetivo, " y género ", genero_victima, ".")
    return(invisible(NULL))
  }

  # 4.2 Graficar
  p <- ggplot(datos_filtrados, aes(x = nombre_violencia)) +
        geom_bar(fill = "tomato") +
        labs(
          title = paste("Violencia - Comuna:",
                        tools::toTitleCase(nombre_comuna),
                        "| Edad:", edad_objetivo,
                        "| Género:", genero_victima),
          x = "Tipo de Violencia",
          y = "Frecuencia"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))

  # 4.3 Guardar archivo
  archivo_salida <- file.path(dir_out, salida)
  ggsave(filename = archivo_salida, plot = p,
         width = 10, height = 7, dpi = 300)

  message("Gráfico guardado en: ", archivo_salida)
  invisible(archivo_salida)
}

# Ejemplo de uso -----------------------------------------------------------------
genero <- 1                 # 1 = mujer, 0 = hombre
comuna <- "maipu"
edad   <- 22

graficar_violencia_por_edad_comuna_y_genero(
  edad_objetivo = edad,
  nombre_comuna = comuna,
  genero_victima= genero,
  salida        = sprintf("011_violencia_%s_%s_%d.png",
                          comuna,
                          ifelse(genero == 1, "mujer", "hombre"),
                          edad)
)
