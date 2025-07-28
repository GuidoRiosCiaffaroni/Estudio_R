# ─────────────────────────────────────────────────────────────────────────────
#  PRUEBAS CON `testthat` Y REPORTE MARKDOWN PARA analiza_wp_upload()
# ─────────────────────────────────────────────────────────────────────────────

# Cargar paquetes necesarios
if (!requireNamespace("testthat", quietly = TRUE)) install.packages("testthat")
if (!requireNamespace("DBI", quietly = TRUE)) install.packages("DBI")
if (!requireNamespace("RSQLite", quietly = TRUE)) install.packages("RSQLite")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("rmarkdown", quietly = TRUE)) install.packages("rmarkdown")

library(testthat)
library(DBI)
library(RSQLite)
library(dplyr)
library(rmarkdown)

# Simulación de base de datos en memoria con SQLite
con <- dbConnect(SQLite(), ":memory:")
dbWriteTable(con, "wp_db_upload", data.frame(
  Edad = c(25, 30, 35, 40),
  Nombre_Genero_Victima_Texto = c("Femenino", "Masculino", "Femenino", "Masculino"),
  Nombre_Comuna = c("Santiago", "Valparaíso", "Santiago", "Valparaíso")
))

# Sobrescribir la función para usar SQLite localmente
analiza_wp_upload_test <- function(edad = NULL,
                                   genero = NULL,
                                   comuna = NULL,
                                   con) {
  base_query <- "SELECT Edad, Nombre_Genero_Victima_Texto, Nombre_Comuna FROM wp_db_upload"
  clauses <- c()
  if (!is.null(edad)) {
    if (length(edad) == 2) {
      clauses <- c(clauses, sprintf("Edad BETWEEN %d AND %d", edad[1], edad[2]))
    } else {
      clauses <- c(clauses, sprintf("Edad = %d", edad[1]))
    }
  }
  if (!is.null(genero)) {
    genero_quoted <- paste(sprintf("'%s'", genero), collapse = ",")
    clauses <- c(clauses, sprintf("Nombre_Genero_Victima_Texto IN (%s)", genero_quoted))
  }
  if (!is.null(comuna)) {
    comuna_quoted <- paste(sprintf("'%s'", comuna), collapse = ",")
    clauses <- c(clauses, sprintf("Nombre_Comuna IN (%s)", comuna_quoted))
  }
  query <- if (length(clauses)) paste(base_query, "WHERE", paste(clauses, collapse = " AND ")) else base_query
  datos <- dbGetQuery(con, query)
  return(datos)
}

# Ejecutar pruebas
resultados <- test_dir(tempdir(), reporter = "summary", stop_on_failure = FALSE)

# Generar informe Markdown
ruta_salida <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
ruta_rmd <- file.path(tempdir(), "reporte_testthat.Rmd")
ruta_html <- file.path(ruta_salida, "reporte_testthat.html")

# Crear el archivo Rmd
writeLines(c(
  "---",
  "title: \"Reporte de Test para analiza_wp_upload\"",
  "output: html_document",
  "---",
  "",
  "```{r setup, include=FALSE}",
  "knitr::opts_chunk$set(echo = TRUE)",
  "```",
  "",
  "## Resultado de tests",
  "",
  "```{r}",
  "library(testthat)",
  "test_file <- tempfile(fileext = '.R')",
  "writeLines(readLines('" , test_file_path , "'), test_file)",
  "testthat::test_file(test_file)",
  "```"
), ruta_rmd)

# Renderizar HTML
rmarkdown::render(ruta_rmd, output_file = ruta_html)

# Cerrar conexión
dbDisconnect(con)