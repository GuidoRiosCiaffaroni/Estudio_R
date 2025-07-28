
# ─────────────────────────────────────────────────────────────────────────────
#  PRUEBAS CON `testthat` PARA analiza_wp_upload()
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

# Simulación de base de datos en memoria con SQLite
con <- dbConnect(SQLite(), ":memory:")
dbWriteTable(con, "wp_db_upload", data.frame(
  Edad = c(25, 30, 35, 40),
  Nombre_Genero_Victima_Texto = c("Femenino", "Masculino", "Femenino", "Masculino"),
  Nombre_Comuna = c("Santiago", "Valparaíso", "Santiago", "Valparaíso")
))

# Sobrescribir la función para usar SQLite localmente (reducida para test)
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

# ───────────────────────────────────────────────
# TESTS
# ───────────────────────────────────────────────
test_that("Sin filtros retorna 4 filas", {
  datos <- analiza_wp_upload_test(con = con)
  expect_equal(nrow(datos), 4)
})

test_that("Filtro por edad exacta retorna 1 fila", {
  datos <- analiza_wp_upload_test(edad = 25, con = con)
  expect_equal(nrow(datos), 1)
  expect_equal(datos$Edad, 25)
})

test_that("Filtro por rango de edad retorna 2 filas", {
  datos <- analiza_wp_upload_test(edad = c(25, 30), con = con)
  expect_equal(nrow(datos), 2)
})

test_that("Filtro por género retorna solo Femenino", {
  datos <- analiza_wp_upload_test(genero = "Femenino", con = con)
  expect_true(all(datos$Nombre_Genero_Victima_Texto == "Femenino"))
})

test_that("Filtro por comuna retorna solo Santiago", {
  datos <- analiza_wp_upload_test(comuna = "Santiago", con = con)
  expect_true(all(datos$Nombre_Comuna == "Santiago"))
})

# Cierre de conexión al final
dbDisconnect(con)
