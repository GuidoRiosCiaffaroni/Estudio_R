# ────────────────────────────────────────────────────────────────────────────────
#  ANALISIS ESTADÍSTICO ESPECÍFICO – wp_db_upload
#  Columnas: Edad (num), Nombre_Genero_Victima_Texto (cat), Nombre_Comuna (cat)
#  Autor   : Guido Rios Ciaffaroni
#  Fecha   : Sys.Date()
# ────────────────────────────────────────────────────────────────────────────────
#  OBJETIVO
#  1) Extraer sólo las tres columnas indicadas.
#  2) Calcular para Edad: media, mediana, moda, rango, cuantiles, sd, var, etc.
#  3) Generar tablas de frecuencia para las dos variables categóricas.
#  4) Chi-cuadrado entre Genero y Comuna.
#  5) ANOVA de Edad según Genero.
#  6) Exportar todos los resultados a CSV en dir_out.
# ────────────────────────────────────────────────────────────────────────────────

# ──────────────────
#  1. Librerías  ───
# ──────────────────
libs <- c("DBI", "RMariaDB", "dplyr", "tibble", "e1071", "broom")
inst  <- libs[!libs %in% installed.packages()[, "Package"]]
if (length(inst)) install.packages(inst)
lapply(libs, library, character.only = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  2. Conexión a la base --------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
con <- dbConnect(MariaDB(),
                 dbname   = "wordpress",
                 host     = "localhost",
                 user     = "nuevo_admin",
                 password = "MiClaveSegura",
                 timezone = "UTC")
on.exit(dbDisconnect(con), add = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  3. Lectura de columnas requeridas -------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
cols_needed <- c("Edad", "Nombre_Genero_Victima_Texto", "Nombre_Comuna")
query <- sprintf("SELECT %s FROM wp_db_upload", paste(cols_needed, collapse = ", "))
datos <- dbGetQuery(con, query)

# ────────────────────────────────────────────────────────────────────────────────
#  4. Estadísticas para Edad ----------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
moda <- function(x) {
  ux <- na.omit(unique(x)); ux[which.max(tabulate(match(x, ux)))]
}

estadisticas_numericas <- function(vec) {
  vec <- na.omit(vec)
  tibble(
    media        = mean(vec),
    mediana      = median(vec),
    moda         = moda(vec),
    rango        = diff(range(vec)),
    q1           = quantile(vec, 0.25),
    q2           = quantile(vec, 0.50),
    q3           = quantile(vec, 0.75),
    sd           = sd(vec),
    varianza     = var(vec),
    ric          = IQR(vec),
    coef_var     = sd(vec) / mean(vec),
    asimetria    = e1071::skewness(vec),
    curtosis     = e1071::kurtosis(vec),
    shapiro_p    = ifelse(length(vec) >= 3 && length(vec) <= 5000,
                          shapiro.test(vec)$p.value, NA_real_)
  )
}
resumen_edad <- estadisticas_numericas(datos$Edad) %>% mutate(variable = "Edad")

# ────────────────────────────────────────────────────────────────────────────────
#  5. Tablas de frecuencia ------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
freq_genero  <- datos %>% count(Nombre_Genero_Victima_Texto, name = "n") %>%
                 mutate(prop = n / sum(n))

freq_comuna  <- datos %>% count(Nombre_Comuna, name = "n") %>%
                 mutate(prop = n / sum(n))

# ────────────────────────────────────────────────────────────────────────────────
#  6. Chi-cuadrado Genero × Comuna ---------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
chi_tbl <- table(datos$Nombre_Genero_Victima_Texto, datos$Nombre_Comuna)
chi_res <- broom::tidy(chisq.test(chi_tbl))

# ────────────────────────────────────────────────────────────────────────────────
#  7. ANOVA Edad ~ Genero -------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
aov_res <- broom::tidy(aov(Edad ~ Nombre_Genero_Victima_Texto, data = datos))

# ────────────────────────────────────────────────────────────────────────────────
#  8. Exportación ---------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
dir_out <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

write.csv(datos,         file.path(dir_out, "datos_filtrados.csv"),        row.names = FALSE)
write.csv(resumen_edad,  file.path(dir_out, "edad_resumen.csv"),           row.names = FALSE)
write.csv(freq_genero,   file.path(dir_out, "frecuencia_genero.csv"),      row.names = FALSE)
write.csv(freq_comuna,   file.path(dir_out, "frecuencia_comuna.csv"),      row.names = FALSE)
write.csv(chi_res,       file.path(dir_out, "chi_genero_comuna.csv"),      row.names = FALSE)
write.csv(aov_res,       file.path(dir_out, "anova_edad_genero.csv"),      row.names = FALSE)

message("✔️  Análisis completo. Resultados en: ", normalizePath(dir_out))

# ────────────────────────────────────────────────────────────────────────────────
#  FIN -------------------------------------------------------------------------
