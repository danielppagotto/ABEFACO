

library(tidyverse)
library(readxl)



# carregando as tabelas necessarias com a pop pro faixa etaria de homem e a outra de mulher 

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
pop_rj$municipio <- gsub(" \\(RJ\\)", "", pop_rj$municipio) #retirando (RJ) do nome dos municipios
pop_rj <- pop_rj %>%
  mutate(cod_ibge = str_sub(cod_ibge, 1, -2)) #excluindo o digito verificador para ser compativel com a consulta do data_lake

#baixando o dataframe 
writexl::write_xlsx(pop_rj,"pop_rj_tratado.xlsx")


# pop_rj = dataframe que tem todos o municipios do RJ com a pop por faixa etaria e por sexo ja com as colunas empilhadas

#--------------------------- # Filtrando as faixas etarias 


#colocando as coluna de faixa etaria no tipo character para poder filtrar
pop_rj <- pop_rj%>%
  mutate(across(
    -c(cod_ibge, municipio, sexo,valor),  
    as.character                     
  ))

#renomenando a coluna valor para populacao
pop_rj <- pop_rj%>%
    rename(populacao = valor)


#colocando as faixas etaria acima de 60 anos no intervalo de 60 ou mais

#pop_rj_filtrado = dataframe que tem apenas as faixas etarias de acordo com a planilha de vacinacao

pop_rj_filtrado <- pop_rj %>%  
  mutate(faixa_etaria = case_when(
    faixa_etaria %in% c("60 anos", "61 anos", "62 anos", "63 anos", "64 anos",
                        "65 anos", "66 anos", "67 anos", "68 anos", "69 anos",
                        "70 anos", "71 anos", "72 anos", "73 anos", "74 anos",
                        "75 anos", "76 anos", "77 anos", "78 anos", "79 anos",
                        "80 anos", "81 anos", "82 anos", "83 anos", "84 anos",
                        "85 anos", "86 anos", "87 anos", "88 anos", "89 anos",
                        "90 anos", "91 anos", "92 anos", "93 anos", "94 anos",
                        "95 anos", "96 anos", "97 anos", "98 anos", "99 anos",
                        "100 anos ou mais") ~ "60 anos ou mais",
    TRUE ~ faixa_etaria  
  ))%>% #filtrando faixa etarias de acordo com a tabela de vacinacao
  group_by(cod_ibge, municipio, sexo, faixa_etaria) %>%  
  summarise(populacao = sum(populacao, na.rm = TRUE), .groups = "drop")%>%
  filter(faixa_etaria %in% c("Menos de 1 mês", "2 meses","3 meses","4 meses",
                             "5 meses","6 meses","7 meses","9 meses", "1 ano",
                             "4 anos","7 anos","9 anos","10 anos",
                             "11 anos","12 anos","13 anos", "14 anos")) 
      
#--------------------- dataframe do datalake

#Transformando a linhas da coluna de profissionais em duas colunas
oferta_prof_pivot <- oferta_prof %>%
  pivot_wider(
    names_from = prof_recod, #onde estao os dados que vão virar o nome das colunas     
    values_from = c(CH, fte40)) # os dados que vao para essa novas colunas
    
#renomenado a coluna do tec/auxiliar pq estava com espaco
oferta_prof_pivot <- oferta_prof_pivot %>%
  rename(fte40_tec_aux_enfermagem = `fte40_Técnico/auxiliar de enfermagem`,CH_tec_aux_enfermagem = `CH_Técnico/auxiliar de enfermagem` )



#----------------------- Preparando o mapa do RJ com o shapefile baixado do ibge

RJ <- st_read("01_script/00_bases/RJ_Municipios_2023/RJ_Municipios_2023.shp")

#retirando o digito verificador para poder fazer o leftjoin
RJ2 <- RJ %>%
  mutate(CD_MUN = str_sub(CD_MUN, 1, -2))



