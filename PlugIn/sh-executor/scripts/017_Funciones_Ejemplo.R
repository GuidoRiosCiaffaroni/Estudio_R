# ────────────────────────────────────────────────────────────────────────────────
# 017_graficos_descriptivos.R
# Serie de gráficos descriptivos a partir de la tabla `wp_db_upload`
#    Casos por género de la víctima
#    Víctima vs agresor por género
#    Casos por comuna
#    Dispersión edad–comuna
#    Proporción por género (pastel)
#    Histograma temporal
# Todos los PNG se guardan en /home/r/Estudio_R/salidas
# ────────────────────────────────────────────────────────────────────────────────

## 1. Librerías =================================================================
paquetes <- c("RMariaDB", "DBI", "dbplyr", "dplyr", "janitor", "ggplot2")
instalar <- paquetes[!vapply(paquetes, requireNamespace,
                             quietly = TRUE, FUN.VALUE = logical(1))]
if (length(instalar)) install.packages(instalar)

library(DBI)
library(RMariaDB)
library(dbplyr)
library(dplyr)
library(janitor)
library(ggplot2)

## 2. Directorio de salida =======================================================
dir_out_global <- "/home/r/Estudio_R/salidas"
if (!dir.exists(dir_out_global)) dir.create(dir_out_global, recursive = TRUE)

## 3. Conexión MariaDB: base “wordpress” ========================================
con <- dbConnect(
  MariaDB(),
  dbname   = "wordpress",
  host     = "localhost",
  user     = "nuevo_admin",
  password = "MiClaveSegura",
  timezone = "UTC"
)
on.exit(if (DBI::dbIsValid(con)) DBI::dbDisconnect(con), add = TRUE)

## 4. Descargar y preparar datos ===============================================
datos <- tbl(con, "wp_db_upload") %>%
  janitor::clean_names() %>%                # → snake_case
  select(                                   # solo lo que necesitamos
    fecha,
    nombre_genero_victima_texto,
    nombre_genero_agresor_texto,
    edad,
    nombre_comuna
  ) %>%
  collect()

# Conversión de tipos -----------------------------------------------------------
datos <- datos %>%
  mutate(
    fecha = suppressWarnings(
      as.POSIXct(fecha, format = "%d-%m-%Y %H:%M", tz = "UTC")
    ),
    edad  = as.numeric(edad)
  ) %>%
  filter(
    !is.na(nombre_genero_victima_texto),
    !is.na(edad),
    !is.na(nombre_comuna)
  )

## 5. Funciones de gráficos =====================================================
gsave_out <- function(plot, filename, w, h, dpi = 300) {
  ggsave(
    filename = file.path(dir_out_global, filename),
    plot     = plot,
    width    = w,
    height   = h,
    dpi      = dpi
  )
}

grafico_genero_victima <- function(df) {
  g <- ggplot(df, aes(x = nombre_genero_victima_texto)) +
    geom_bar(fill = "steelblue") +
    labs(
      title = "Casos por género de la víctima",
      x = "Género",
      y = "Cantidad"
    )
  gsave_out(g, "012_grafico_genero_victima.png", 6, 4)
}

grafico_genero_cruzado <- function(df) {
  g <- ggplot(
        df,
        aes(
          x    = nombre_genero_victima_texto,
          fill = nombre_genero_agresor_texto
        )
      ) +
    geom_bar(position = "dodge") +
    labs(
      title = "Víctima vs Agresor por género",
      x = "Género víctima",
      fill = "Género agresor",
      y = "Cantidad"
    )
  gsave_out(g, "012_grafico_genero_cruzado.png", 6, 4)
}

grafico_comuna <- function(df) {
  g <- ggplot(df, aes(x = nombre_comuna)) +
    geom_bar(fill = "darkorange") +
    labs(
      title = "Casos por comuna",
      x = "Comuna",
      y = "Cantidad"
    ) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  gsave_out(g, "012_grafico_comuna.png", 8, 5)
}

grafico_edad_comuna <- function(df) {
  g <- ggplot(
        df,
        aes(
          x     = edad,
          y     = nombre_comuna,
          color = nombre_genero_victima_texto
        )
      ) +
    geom_point(size = 2, alpha = 0.7) +
    labs(
      title = "Edad de víctimas por comuna",
      x = "Edad",
      y = "Comuna",
      color = "Género víctima"
    )
  gsave_out(g, "012_grafico_edad_comuna.png", 7, 5)
}

grafico_pastel_genero <- function(df) {
  df_summary <- df %>%
    count(nombre_genero_victima_texto, name = "frecuencia")
  g <- ggplot(
        df_summary,
        aes(x = "", y = frecuencia, fill = nombre_genero_victima_texto)
      ) +
    geom_col(width = 1) +
    coord_polar("y", start = 0) +
    labs(
      title = "Proporción por género de víctima",
      fill = "Género"
    ) +
    theme_void()
  gsave_out(g, "012_grafico_pastel_genero.png", 5, 5)
}

grafico_tiempo <- function(df) {
  g <- ggplot(df, aes(x = fecha)) +
    geom_histogram(
      binwidth = 86400,        # 1 día
      fill = "purple"
    ) +
    labs(
      title = "Distribución temporal de casos",
      x = "Fecha",
      y = "Cantidad"
    )
  gsave_out(g, "012_grafico_tiempo.png", 7, 4)
}

## 6. Ejecutar y guardar los gráficos ===========================================
grafico_genero_victima(datos)
grafico_genero_cruzado(datos)
grafico_comuna(datos)
grafico_edad_comuna(datos)
grafico_pastel_genero(datos)
grafico_tiempo(datos)

## 7. Cerrar conexión (por seguridad) ===========================================
if (DBI::dbIsValid(con)) DBI::dbDisconnect(con)
