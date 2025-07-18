# ────────────────────────────────────────────────────────────────────────────────
#  ESTUDIO PRELIMINAR TABLA `wp_db_upload` (WORDPRESS)                           
#  Autor: <tu_nombre>                                                            
#  Fecha: Sys.Date()                                                             
# ────────────────────────────────────────────────────────────────────────────────    
# ────────────────────────────────────────────────────────────────────────────────

# ──────────────────
#  1. Librerías  ───
# ──────────────────
libs <- c("DBI", "RMariaDB", "dplyr", "tidyr", "purrr", "tibble", "e1071", 
          "moments", "broom", "Hmisc")
inst  <- libs[!libs %in% installed.packages()[, "Package"]]
if (length(inst)) install.packages(inst)

lapply(libs, library, character.only = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  2. Conexión a la BD  ---------------------------------------------------------
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
#  3. Lectura y limpieza --------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
datos <- dbReadTable(con, "wp_db_upload")

# Convierte nombres a snake_case por comodidad
names(datos) <- gsub("[[:punct:]]+", "_", tolower(names(datos)))

# Tipos de variables
num_cols  <- names(datos)[sapply(datos, is.numeric)]
cat_cols  <- setdiff(names(datos), num_cols)

# ────────────────────────────────────────────────────────────────────────────────
#  4. Funciones auxiliares ------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
moda <- function(x) {
  ux <- na.omit(unique(x))
  ux[which.max(tabulate(match(x, ux)))]
}

estadisticas_numericas <- function(vec) {
  vec <- na.omit(vec)
  tibble(
    media          = mean(vec),
    mediana        = median(vec),
    moda           = moda(vec),
    rango          = diff(range(vec)),
    q1             = quantile(vec, 0.25),
    q2             = quantile(vec, 0.50),
    q3             = quantile(vec, 0.75),
    deciles        = list(quantile(vec, probs = seq(0.1, 0.9, 0.1))),
    percentiles    = list(quantile(vec, probs = seq(0, 1, 0.01))),
    desv_estandar  = sd(vec),
    varianza       = var(vec),
    ric            = IQR(vec),
    coef_var       = sd(vec) / mean(vec),
    asimetria      = e1071::skewness(vec),
    curtosis       = e1071::kurtosis(vec),
    shapiro_p      = ifelse(length(vec) >= 3 && length(vec) <= 5000,
                            shapiro.test(vec)$p.value, NA_real_),
    ks_p           = ifelse(length(vec) > 5000,
                            ks.test(scale(vec), "pnorm")$p.value, NA_real_),
    t_test_p       = t.test(vec, mu = 0)$p.value
  )
}

# ────────────────────────────────────────────────────────────────────────────────
#  FIN -------------------------------------------------------------------------
