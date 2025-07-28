#!/usr/bin/env Rscript
# Línea de declaración para ejecución como script desde la terminal (Linux/Unix)

#########################################################################
# Instalación del paquete Quarto
# Permite crear documentos, presentaciones, libros y sitios web en múltiples formatos.
install.packages("quarto")
#########################################################################

#########################################################################
# Instalación del metapaquete tidyverse
# Incluye herramientas esenciales para ciencia de datos:
# - dplyr: manipulación de datos
# - ggplot2: gráficos
# - tidyr: transformación de datos
# - readr: lectura de archivos
# - purrr: programación funcional
# - tibble: estructura moderna de data.frame
install.packages("tidyverse")

# Instalación explícita de dplyr, por si se requiere fuera del entorno tidyverse
install.packages("dplyr")

# Instalación explícita de tibble, para crear data frames modernos
install.packages("tibble")
#########################################################################

#########################################################################
# Paquetes para estadística y análisis exploratorio

# skimr: resumen enriquecido de data.frames y tibbles, útil para EDA
install.packages("skimr")

# e1071: incluye herramientas para estadística clásica y machine learning (como SVM)
install.packages("e1071")

# broom: convierte los outputs de modelos estadísticos en data.frames ordenados
install.packages("broom")
#########################################################################

#########################################################################
# Paquetes para visualización de datos

# ggplot2: sistema de gráficos basado en la gramática de los gráficos
install.packages("ggplot2")

# GGally: extensión de ggplot2 para gráficos de pares y matrices de correlación
install.packages("GGally")

# plotly: permite crear gráficos interactivos basados en ggplot2 o desde cero
install.packages("plotly")

# scatterplot3d: para crear gráficos de dispersión en tres dimensiones
install.packages("scatterplot3d")

# rgl: permite gráficos 3D interactivos, rotación en tiempo real y exportación
install.packages("rgl")
#########################################################################

#########################################################################
# Paquete para construir aplicaciones web interactivas en R
install.packages("shiny")
#########################################################################

#########################################################################
# Paquete para limpieza de datos
# janitor permite limpiar nombres de columnas, detectar duplicados, validar tablas, etc.
install.packages("janitor")
#########################################################################

#########################################################################
# Paquetes para conexión con bases de datos

# DBI: interfaz estándar para comunicación con bases de datos en R
install.packages("DBI")

# RMariaDB: conector específico para bases de datos MariaDB/MySQL
install.packages("RMariaDB")
#########################################################################

#########################################################################
# Paquete para realizar pruebas unitarias en R
# testthat facilita crear y ejecutar tests para verificar el comportamiento correcto del código
install.packages("testthat")
#########################################################################
