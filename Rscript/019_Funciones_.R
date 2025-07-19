# ────────────────────────────────────────────────────────────────────────────────
#  FUNCION: analiza_wp_upload()                                                 
#  Descripción: Realiza un análisis estadístico de la tabla `wp_db_upload`       
#  filtrando opcionalmente por Edad, Género y Comuna y exporta los resultados    
#  a CSV en un directorio dado.                                                 
#                                                                               
#  Parámetros                                                                    
#    edad      : NULL, num o vector num (valor/ rango).                         
#    genero    : NULL o vector chr  (ej.: "Femenino", "Masculino").           
#    comuna    : NULL o vector chr  (ej.: "Santiago").                         
#    db_name   : Nombre BD (defecto "wordpress").                               
#    host      : Host DB.                                                        
#    user      : Usuario.                                                        
#    password  : Password.                                                       
#    dir_out   : Carpeta de salida (def. "/home/r/Estudio_R/salidas").          
#                                                                               
#  Retorna                                                                       
#    Lista con data.frame del filtro y tibble de resultados, invisiblemente.    
# ────────────────────────────────────────────────────────────────────────────────

analiza_wp_upload <- function(edad      = NULL,
                              genero    = NULL,
                              comuna    = NULL,
                              db_name   = "wordpress",
                              host      = "localhost",
                              user      = "nuevo_admin",
                              password  = "MiClaveSegura",
                              dir_out   = "/home/r/Estudio_R/salidas") {

  # ──────────────────────────────────────────────────────────────────
  #  Librerías -------------------------------------------------------
  # ──────────────────────────────────────────────────────────────────
  libs <- c("DBI", "RMariaDB", "dplyr", "tibble", "e1071", "broom")
  inst <- libs[!libs %in% installed.packages()[, "Package"]]
  if (length(inst)) install.packages(inst)
  lapply(libs, library, character.only = TRUE)

  # ──────────────────────────────────────────────────────────────────
  #  Conexión DB -----------------------------------------------------
  # ──────────────────────────────────────────────────────────────────
  con <- dbConnect(RMariaDB::MariaDB(),
                   dbname   = db_name,
                   host     = host,
                   user     = user,
                   password = password,
                   timezone = "UTC")
  on.exit(dbDisconnect(con), add = TRUE)

  # ──────────────────────────────────────────────────────────────────
  #  Consulta dinámica ----------------------------------------------
  # ──────────────────────────────────────────────────────────────────
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

  # ──────────────────────────────────────────────────────────────────
  #  Funciones auxiliares -------------------------------------------
  # ──────────────────────────────────────────────────────────────────
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
                            shapiro.test(vec)$p.value, NA_real_))
  }

  # ──────────────────────────────────────────────────────────────────
  #  Estadísticos Edad ----------------------------------------------
  # ──────────────────────────────────────────────────────────────────
  resumen_edad <- estadisticas_numericas(datos$Edad) %>% mutate(variable = "Edad")

  # Tablas de frecuencia
  freq_genero <- datos %>% dplyr::count(Nombre_Genero_Victima_Texto, name = "n") %>%
                 mutate(prop = n / sum(n))
  freq_comuna <- datos %>% dplyr::count(Nombre_Comuna, name = "n") %>%
                 mutate(prop = n / sum(n))

  # ──────────────────────────────────────────────────────────────────
  #  Pruebas estad. --------------------------------------------------
  # ──────────────────────────────────────────────────────────────────
  chi_tbl <- table(datos$Nombre_Genero_Victima_Texto, datos$Nombre_Comuna)
  chi_res <- broom::tidy(chisq.test(chi_tbl))
  aov_res <- broom::tidy(aov(Edad ~ Nombre_Genero_Victima_Texto, data = datos))

  # ──────────────────────────────────────────────────────────────────
  #  Exportación -----------------------------------------------------
  # ──────────────────────────────────────────────────────────────────
  if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)
  write.csv(datos,         file.path(dir_out, "datos_filtrados.csv"),       row.names = FALSE)
  write.csv(resumen_edad,  file.path(dir_out, "edad_resumen.csv"),          row.names = FALSE)
  write.csv(freq_genero,   file.path(dir_out, "frecuencia_genero.csv"),     row.names = FALSE)
  write.csv(freq_comuna,   file.path(dir_out, "frecuencia_comuna.csv"),     row.names = FALSE)
  write.csv(chi_res,       file.path(dir_out, "chi_genero_comuna.csv"),     row.names = FALSE)
  write.csv(aov_res,       file.path(dir_out, "anova_edad_genero.csv"),     row.names = FALSE)

  message("✔️  Análisis completo. Resultados en: ", normalizePath(dir_out))
  invisible(list(datos = datos,
                 resumen_edad = resumen_edad,
                 freq_genero = freq_genero,
                 freq_comuna = freq_comuna,
                 chi_res = chi_res,
                 aov_res = aov_res))
}

# ───────────────────────────────────────────────────────────────────────────────
#  EJEMPLOS DE USO -------------------------------------------------------------
# ───────────────────────────────────────────────────────────────────────────────
# 1) Análisis completo (sin filtros)
# analiza_wp_upload()
#
# 2) Solo género "Femenino" y comuna "Santiago"
# analiza_wp_upload(genero = "Femenino", comuna = "Santiago")
#
# 3) Edad entre 20 y 40 años
# analiza_wp_upload(edad = c(20, 40))
#
# ───────────────────────────────────────────────────────────────────────────────
#  FIN -------------------------------------------------------------------------
