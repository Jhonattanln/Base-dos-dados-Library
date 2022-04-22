### Importando bibliotecas

library(dplyr) ## biblioteca para manupula√ß√£o de dados
library(basedosdados) ## biblioteca para consuta dos dados
library(tidyverse)
library(lubridate)
library(magrittr)
library(scales)
library(sidrar)
library(ggrepel)
library(ggplot2) ## biblioteca para plotagem dos dados
library(ggthemes)

basedosdados::set_billing_id("resonant-petal-287222")


# Para carregar o dado direto no R
query <- "SELECT data_coleta, id_municipio, bairro_revenda, nome_estabelecimento, bandeira_revenda, produto, unidade_medida, preco_venda FROM `basedosdados.br_anp_precos_combustiveis.microdados`
WHERE id_municipio = '4106902' AND(unidade_medida = 'R$/litro')
ORDER BY data_coleta DESC"
df <- read_sql(query)

dplyr::glimpse(df)

drop <- c('id_municipio') ### deletar cÛdigo do municipio

gasolina_mensal <- df %>%
  filter(produto == 'gasolina') ### selecionando o produto
  dplyr::group_by(
    # cria uma coluna de data no formato "YYYY-MM"
    ano_mes = paste0(
      substr(x = as.character(), start = 1L, stop = 4L),
      "-",
      substr(x = as.character(data_coleta), start = 6L, stop = 7L)
    )
  )
  
colnames(df)

gasolina_mensal

########################################_________##################################

### Selecionando postos por gasolina
postos <- df %>%
  select(-drop) %>%
  filter(produto == 'gasolina') %>%
  rename(preÁo = preco_venda)
  
colnames(postos)

postos %>%
  select(-data_coleta) %>%
  group_by(nome_estabelecimento) %>%
  summarise(mean_preco = mean(preÁo)) %>%
  top_n(3, mean_preco)
  #count(bandeira_revenda, sort=TRUE) ### contando apariÁıes da bandeira

postos %>%
  group_by(bairro_revenda) %>%
  top_n(3, preco_venda)

years <- c(2015, 2016, 2017, 2018, 2019, 2020, 2021)

for (year in years){
  df = postos[postos$data_coleta == year]
}

View(ipca)
