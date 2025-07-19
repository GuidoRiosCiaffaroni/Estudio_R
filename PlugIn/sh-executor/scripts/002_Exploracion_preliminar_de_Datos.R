library(tidyverse)
library(skimr)
library(GGally)
library(dplyr)

datos <- read.csv("Data.csv", header = TRUE, sep = "," , encoding = "UTF-8") # Carga de Datos

# Ver las primeras filas
head(datos)

# Ver la estructura de los datos
glimpse(datos)