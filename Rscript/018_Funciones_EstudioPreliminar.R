# ────────────────────────────────────────────────────────────────────────────────
#  ESTUDIO PRELIMINAR: EXPORTACIÓN A CSV DE COLUMNAS SELECCIONADAS               
#  Tabla   : wp_db_upload (BD wordpress)                                         
#  Columnas: Fecha, Genero_Victima, Edad, Nombre_Violencia                       
#  Autor   : <tu_nombre>                                                         
#  Fecha   : Sys.Date()                                                          
# ────────────────────────────────────────────────────────────────────────────────


# ──────────────────
#  1. Librerías  ───
# ──────────────────
libs <- c("DBI", "RMariaDB", "dplyr", "tibble", "e1071")
inst  <- libs[!libs %in% installed.packages()[, "Package"]]
if (length(inst)) install.packages(inst)

lapply(libs, library, character.only = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  2. Conexión ------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(dbDisconnect(con), add = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  3. Lectura de columnas específicas ------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
cols_needed <- c("Fecha", "Genero_Victima", "Edad", "Nombre_Violencia")
query <- sprintf("SELECT %s FROM wp_db_upload", paste(cols_needed, collapse = ", "))
datos <- dbGetQuery(con, query)

# ────────────────────────────────────────────────────────────────────────────────
#  4. Estadísticas descriptivas (solo numéricas) --------------------------------
# ────────────────────────────────────────────────────────────────────────────────
moda <- function(x) {
  ux <- na.omit(unique(x))
  ux[which.max(tabulate(match(x, ux)))]
}

estadisticas_numericas <- function(vec) {
  vec <- na.omit(vec)
  tibble(
    media      = mean(vec),
    mediana    = median(vec),
    moda       = moda(vec),
    rango      = diff(range(vec)),
    q1         = quantile(vec, 0.25),
    q2         = quantile(vec, 0.5),
    q3         = quantile(vec, 0.75),
    deciles    = list(quantile(vec, probs = seq(0.1, 0.9, 0.1))),
    percentiles= list(quantile(vec, probs = seq(0, 1, 0.01))),
    sd         = sd(vec),
    varianza   = var(vec),
    ric        = IQR(vec),
    coef_var   = sd(vec) / mean(vec),
    asimetria  = e1071::skewness(vec),
    curtosis   = e1071::kurtosis(vec)
  )
}

num_cols <- names(datos)[sapply(datos, is.numeric)]
resumen_numerico <- dplyr::bind_rows(lapply(num_cols, function(col) {
  estadisticas_numericas(datos[[col]]) %>% mutate(variable = col)
})) %>% dplyr::relocate(variable)

# ────────────────────────────────────────────────────────────────────────────────
#  5. Exportación ---------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Directorio de salida solicitado
dir_out <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# Datos completos seleccionados
write.csv(datos, file.path(dir_out, "00_datos_seleccionados.csv"), row.names = FALSE)

# Resumen numérico
write.csv(resumen_numerico, file.path(dir_out, "01_resumen_numerico.csv"), row.names = FALSE)

message("✔️  Datos y estadísticas exportados en: ", normalizePath(dir_out))

# ────────────────────────────────────────────────────────────────────────────────
#  FIN -------------------------------------------------------------------------

