### Importando bibliotecas

library(dplyr) ## biblioteca para manupulação de dados
library(basedosdados) ## biblioteca para consuta dos dados
library(tidyverse) 
library(ggplot2) ## biblioteca para plotagem dos dados

basedosdados::set_billing_id("resonant-petal-287222")


# Para carregar o dado direto no R
query <- "SELECT data_coleta, id_municipio, bairro_revenda, nome_estabelecimento, bandeira_revenda, produto, unidade_medida, preco_venda FROM `basedosdados.br_anp_precos_combustiveis.microdados`
WHERE id_municipio = '4106902' AND(unidade_medida = 'R$/litro')
ORDER BY data_coleta DESC"
df <- read_sql(query)

### Selecionando por anos

anos <- c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021)

for (i in anos){
  
}
