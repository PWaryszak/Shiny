#install.packages("shiny") #run if not on a comp.
library(shiny)
runExample("01_hello")

ui <- fluidPage() # setting up the webpage where ui - user interface
server <- function(input, output, session) {}
shinyApp(ui = ui, server = server)# the last line

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
str(str(bcl))

fluidPage("BC Liquor Store", "prices")

ui < - fluidPage(
  h1("My app"),
  "BC",
  "Liquor",
  br(),
  "Store",
  strong("prices")
)

ui
