
# ─────────────────────────────────────────────────────────────────────────────
#  PRUEBAS CON `testthat` Y REPORTE EN FORMATO MARKDOWN (.md) LÍNEA A LÍNEA
# ─────────────────────────────────────────────────────────────────────────────

# Cargar paquetes necesarios
if (!requireNamespace("testthat", quietly = TRUE)) install.packages("testthat")
if (!requireNamespace("DBI", quietly = TRUE)) install.packages("DBI")
if (!requireNamespace("RSQLite", quietly = TRUE)) install.packages("RSQLite")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")

library(testthat)
library(DBI)
library(RSQLite)
library(dplyr)

# Crear conexión a base de datos en memoria
con <- dbConnect(SQLite(), ":memory:")
dbWriteTable(con, "wp_db_upload", data.frame(
  Edad = c(25, 30, 35, 40),
  Nombre_Genero_Victima_Texto = c("Femenino", "Masculino", "Femenino", "Masculino"),
  Nombre_Comuna = c("Santiago", "Valparaíso", "Santiago", "Valparaíso")
))

# Definir la función a probar
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

# Crear archivo de test temporal
test_code <- '
test_that("Filtro por edad exacta retorna 1 fila", {
  datos <- analiza_wp_upload_test(edad = 25, con = con)
  expect_equal(nrow(datos), 1)
  expect_equal(datos$Edad, 25)
})
'
test_file <- file.path(tempdir(), "test_analiza_wp_upload.R")
writeLines(test_code, test_file)

# Ejecutar el test y capturar la salida
test_output <- capture.output(testthat::test_file(test_file, reporter = "summary"))

# Crear archivo .md de salida
ruta_salida <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(ruta_salida)) dir.create(ruta_salida, recursive = TRUE)
reporte_md <- file.path(ruta_salida, "reporte_testthat.md")

# Escribir línea por línea
con_md <- file(reporte_md, open = "wt")
writeLines("# Reporte de pruebas `testthat` para `analiza_wp_upload()`", con = con_md)
writeLines("", con = con_md)
writeLines("## Resultado de ejecución", con = con_md)
writeLines("", con = con_md)
for (linea in test_output) {
  writeLines(paste0("    ", linea), con = con_md)  # Formato tipo bloque de código
}
close(con_md)

# Cerrar conexión
dbDisconnect(con)

message("✅ Pruebas ejecutadas y reporte Markdown generado línea por línea en: ", reporte_md)
