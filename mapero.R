library("shiny")

source( "mapa1.R" )
source( "mapa2.R" )

## ----
# #cargamos el paquete devtools
library("devtools")

# #usamos su funcion para instalar paquetes desde git
# install_github("diegovalle/mxmaps")
# Si te pide actualizar paquetes, solo dale Enter

# si no tienes algun paquete instalado usa
# install.packages()

library("mxmaps")             # el paquete que contiene los datos geograficos del mapa de Mx
library("ggplot2")            # para graficar
library("dplyr")              # para manejar datos
library("scales")             # para convertir a fraccion de manera sencilla
library("cowplot")            # para guardar plots en grids
library("tidyr")              # para usar la funcion pivot_longer
## ----

ui <- fluidPage(
  
  # App title ----
  titlePanel("Mapas de México"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      numericInput( inputId = "AGS",
                    label = "AGS", 0),
      
      numericInput( inputId = "BC",
                    label = "BC", 0),
      
      numericInput( inputId = "BCS",
                    label = "BCS", 0),
      
      numericInput( inputId = "CAMP",
                    label = "CAMP", 0),
      
      numericInput( inputId = "COAH",
                    label = "COAH", 0),
      
      numericInput( inputId = "COL",
                    label = "COL", 0),
      
      numericInput( inputId = "CHPS",
                    label = "CHPS", 0),
      
      numericInput( inputId = "CHIH",
                    label = "CHIH", 0),
      
      numericInput( inputId = "CDMX",
                    label = "CDMX", 0),
      
      numericInput( inputId = "DGO",
                    label = "DGO", 0),
      
      numericInput( inputId = "GTO",
                    label = "GTO", 0),
      
      numericInput( inputId = "GRO",
                    label = "GRO", 0),
      
      numericInput( inputId = "HGO",
                    label = "HGO", 0),
      
      numericInput( inputId = "JAL",
                    label = "JAL", 0),
      
      numericInput( inputId = "MEX",
                    label = "MEX", 0),
      
      numericInput( inputId = "MICH",
                    label = "MICH", 0),
      
      numericInput( inputId = "MOR",
                    label = "MOR", 0),
      
      numericInput( inputId = "NAY",
                    label = "NAY", 0),
      
      numericInput( inputId = "NL",
                    label = "NL", 0),
      
      numericInput( inputId = "OAX",
                    label = "OAX", 0),
      
      numericInput( inputId = "PUE",
                    label = "PUE", 0),
      
      numericInput( inputId = "QRO",
                    label = "QRO", 0),
      
      numericInput( inputId = "QROO",
                    label = "QROO", 0),
      
      numericInput( inputId = "SLP",
                    label = "SLP", 0),
      
      numericInput( inputId = "SIN",
                    label = "SIN", 0),
      
      numericInput( inputId = "SON",
                    label = "SON", 0),
      
      numericInput( inputId = "TAB",
                    label = "TAB", 0),
      
      numericInput( inputId = "TAM",
                    label = "TAM", 0),
      
      numericInput( inputId = "TLAX",
                    label = "TLAX", 0),
      
      numericInput( inputId = "VER",
                    label = "VER", 0),
      
      numericInput( inputId = "YUC",
                    label = "YUC", 0),
      
      numericInput( inputId = "ZAC",
                    label = "ZAC", 0),
      
      actionButton( inputId = "go",
                    label = "Go" ),
      
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      plotOutput( outputId = "mapa1" ),
      plotOutput( outputId = "mapa2" )
      
    )
  )
  
)

server <- function(input, output) {
  
  estados_final <- eventReactive(input$go, {
    
    data.frame(
      state_abbr = c("AGS",
                    "BC",
                    "BCS",
                    "CAMP",
                    "COAH",
                    "COL",
                    "CHPS",
                    "CHIH",
                    "CDMX",
                    "DGO",
                    "GTO",
                    "GRO",
                    "HGO",
                    "JAL",
                    "MEX",
                    "MICH",
                    "MOR",
                    "NAY",
                    "NL",
                    "OAX",
                    "PUE",
                    "QRO",
                    "QROO",
                    "SLP",
                    "SIN",
                    "SON",
                    "TAB",
                    "TAM",
                    "TLAX",
                    "VER",
                    "YUC",
                    "ZAC" ),
      value = c(
        input$AGS,
        input$BC,
        input$BCS,
        input$CAMP,
        input$COAH,
        input$COL,
        input$CHPS,
        input$CHIH,
        input$CDMX,
        input$DGO,
        input$GTO,
        input$GRO,
        input$HGO,
        input$JAL,
        input$MEX,
        input$MICH,
        input$MOR,
        input$NAY,
        input$NL,
        input$OAX,
        input$PUE,
        input$QRO,
        input$QROO,
        input$SLP,
        input$SIN,
        input$SON,
        input$TAB,
        input$TAM,
        input$TLAX,
        input$VER,
        input$YUC,
        input$ZAC
      )
    )
  })
  
  output$mapa1 <- renderPlot({
    mapeadora( la_data = data.frame( estados_final( ) )
    )
  })
  
  output$mapa2 <- renderPlot({
    mapeadora_hex( la_data = data.frame( estados_final( ) )
    )
  })
}

shinyApp(ui, server)