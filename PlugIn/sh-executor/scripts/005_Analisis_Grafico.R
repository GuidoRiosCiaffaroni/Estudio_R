# ────────────────────────────────────────────────────────────────────────────────
#  CARGA DE LIBRERÍAS -----------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# install.packages(c("RMariaDB", "dplyr", "ggplot2", "lubridate", "stringr"))
library(DBI)        # Conexión a BD
library(RMariaDB)   # Driver MariaDB / MySQL
library(dplyr)      # Manipulación de datos
library(ggplot2)    # Gráficos
library(lubridate)  # Fechas robustas
library(stringr)    # Utilidades de texto

# ────────────────────────────────────────────────────────────────────────────────
#  CONEXIÓN ---------------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"          # Evita desfases si tu servidor usa otra zona
)

# Garantiza desconexión aunque ocurra un error
on.exit(dbDisconnect(con), add = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
#  LECTURA DE DATOS -------------------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# Usa dbReadTable sólo si la tabla no es enorme; para filtros grandes, prefiere
# dbGetQuery("SELECT campos_necesarios FROM ... WHERE ...")
datos <- dbReadTable(con, "wp_db_upload")

# Normaliza nombres a snake_case (opcional, pero útil)
names(datos) <- str_replace_all(names(datos), "\\.", "_")

# ────────────────────────────────────────────────────────────────────────────────
#  LIMPIEZA Y TRANSFORMACIÓN ----------------------------------------------------
# ────────────────────────────────────────────────────────────────────────────────
# 1. Conversión de fecha
if ("fecha" %in% names(datos)) {
  # MySQL suele traer 'YYYY‑MM‑DD HH:MM:SS'
  datos$fecha <- ymd_hms(datos$fecha, tz = "UTC")   # lubridate es más tolerante
} else if ("Fecha" %in% names(datos)) {
  # Si tu campo quedó con F mayúscula
  datos$Fecha <- ymd_hms(datos$Fecha, tz = "UTC")
}

# 2. Confirma/renombra columnas de texto que usarás más abajo
# Ajusta los nombres reales de tu tabla si son distintos:
datos <- datos %>%
  rename(
    genero_victima  = Nombre_Genero_Victima_Texto,   # ← revísalos
    genero_agresor  = Nombre_Genero_Agresor_Texto,
    comuna          = Nombre_Comuna,
    edad            = Edad
  )

# 3. Filtra filas con información crítica presente
datos <- datos %>%
  filter(!is.na(genero_victima), !is.na(edad), !is.na(comuna))

# 4. Convierte género a factor para conservar orden consistente en los gráficos
niveles_genero <- c("Hombre", "Mujer", "Otro")   # Ajusta si tu texto difiere
datos <- datos %>%
  mutate(
    genero_victima = factor(genero_victima, levels = niveles_genero),
    genero_agresor = factor(genero_agresor, levels = niveles_genero)
  )

# Directorio de salida (créalo si no existe)
dir_out <- "/var/www/wordpress/wp-content/plugins/sh-executor/archives"
if (!dir.exists(dir_out)) dir.create(dir_out, recursive = TRUE)

# ────────────────────────────────────────────────────────────────────────────────
# 1. Barras por género de la víctima -------------------------------------------
graf1 <- ggplot(datos, aes(x = genero_victima)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Casos por género de la víctima",
       x = "Género", y = "Cantidad") +
  theme_minimal()

ggsave(file.path(dir_out, "001_genero_victima.png"),
       plot = graf1, width = 6, height = 4, dpi = 300)

# ────────────────────────────────────────────────────────────────────────────────
# 2. Barras agrupadas víctima vs agresor ----------------------------------------
graf2 <- ggplot(datos,
                aes(x = genero_victima, fill = genero_agresor)) +
  geom_bar(position = "dodge") +
  labs(title = "Víctima vs Agresor por género",
       x = "Género víctima", fill = "Género agresor") +
  theme_minimal()

ggsave(file.path(dir_out, "002_victima_vs_agresor.png"),
       plot = graf2, width = 6, height = 4, dpi = 300)

# ────────────────────────────────────────────────────────────────────────────────
# 3. Barras por comuna ----------------------------------------------------------
graf3 <- ggplot(datos, aes(x = comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Casos por comuna",
       x = "Comuna", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

ggsave(file.path(dir_out, "003_casos_por_comuna.png"),
       plot = graf3, width = 8, height = 5, dpi = 300)

# ────────────────────────────────────────────────────────────────────────────────
# 4. Dispersión Edad vs Comuna --------------------------------------------------
graf4 <- ggplot(datos,
                aes(x = edad, y = comuna, color = genero_victima)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(title = "Edad de víctimas por comuna",
       x = "Edad", y = "Comuna", color = "Género víctima") +
  theme_minimal()

ggsave(file.path(dir_out, "004_edad_vs_comuna.png"),
       plot = graf4, width = 6, height = 5, dpi = 300)

# ────────────────────────────────────────────────────────────────────────────────
# 5. Gráfico de pastel por género víctima --------------------------------------
tabla_victima <- datos %>%
  count(genero_victima, name = "frecuencia")

graf5 <- ggplot(tabla_victima,
                aes(x = "", y = frecuencia, fill = genero_victima)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Proporción por género de víctima", fill = "Género") +
  theme_void()

ggsave(file.path(dir_out, "005_pastel_genero_victima.png"),
       plot = graf5, width = 5, height = 5, dpi = 300)

# ────────────────────────────────────────────────────────────────────────────────
# 6. Histograma de casos por fecha ---------------------------------------------
if ("fecha" %in% names(datos)) {
  graf6 <- ggplot(datos, aes(x = fecha)) +
    geom_histogram(binwidth = 86400, fill = "purple") +    # 1 día = 86400 seg
    labs(title = "Distribución temporal de casos",
         x = "Fecha", y = "Número de casos") +
    theme_minimal()

  ggsave(file.path(dir_out, "006_casos_por_fecha.png"),
         plot = graf6, width = 7, height = 4, dpi = 300)
}

# ────────────────────────────────────────────────────────────────────────────────
#  FIN -------------------------------------------------------------------------
message("Gráficos generados correctamente en: ", dir_out)
