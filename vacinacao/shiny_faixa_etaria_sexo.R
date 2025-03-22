#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(scales)

pop_rj_filtrado
pop_rj
oferta_prof_pivot

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Vacinação RJ"),

    # Sidebar with a slider input for number of bins 
    tabsetPanel(
    tabPanel("População por município, sexo e faixa etária",
    sidebarLayout(
        sidebarPanel(
          
          selectInput("municipio", 
                      "Selecione os municípios:",
                      choices = c("Todos", unique(pop_rj$municipio)),  
                      selected = "Todos", 
                      multiple = TRUE),
                      
          selectInput("faixa_et", 
                      "Selecione os faixa etária:",
                      choices = c("Todas", unique(pop_rj$faixa_etaria)),  
                      selected = "Menos de 1 ano", 
                      multiple = TRUE),
          selectInput("sexo", 
                      "Selecione o sexo:",
                      choices = c("Todos", unique(pop_rj$sexo)),  
                      selected = "Todos", 
                      multiple = TRUE),
           
          sliderInput("percentual",
                        "Ajustar percentual:",
                        min = 0,
                        max = 100,
                        value = 80)
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tableOutput("tabela1")
        )
    )
),

      tabPanel("Taxa de vacinação por município, sexo e faixa etária",
         sidebarLayout(
           sidebarPanel(
             
             selectInput("municipio", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             selectInput("sexo", 
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
               tableOutput("tabela2") 
         )
      )
  ),
    tabPanel("Tempo de vacinação",
             sidebarLayout(
               sidebarPanel(
                 
                 selectInput("municipio", 
                             "Selecione os municípios:",
                             choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                             selected = "Todos", 
                             multiple = TRUE),
                 selectInput("sexo", 
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
                             value = 80),
                 sliderInput("percentual_tempo",
                             "Tempo de vacinação (minutos):",
                             min = 0,
                             max = 60,
                             value = 30)
                 
               ),
               mainPanel(
                 tableOutput("tabela3") 
           )
      )
),
         tabPanel("Necessidades",
         sidebarLayout(
           sidebarPanel(
             
             selectInput("municipio", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             sliderInput("ttd",
                         "População:",
                         min = 0,
                         max = 1700,
                         value = 1576),

           ),
           mainPanel(
             tableOutput("tabela4") 
           )
      )
),
         
         tabPanel("Oferta",
         sidebarLayout(
           sidebarPanel(
             
             selectInput("municipio", 
                         "Selecione os municípios:",
                         choices = c("Todos", unique(pop_rj_filtrado$municipio)),  
                         selected = "Todos", 
                         multiple = TRUE),
             sliderInput("at_ind",
                         "Atividade indireta:",
                         min = 0,
                         max = 100,
                         value = 80),
             sliderInput("fc_clinico",
                         "Foco clínico:",
                         min = 0,
                         max = 100,
                         value = 80),
             
           ),
           mainPanel(
             tableOutput("tabela5")  
             
             
             
             
)))))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  dados_reativos <- reactiveVal()
  dados_reativos2 <- reactiveVal()
  
 

  output$tabela1 <- renderTable({
  
    
    if ("Todos" %in% input$municipio) {
      pop_shy <- pop_rj  
    } else {
      pop_shy <- subset(pop_rj, municipio %in% input$municipio) 
      
    }
    
    if ("Todas" %in% input$faixa_et) {
      pop_shy <- pop_shy
    } else {
      pop_shy <- subset(pop_shy, faixa_etaria %in% input$faixa_et)  
    }
    
    
    if ("Todos" %in% input$sexo) {
      pop_shy <- pop_shy
    } else {
      pop_shy <- subset(pop_shy, sexo %in% input$sexo)  
    }
    
    pop_shy$populacao <- pop_shy$populacao * (1 + input$percentual / 100)
    
    pop_shy%>%
      select(-cod_ibge)
    
  })
  
  output$tabela2 <- renderTable({
    
    
    if ("Todos" %in% input$municipio) {
      pop_shy2 <- pop_rj_filtrado 
    } else {
      pop_shy2 <- subset(pop_rj_filtrado, municipio %in% input$municipio) 
      
    }
    
    
    if ("Todos" %in% input$sexo) {
      pop_shy2 <- pop_shy2
    } else {
      pop_shy2 <- subset(pop_shy2, sexo %in% input$sexo)  
    }
    
    
    
    pop_shy2$populacao <- pop_shy2$populacao * (1 + input$percentual_pop / 100)
    
    
    
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
    
    
    
    pop_shy2%>%
      select(-cod_ibge)
    
    
  })
    
    output$tabela3 <- renderTable({
      
      
      if ("Todos" %in% input$municipio) {
        pop_shy3 <- pop_rj_filtrado 
      } else {
        pop_shy3 <- subset(pop_rj_filtrado, municipio %in% input$municipio) 
        
      }
      
      
      if ("Todos" %in% input$sexo) {
        pop_shy3 <- pop_shy3
      } else {
        pop_shy3 <- subset(pop_shy3, sexo %in% input$sexo)  
      }
      
      
      
      pop_shy3$populacao <- pop_shy3$populacao * (1 + input$percentual_pop / 100)
      
      
      pop_shy3$vacinas <- ifelse(pop_shy3$faixa_etaria == "Menos de 1 mês", "BCG e Hepatite B",
                                 ifelse(pop_shy3$faixa_etaria == "2 meses", "1Penta,Poliomielite VIP,Pneumo 10v,VRH",
                                        ifelse(pop_shy3$faixa_etaria == "4 meses","2Penta,Poliomielite VIP,Pneumo 10v,VRH",
                                               ifelse(pop_shy3$faixa_etaria == "6 meses","Penta,Poliomielite VIP,Covid- 19",
                                                      ifelse(pop_shy3$faixa_etaria == "1 ano","DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A",
                                                             ifelse(pop_shy3$faixa_etaria == "4 anos","DT,Poliomielite VOP,VFA,Varicela",
                                                                    ifelse(pop_shy3$faixa_etaria == "3 meses","1Meningo C",
                                                                           ifelse(pop_shy3$faixa_etaria == "5 meses","2Meningo C",
                                                                                  ifelse(pop_shy3$faixa_etaria == "9 anos","1HPV4",
                                                                                         ifelse(pop_shy3$faixa_etaria == "10 anos","2HPV4",
                                                                                  ifelse(pop_shy3$faixa_etaria == "11 anos","1Meningo ACWY,HPV4",
                                                                                         ifelse(pop_shy3$faixa_etaria == "12 anos","2Meningo ACWY,HPV4",
                                                                                                ifelse(pop_shy3$faixa_etaria == "13 anos","3Meningo ACWY,HPV4",
                                                                                                       ifelse(pop_shy3$faixa_etaria == "14 anos","4Meningo ACWY,HPV4",
                                                                                                              
                                                                                                              ifelse(pop_shy3$faixa_etaria == "7 meses","1Covid- 19",
                                                                                                                     ifelse(pop_shy3$faixa_etaria == "9 meses","Covid- 19,VFA",
                                                                                                                            ifelse(pop_shy3$faixa_etaria == "7 anos","dt/Dupla Adulto",0)))))))))))))))))
      
      pop_shy3$imunizacao <- 0
      pop_shy3$imunizacao[pop_shy3$vacinas == "BCG e Hepatite B"] <- pop_shy3$populacao[pop_shy3$vacinas == "BCG e Hepatite B"] * (input$percentual_1 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "1Penta,Poliomielite VIP,Pneumo 10v,VRH"] <- pop_shy3$populacao[pop_shy3$vacinas == "1Penta,Poliomielite VIP,Pneumo 10v,VRH"] * (input$percentual_2 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "2Penta,Poliomielite VIP,Pneumo 10v,VRH"] <- pop_shy3$populacao[pop_shy3$vacinas == "2Penta,Poliomielite VIP,Pneumo 10v,VRH"] * (input$percentual_3 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "Penta,Poliomielite VIP"] <- pop_shy3$populacao[pop_shy3$vacinas == "Penta,Poliomielite VIP"] * (input$percentual_4 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A"] <- pop_shy3$populacao[pop_shy3$vacinas == "DT,Poliomielite VOP,Pneumo 10v,Meningo C,Tríplice Viral,Treta Viral,Hepatite A,Hepatite A"] * (input$percentual_5 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "DT,Poliomielite VOP,VFA,Varicela"] <- pop_shy3$populacao[pop_shy3$vacinas == "DT,Poliomielite VOP,VFA,Varicela"] * (input$percentual_6 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "1Meningo C"] <- pop_shy3$populacao[pop_shy3$vacinas == "1Meningo C"] * (input$percentual_7 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "2Meningo C"] <- pop_shy3$populacao[pop_shy3$vacinas == "2Meningo C"] * (input$percentual_8 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "1HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "1HPV4"] * (input$percentual_9 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "2HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "2HPV4"] * (input$percentual_10 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "1Meningo ACWY,HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "1Meningo ACWY,HPV4"] * (input$percentual_11 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "2Meningo ACWY,HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "2Meningo ACWY,HPV4"] * (input$percentual_12 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "3Meningo ACWY,HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "3Meningo ACWY,HPV4"] * (input$percentual_13 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "4Meningo ACWY,HPV4"] <- pop_shy3$populacao[pop_shy3$vacinas == "4Meningo ACWY,HPV4"] * (input$percentual_14 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "1Covid- 19"] <- pop_shy3$populacao[pop_shy3$vacinas == "1Covid- 19"] * (input$percentual_15 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "Covid- 19,VFA"] <- pop_shy3$populacao[pop_shy3$vacinas == "Covid- 19,VFA"] * (input$percentual_16 / 100)
      pop_shy3$imunizacao[pop_shy3$vacinas == "dt/Dupla Adulto"] <- pop_shy3$populacao[pop_shy3$vacinas == "dt/Dupla Adulto"] * (input$percentual_17 / 100)
      
      
      pop_shy3$tempo_minutos <- pop_shy3$imunizacao * input$percentual_tempo 
      
      pop_shy3$tempo_horas <- pop_shy3$tempo_minutos / 60
      
      dados_reativos(pop_shy3)
      
      pop_shy3_2 <- pop_shy3%>%
        select(-cod_ibge)
      
      
      pop_shy3_2
  })
    
      
    output$tabela4 <- renderTable({
      req(dados_reativos())  
      dados_reativos()
   
      pop_shy4 <- dados_reativos()
      
      if ("Todos" %in% input$municipio) {
        pop_shy4<- pop_shy4
      } else {
        pop_shy4 <- subset(pop_shy4, municipio %in% input$municipio) 
        
      }
      

      pop_shy4_2 <- pop_shy4%>%
        group_by(cod_ibge, municipio) %>%
        summarise(total_horas = sum(tempo_horas), necessidades = total_horas/ input$ttd) 
        
      
      pop_shy4_2_1 <- pop_shy4_2 %>%
        ungroup()
      
      dados_reativos2(pop_shy4_2_1)

      
      pop_shy4_3 <- pop_shy4_2_1%>%
        select(-cod_ibge)
      
      pop_shy4_3
      
    })
    
    output$tabela5 <- renderTable({
      req(dados_reativos2())
      
      pop_shy0 <- dados_reativos2() 

      oferta_prof_pivot$codufmun<- as.character(oferta_prof_pivot$codufmun)
      
      pop_shy5 <- left_join(pop_shy0 , oferta_prof_pivot, by = c("cod_ibge"="codufmun"))
      
      pop_shy5$oferta_enfermeiro <- pop_shy5$fte40_Enfermeiro - pop_shy5$necessidades 
      pop_shy5$oferta_tec_aux_enfermagem <- pop_shy5$fte40_tec_aux_enfermagem - pop_shy5$necessidades 
      
      pop_shy5 <- pop_shy5%>%
        rename(municipio = municipio.x)%>%
        select(-municipio.y, -cod_ibge)
      
      pop_shy5
      
    })  
}

# Run the application 
shinyApp(ui = ui, server = server)


