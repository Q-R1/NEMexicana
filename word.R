library(funModeling)
library(tidyverse)
library(wordcloud2)
library(readxl)

Comenta_2_copia <- read.csv("Comenta_2_copia.csv")
# Leer el archivo con codificación UTF-8

funModeling::freq(Comenta_2_copia, path_out = "Graficos")
freq1 <-funModeling::  freq(Comenta_2_copia)
freq2 <-funModeling:: freq(Comenta_2_copia, input = c('palabra_clave'))

freq3 <- select(freq1, -percentage, -cumulative_perc)
freq3



wordcloud2(data=freq1, size = 0.7,shape = 'diamond',
           color = rep_len(c('Black','Red', 'Green', 'Blue', 'Orange',
                             'Purple', 'Brown', 'Grey', 'Darkblue', 'Darkred')
    ,nrow(freq3)))

