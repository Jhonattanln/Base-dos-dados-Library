### Importando bibliotecas

library(dplyr) ## biblioteca para manupulação de dados
library(basedosdados) ## biblioteca para consuta dos dados
library(tidyverse) 
library(ggplot2) ## biblioteca para plotagem dos dados

basedosdados::set_billing_id("resonant-petal-287222")
# Para carregar o dado direto no R
query <- "SELECT * FROM `basedosdados.br_anp_precos_combustiveis.microdados`"
read_sql(query)
