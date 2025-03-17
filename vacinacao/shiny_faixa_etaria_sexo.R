#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

pop_rj

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("População por sexo e faixa etária"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          
          selectInput("municipio", 
                      "Selecione os municípios:",
                      choices = c("Todos", unique(pop_rj$municipio)),  
                      selected = NULL, 
                      multiple = TRUE),
          selectInput("faixa_et", 
                      "Selecione os faixa etária:",
                      choices = c("Todas", unique(pop_rj$faixa_etaria)),  
                      selected = NULL, 
                      multiple = TRUE),
          selectInput("sexo", 
                      "Selecione o sexo:",
                      choices = c("Todos", unique(pop_rj$sexo)),  
                      selected = NULL, 
                      multiple = TRUE),
           
          sliderInput("percentual",
                        "Ajustar percentual:",
                        min = 0,
                        max = 100,
                        value = 0)
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tableOutput("tabela")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$tabela <- renderTable({
  
    
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
    
    
    if ("Todas" %in% input$sexo) {
      pop_shy <- pop_shy
    } else {
      pop_shy <- subset(pop_shy, sexo %in% input$sexo)  
    }
    
    
    pop_shy$valor <- pop_shy$valor * (1 + input$percentual / 100)
    
    
    pop_shy
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
