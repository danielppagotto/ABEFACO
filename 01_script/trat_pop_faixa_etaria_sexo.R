library(tidyverse)
library(readxl)

# carregando as tabelas necessarias 

tabela_rj_m <- read_excel("01_script/00_bases/tabela_rj_m.xlsx")
tabela_rj_h <- read_excel("01_script/00_bases/tabela_rj_h.xlsx")


#### Tratando os dados 

#-------------- base dados mulheres

#convertendo as colunas das faixas etarias para o mesmo tipo
pop_rj_m <- tabela_rj_m %>%
  mutate(across(
    -c(cod_ibge, municipio, sexo),  
    as.numeric                      
  ))
  
# tranformando colunas em linhas 
pop_rj_m_pivot <- pop_rj_m %>%
  pivot_longer(
    cols = -c(cod_ibge, municipio,sexo),     
    names_to = "faixa_etaria",       
    values_to = "valor")


#---------------- base dados homens

#convertendo as colunas das faixas etarias para o mesmo tipo
pop_rj_h <- tabela_rj_h %>%
  mutate(across(
    -c(cod_ibge, municipio, sexo),  
    as.numeric                      
  ))

#tranformando colunas em linhas
pop_rj_h_pivot <- pop_rj_h %>%
  pivot_longer(
    cols = -c(cod_ibge, municipio,sexo),     
    names_to = "faixa_etaria",       
    values_to = "valor")


#------------------------------ Juntando as bases de homens e mulheres 
  

pop_rj <- bind_rows(pop_rj_h_pivot, pop_rj_m_pivot)

writexl::write_xlsx(pop_rj,"pop_rj_tratado.xlsx")


