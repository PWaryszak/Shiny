library(shiny)
library(dplyr)
library(ggplot2)


bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("BC Liquor Store prices in three countries"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      selectInput("countryInput", "Country",
                  choices = c("CANADA", "FRANCE", "ITALY"))
    ),
    mainPanel(
      plotOutput("coolplot"),
      tableOutput("results")
    )
  )
)

server <- function(input, output)
  output$coolplot <- renderPlot({
    filtered <- bcl %>% filter(
      CURRENT_DISPLAY_PRICE >= input$priceInput[1],
      CURRENT_DISPLAY_PRICE <= input$priceInput[2],
      PRODUCT_CLASS_NAME == input$typeInput
      )
    ggplot(filtered,aes(PRODUCT_ALCOHOL_PERCENT))+geom_histogram()
})

shinyApp(ui = ui, server = server)

