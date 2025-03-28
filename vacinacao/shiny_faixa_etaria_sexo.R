#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

#install.packages("leaflet")

#Pacotes necessarios 
library(shiny)
library(scales)
library(DT)
library(leaflet)
library(sf)
library(dplyr)
library(RColorBrewer)
library(ggplot2)


#Dataframes utilizados, todos tratados no script trat_pop_faixa_etaria_sexo 

pop_rj # tem os dados da populacao por faixa etaria e sexo do ibge, ja com as colunas empilhadas 
pop_rj_filtrado # tem as faixa etaria de acordo com a planilha de vacinacao
oferta_prof_pivot # dataframe do datalake tratado, com a coluna de enfermeiros e tec/aux

# Define UI for application 
ui <- fluidPage(

    # Application title
    titlePanel("Vacinação RJ"),

    # Sidebar with a slider input for number of bins 
    tabsetPanel(
    tabPanel("População por município, sexo e faixa etária",
    sidebarLayout(
        sidebarPanel(
          #Parametros de visualizacao da selecao e dos sliders, titulo,escala,como inicia ao abrir o app...
          selectInput("municipio1", 
                      "Selecione os municípios:",
                      choices = c("Todos", unique(pop_rj$municipio)),  
                      selected = "Todos", 
                      multiple = TRUE), #pode escolher varias opcoes
                      
          selectInput("faixa_et1", 
                      "Selecione os faixa etária:",
                      choices = c("Todas", unique(pop_rj$faixa_etaria)),  
                      selected = "Menos de 1 ano", 
                      multiple = TRUE),
          selectInput("sexo1", 
                      "Selecione o sexo:",
                      choices = c("Todos", unique(pop_rj$sexo)),  
                      selected = "Todos", 
                      multiple = TRUE),
           
          sliderInput("percentual",
                        "População:",
                        min = 0,
                        max = 100,
                        value = 80)
        ),

        # Show table
        mainPanel(
          DTOutput("tabela1")
        )
    )
),

      tabPanel("Taxa de vacinação por município, sexo e faixa etária",
         sidebarLayout(
           sidebarPanel(
             #Parametros de visualizacao da selecao e dos sliders, titulo,escala,como inicia ao abrir o app...
             selectInput("municipio2", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             selectInput("sexo2", 
                         "Selecione o sexo:",
                         choices = c("Todos", unique(pop_rj_filtrado$sexo)),  
                         selected = "Todos", 
                         multiple = TRUE),
             sliderInput("percentual_pop",
                         "População:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_1",
                         "BCG e Hepatite B:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_2",
                         "1Penta,Poliomielite VIP,Pneumo 10v,VRH:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_3",
                         "2Penta,Poliomielite VIP,Pneumo 10v,VRH:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_4",
                         "Penta,Poliomielite VIP:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_5",
                         "DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_6",
                         "DT,Poliomielite VOP,VFA,Varicela:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_7",
                         "1Meningo C:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_8",
                         "2Meningo C:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_9",
                         "1HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_10",
                         "2HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_11",
                         "1Meningo ACWY,HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_12",
                         "2Meningo ACWY,HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_13",
                         "3Meningo ACWY,HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_14",
                         "4Meningo ACWY,HPV4:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_15",
                         "1Covid- 19:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_16",
                         "Covid- 19,VFA:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("percentual_17",
                         "dt/Dupla Adulto:",
                         min = 0,
                         max = 100,
                         value = 80)
            
           ),
             mainPanel(
               DTOutput("tabela2") 
         )
      )
  ),
    tabPanel("Tempo de vacinação",
             sidebarLayout(
               sidebarPanel(
                 #Parametros de visualizacao da selecao e dos sliders, titulo,escala,como inicia ao abrir o app...
                 selectInput("municipio3", 
                             "Selecione os municípios:",
                             choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                             selected = "Todos", 
                             multiple = TRUE), 
                 selectInput("sexo3", 
                             "Selecione o sexo:",
                             choices = c("Todos", unique(pop_rj_filtrado$sexo)),  
                             selected = "Todos", 
                             multiple = TRUE),
                 sliderInput("percentual_tempo",
                             "Tempo de vacinação (minutos):",
                             min = 0,
                             max = 60,
                             value = 30)
                 
               ),
               mainPanel(
                 DTOutput("tabela3") 
           )
      )
),
         tabPanel("Necessidades",
         sidebarLayout(
           sidebarPanel(
             #Parametros de visualizacao da selecao e dos sliders, titulo,escala,como inicia ao abrir o app...
             selectInput("municipio4", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             sliderInput("ttd",
                         "TTD:",
                         min = 0,
                         max = 1700,
                         value = 1576),

           ),
           mainPanel(
             DTOutput("tabela4") 
           )
      )
),
         
      tabPanel("Oferta",
         sidebarLayout(
           sidebarPanel(
             #Parametros de visualizacao da selecao e dos sliders, titulo,escala,como inicia ao abrir o app...
             selectInput("municipio5", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             sliderInput("at_ind",
                         "Atividade indireta:",
                         min = 0,
                         max = 100,
                         value = 40),
             sliderInput("fc_clinico",
                         "Foco clínico:",
                         min = 0,
                         max = 100,
                         value = 10),
             
           ),
           mainPanel(
             DTOutput("tabela5"),
           )
     )
),
      tabPanel("Mapas",
          #sidebarLayout(
          #sidebarPanel(
        
            mainPanel(
            fluidRow(
              column(6, tags$h4("Enfermeiros"),leafletOutput("mapa1", height = 500, width = 500)), #mapa 1
              
              column(6,tags$h4("Gráfico Necessidade e Oferta de Profissionais"),plotOutput("graficoNF", height = 500, width = 600)
              )
            ),
             
          fluidRow(
            column(6,tags$h4("Técnico e Auxiliar de Enfermagem"),leafletOutput("mapa2", height = 500, width = 500)
            )

            #column(6,tags$h4("Gráfico de Técnico e Auxiliar de Enfermagem"),plotOutput("graficoTecnico", height = 500)
                   
                   
             
)))))


#-------------------------------------
server <- function(input, output) {
  
  #Essa funcao serve para integrar as tabelas nas outras abas e fazer com que mudando uma, modifique a proxima aba
  dados_reativos <- reactiveVal()
  dados_reativos2 <- reactiveVal()
  dados_reativos3 <- reactiveVal()
  dados_reativos4 <- reactiveVal()
  
 

  output$tabela1 <- renderDT({
  
    #Definindo os parametros da parte do filtro dos municipios, do sexo e da faixa etaria
    if ("Todos" %in% input$municipio1) {
      pop_shy <- pop_rj  
    } else {
      pop_shy <- subset(pop_rj, municipio %in% input$municipio1) 
      
    }
    
    if ("Todas" %in% input$faixa_et1) {
      pop_shy <- pop_shy
    } else {
      pop_shy <- subset(pop_shy, faixa_etaria %in% input$faixa_et1)  
    }
    
    
    if ("Todos" %in% input$sexo1) {
      pop_shy <- pop_shy
    } else {
      pop_shy <- subset(pop_shy, sexo %in% input$sexo1)  
    }
    
    #Calculo do slider da populacao
    pop_shy$populacao <- pop_shy$populacao * (1 + input$percentual / 100)
    
    pop_shy%>% #retirando o cod_ibge da visualizacao da tabela
      select(-cod_ibge)
    
    datatable(pop_shy) %>% # Diminuindo a casas decimais das colunas
      formatRound(columns = c("populacao"), digits = 2)
    
    
  })
  
  output$tabela2 <- renderDT({
    pop_shy2 <- pop_rj_filtrado
    
    #calculo do slider da populacao
    pop_shy2$populacao <- pop_shy2$populacao * (1 + input$percentual_pop / 100)
    
    
    #Fazendo a coluna com os nomes das vacinas referentes a cada uma das faixas etarias que devem tomar
    pop_shy2$vacinas <- ifelse(pop_shy2$faixa_etaria == "Menos de 1 mês", "BCG e Hepatite B",
                                            ifelse(pop_shy2$faixa_etaria == "2 meses", "1Penta,Poliomielite VIP,Pneumo 10v,VRH",
                                                   ifelse(pop_shy2$faixa_etaria == "4 meses","2Penta,Poliomielite VIP,Pneumo 10v,VRH",
                                                          ifelse(pop_shy2$faixa_etaria == "6 meses","Penta,Poliomielite VIP,Covid- 19",
                                                                 ifelse(pop_shy2$faixa_etaria == "1 ano","DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A",
                                                                        ifelse(pop_shy2$faixa_etaria == "4 anos","DT,Poliomielite VOP,VFA,Varicela",
                                                                               ifelse(pop_shy2$faixa_etaria == "3 meses","1Meningo C",
                                                                                      ifelse(pop_shy2$faixa_etaria == "5 meses","2Meningo C",
                                                                                             ifelse(pop_shy2$faixa_etaria == "9 anos","1HPV4",
                                                                                                    ifelse(pop_shy2$faixa_etaria == "10 anos","2HPV4",
                                                                                                           ifelse(pop_shy2$faixa_etaria == "11 anos","1Meningo ACWY,HPV4",
                                                                                                                  ifelse(pop_shy2$faixa_etaria == "12 anos","2Meningo ACWY,HPV4",
                                                                                                                         ifelse(pop_shy2$faixa_etaria == "13 anos","3Meningo ACWY,HPV4",
                                                                                                                                ifelse(pop_shy2$faixa_etaria == "14 anos","4Meningo ACWY,HPV4",
                                                                                                                                       
                                                                                                                         
                                                                                                                                      ifelse(pop_shy2$faixa_etaria == "7 meses","1Covid- 19",
                                                                                                                                            ifelse(pop_shy2$faixa_etaria == "9 meses","Covid- 19,VFA",
                                                                                                                                                  ifelse(pop_shy2$faixa_etaria == "7 anos","dt/Dupla Adulto", 0)))))))))))))))))
    #Fazendo a coluna imunizacao e fazendo o slider para cada grupo de vacinas 
    pop_shy2$imunizacao <- 0
    pop_shy2$imunizacao[pop_shy2$vacinas == "BCG e Hepatite B"] <- pop_shy2$populacao[pop_shy2$vacinas == "BCG e Hepatite B"] * (input$percentual_1 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "1Penta,Poliomielite VIP,Pneumo 10v,VRH"] <- pop_shy2$populacao[pop_shy2$vacinas == "1Penta,Poliomielite VIP,Pneumo 10v,VRH"] * (input$percentual_2 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "2Penta,Poliomielite VIP,Pneumo 10v,VRH"] <- pop_shy2$populacao[pop_shy2$vacinas == "2Penta,Poliomielite VIP,Pneumo 10v,VRH"] * (input$percentual_3 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "Penta,Poliomielite VIP"] <- pop_shy2$populacao[pop_shy2$vacinas == "Penta,Poliomielite VIP"] * (input$percentual_4 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A"] <- pop_shy2$populacao[pop_shy2$vacinas == "DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A"] * (input$percentual_5 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "DT,Poliomielite VOP,VFA,Varicela"] <- pop_shy2$populacao[pop_shy2$vacinas == "DT,Poliomielite VOP,VFA,Varicela"] * (input$percentual_6 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "1Meningo C"] <- pop_shy2$populacao[pop_shy2$vacinas == "1Meningo C"] * (input$percentual_7 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "2Meningo C"] <- pop_shy2$populacao[pop_shy2$vacinas == "2Meningo C"] * (input$percentual_8 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "1HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "1HPV4"] * (input$percentual_9 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "2HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "2HPV4"] * (input$percentual_10 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "1Meningo ACWY,HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "1Meningo ACWY,HPV4"] * (input$percentual_11 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "2Meningo ACWY,HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "2Meningo ACWY,HPV4"] * (input$percentual_12 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "3Meningo ACWY,HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "3Meningo ACWY,HPV4"] * (input$percentual_13 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "4Meningo ACWY,HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "4Meningo ACWY,HPV4"] * (input$percentual_14 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "1Covid- 19"] <- pop_shy2$populacao[pop_shy2$vacinas == "1Covid- 19"] * (input$percentual_15 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "Covid- 19,VFA"] <- pop_shy2$populacao[pop_shy2$vacinas == "Covid- 19,VFA"] * (input$percentual_16 / 100)
    pop_shy2$imunizacao[pop_shy2$vacinas == "dt/Dupla Adulto"] <- pop_shy2$populacao[pop_shy2$vacinas == "dt/Dupla Adulto"] * (input$percentual_17 / 100)
    
    pop_shy2<-pop_shy2 %>%
      mutate(
        imunizacao = round(imunizacao, 2))
    
    dados_reativos(pop_shy2)
    
    pop_shy2_1 <-pop_shy2
    
    #Definindo os parametros da parte do filtro dos municipios e do sexo
    if ("Todos" %in% input$municipio2) {
      pop_shy2_1 <- pop_shy2_1 #esse data frame pop_rj_filtrado tem as faixa etarias filtradas de acordo com a planilha de vacinas 
    } else {
      pop_shy2_1 <- subset(pop_shy2_1, municipio %in% input$municipio2) 
      
    }
    
    
    if ("Todos" %in% input$sexo2) {
      pop_shy2_1 <- pop_shy2_1
    } else {
      pop_shy2_1 <- subset(pop_shy2_1, sexo %in% input$sexo2)  
    }
    
    pop_shy2_2<- pop_shy2_1%>% #retirando o cod_ibge da visualizacao da tabela
      select(-cod_ibge)
    
    
    
  })
    
    output$tabela3 <- renderDT({
      req(dados_reativos())  
      dados_reativos()
      
      pop_shy3 <- dados_reativos()
      
      #calculo do slider da populacao
      pop_shy3 <- pop_shy3
      
      #pop_shy3$populacao <- pop_shy3$populacao * (1 + input$percentual_pop / 100)
      
      #Fazendo a coluna de minutos 
      pop_shy3$tempo_minutos <- pop_shy3$imunizacao * input$percentual_tempo 
      
      pop_shy3$tempo_horas <- pop_shy3$tempo_minutos / 60 #transformando a coluna minutos em horas
      
      pop_shy3<-pop_shy3 %>%
        mutate(
          tempo_minutos = round(tempo_minutos, 2),
          tempo_horas = round(tempo_horas, 2))
      
      #-------------------
      
      dados_reativos2(pop_shy3) #acionando os dados_reativos antes de retirar o cod_ibge pq vais ser necessario para o leftjoin da proxima aba
      
      #--------------------
      pop_shy3_2 <- pop_shy3%>% #retirando o cod_ibge da visualizacao da tabela
        select(-cod_ibge)
    
      
      #Definindo os parametros da parte do filtro dos municipios e do sexo
      if ("Todos" %in% input$municipio3) {
        pop_shy3_3 <- pop_shy3_2 
      } else {
        pop_shy3_3 <- subset(pop_shy3_2 , municipio %in% input$municipio3) 
        
      }
      
      
      if ("Todos" %in% input$sexo3) {
        pop_shy3_3 <- pop_shy3_3
      } else {
        pop_shy3_3 <- subset(pop_shy3_3, sexo %in% input$sexo3)  
      }
      
      pop_shy3_3
    
  
  })
    
      
    output$tabela4 <- renderDT({
      req(dados_reativos2())  
      dados_reativos2()
   
      pop_shy4 <- dados_reativos2()
      
      
      #Fazendo a coluna de necessidades e total_horas
      pop_shy4_2 <- pop_shy4%>%
        group_by(cod_ibge, municipio) %>%
        summarise(total_horas = sum(tempo_horas), necessidades = total_horas/ input$ttd) 
      
      
      pop_shy4_2_1 <- pop_shy4_2 %>%
        ungroup()
      
      pop_shy4_2_1 <-pop_shy4_2_1 %>%
        mutate(
          total_horas = round(total_horas, 2),
          necessidades = round(necessidades, 2))

      dados_reativos3(pop_shy4_2_1)#acionando os dados_reativos antes de retirar o cod_ibge pq vais ser necessario para o leftjoin da proxima aba

      
      pop_shy4_3 <- pop_shy4_2_1%>% #retirando o cod_ibge da visualizacao da tabela
        select(-cod_ibge)
      
      
      if ("Todos" %in% input$municipio4) {
        pop_shy4_3_1 <- pop_shy4_3
      } else {
        pop_shy4_3_1 <- subset(pop_shy4_3, municipio %in% input$municipio4) 
        
      }
      
      
      pop_shy4_3_1
      
    })
    
    output$tabela5 <- renderDT({
      req(dados_reativos3())
      
      pop_shy0 <- dados_reativos3()
      #print(pop_shy0)

      #tranformando no mesmo tipo a coluna do codigo para o lefjoin
      oferta_prof_pivot$codufmun<- as.character(oferta_prof_pivot$codufmun)
      
      #Tirando a coluna de oferta calculada no data lake para fazer ela dinamica na aba
      oferta_prof_pivot_2 <- oferta_prof_pivot%>%
        select(-fte40_Enfermeiro,-fte40_tec_aux_enfermagem)
      
      print(oferta_prof_pivot_2)
      
      #juntando a tabela da aba anterior com a importada do data_lake, ja tratada no script
      pop_shy5 <- left_join(pop_shy0 , oferta_prof_pivot_2, by = c("cod_ibge"="codufmun"))
      
      #Definindo os paramentros dos sliders de atividade indireta e foco clinico 
      pop_shy5$CH_Enfermeiro <- pop_shy5$CH_Enfermeiro - input$at_ind
      pop_shy5$CH_Enfermeiro <- pop_shy5$CH_Enfermeiro - input$fc_clinico
      
      pop_shy5$CH_tec_aux_enfermagem <- pop_shy5$CH_tec_aux_enfermagem - input$at_ind
      pop_shy5$CH_tec_aux_enfermagem <- pop_shy5$CH_tec_aux_enfermagem - input$fc_clinico
      
      #Fazendo novamente o calculo da oferta para colocar como uma coluna que modifica com a carga horaria
      pop_shy5<-pop_shy5%>%
        mutate(
          oferta_enfermeiro = CH_Enfermeiro / 40,
          oferta_tec_aux_enfermagem = CH_tec_aux_enfermagem / 40
        )
      
      
      #Fazendo a coluna de resultado enfermeiro e resultado Tec. e Aux
      pop_shy5$resultado_enfermeiro <- pop_shy5$oferta_enfermeiro - pop_shy5$necessidades 
      pop_shy5$resultado_tec_aux_enfermagem <- pop_shy5$oferta_tec_aux_enfermagem - pop_shy5$necessidades
      
      
      #Fazendo a coluna de percentual de enfermeiro e de Tec. e Aux
      pop_shy5$resultado_perc_enfermeiro <- (pop_shy5$oferta_enfermeiro/pop_shy5$necessidades)*100
      pop_shy5$resultado_perc_tec_aux_enfermagem <- (pop_shy5$oferta_tec_aux_enfermagem/pop_shy5$necessidades)*100

      #aredondando os valores para 2 casas decimais
      pop_shy5 <-pop_shy5 %>%
        mutate(
          resultado_enfermeiro = round(resultado_enfermeiro, 2),
          resultado_tec_aux_enfermagem = round(resultado_tec_aux_enfermagem, 2),
          resultado_perc_enfermeiro = round(resultado_perc_enfermeiro, 2),
          resultado_perc_tec_aux_enfermagem = round(resultado_perc_tec_aux_enfermagem, 2))
      
      dados_reativos4(pop_shy5) #acionando os dados_reativos antes de retirar o cod_ibge pq vais ser necessario para o leftjoin da proxima aba
      
      
      pop_shy5_1<- pop_shy5%>% #retirando o cod_ibge da visualizacao da tabela e retirando a duplicada depois do lefjoin
        rename(municipio = municipio.x)%>%
        select(-municipio.y, -cod_ibge)
      
      if ("Todos" %in% input$municipio5) {
        pop_shy5_1 <- pop_shy5_1
      } else {
        pop_shy5_1 <- subset(pop_shy5_1, municipio %in% input$municipio5) 
        
      }
      
      pop_shy5_1

      
    })   #Parametros do mapa 1
      
      output$mapa1 <- renderLeaflet({
        
        req(dados_reativos4())
        
        pop_shy6 <- dados_reativos4() 
        
        #juntando o dataframe com os shapefile e o dataframe com os dados de oferta e necessidade da aba anterior
        rio <- RJ2 %>% left_join(pop_shy6, by = c("CD_MUN"="cod_ibge"))
        print(head(rio))
        
        #Definindo os dados da paleta de cor, bins = quantidade do intervalo dos dados, domain= coluna dos dados
        paletacor <- colorBin(
          palette = c("#eb0202", "#f2cb05", "#4cdb39"),
          domain = rio$resultado_enfermeiro,      
          bins = c(-Inf,  0, 50, 150, 300, 500, 1000, Inf),     
          na.color = "gray")
        
        leaflet(data = rio) %>%
          addTiles() %>%
          addPolygons(
            fillColor = ~paletacor(resultado_enfermeiro),#cores do municipio de acordo com a funcao paletacor e dados da coluna indicada
            weight = 1, #espessura das linhas 
            color = "black", #cor das linhas em volta dos municipios
            fillOpacity = 0.6, #opacidade da cor dos municipios
            label = ~paste0(NM_MUN, ": ", round(resultado_enfermeiro, 1), " Enfermeiros"), #dados que aparecem no quadro quando passa o mouse 
            highlight = highlightOptions(weight = 3, color = "white", bringToFront = TRUE)#parametros de quando o municipio e destacado ao passar o mouse
          ) %>%
          addLegend(pal = paletacor, values = rio$resultado_enfermeiro, opacity = 0.5, title = "Legenda")#parametros da legenda 
      
  })
        output$graficoNF <- renderPlot({
          
          req(dados_reativos4())
          
          pop_shy7 <- dados_reativos4() 
          print(pop_shy7)
          
          pop_shy7<-pop_shy7%>%
            select(necessidades,oferta_enfermeiro, oferta_tec_aux_enfermagem)
          
          soma_enfermeiro <- sum(pop_shy7$oferta_enfermeiro, na.rm = TRUE)
          soma_necessidade <- sum(pop_shy7$necessidades, na.rm = TRUE)
          soma_tec <- sum(pop_shy7$oferta_tec_aux_enfermagem, na.rm = TRUE)
          
          # Criando o gráfico de barras com as somas
          ggplot(data = data.frame(Metrica = c("Necessidade", "Oferta Enfermeiro", "Oferta Téc/Aux. Enfermagem"),
                                   Valor = c(soma_necessidade, soma_enfermeiro, soma_tec)),
                 aes(x = Metrica, y = Valor,fill = Metrica)) +
            geom_bar(stat = "identity") +
            labs(x = NULL, y = NULL, fill = NULL) +
            geom_text(aes(label = round(Valor, 1)), vjust = -0.5, size = 5) +
            scale_fill_manual(values = c("#eb0202", "#4cdb39", "#088c2c")) + # Cor das barras
            theme_minimal()+
            theme(
              axis.text.x = element_blank(),  # Tamanho dos textos do eixo X
              axis.text.y = element_text(size = 15),  # Tamanho dos textos do eixo Y
              legend.text = element_text(size = 15),  # Tamanho do texto da legenda
              
            )

      
    })  #Parametros do mapa 2
      
      output$mapa2 <- renderLeaflet({
        
        req(dados_reativos4())
        
        pop_shy8 <- dados_reativos4() 
        
        
        rio2 <- RJ2 %>% left_join(pop_shy8, by = c("CD_MUN"="cod_ibge"))
        print(head(rio2))
        
        paletacor <- colorBin(
          palette = c("#eb0202", "#f2cb05", "#4cdb39"),
          domain = rio2$resultado_tec_aux_enfermagem,      
          bins = c(-Inf, 0, 50, 150, 300, 500, 1000, Inf),     
          na.color = "gray")
        
        leaflet(data = rio2) %>%
          addTiles() %>%
          addPolygons(
            fillColor = ~paletacor(resultado_tec_aux_enfermagem),
            weight = 1,
            color = "black",
            fillOpacity = 0.7,
            label = ~paste0(NM_MUN, ": ", round(resultado_tec_aux_enfermagem, 1), " Técnico e auxiliar de enfermagem"),  
            highlight = highlightOptions(weight = 3, color = "white", bringToFront = TRUE)
          ) %>%
          addLegend(pal = paletacor, values = rio2$resultado_tec_aux_enfermagem, opacity = 0.7, title = "Legenda")
        
   }) 
      
      
       
}

# Run the application 
shinyApp(ui = ui, server = server)


