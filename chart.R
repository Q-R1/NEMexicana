#Cargar librerias ----
library("gtsummary")
library("bstfun")
library("ggstatsplot")
library("tidyverse")
library("ggstats")
library("ggsci")
#Cargar archivo ----
library(readr)
control <- read_csv("control.csv")

#ORDENAR LOS VALORES DE RESPUESTA DE LAS SECCIONES: APROPIA, FLEXIBLE,ARTICULA, CONTEXTO, IMPLEMENTA----
control <- control %>%
  mutate(across(
    c(apropia1:apropia3, contexto4:contexto7,
      articula8:articula14, flexible15:flexible16,
      implementa17:implementa20),
    ~ fct_relevel(., "no", "si")))

# Función para generar gráficos de forma compacta
graficar_subdimension <- function(data, vars, titulo, num_grafico) {
  gglikert(data, include = {{vars}}) +
    scale_fill_jco() +
    theme_classic() +
    ggtitle(paste("Gráfico", num_grafico, "\nSubdimensión", titulo)) +
    theme(legend.position = "bottom")
}

# Generar todos los gráficos
graficar_subdimension(control, apropia1:apropia3, "apropiación", 1)
graficar_subdimension(control, contexto4:contexto7, "contexto", 2)
graficar_subdimension(control, articula8:articula14, "articulación", 3)
graficar_subdimension(control, flexible15:flexible16, "flexibilidad", 4)
graficar_subdimension(control, implementa17:implementa20, "implementación", 5)
