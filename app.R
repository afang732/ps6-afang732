# Load necessary packages
library(shiny)

spotify <- read.csv("spotify_top_charts_22.csv")

source("ui.R")
source("server.R")

# Run the shiny app
shinyApp(ui, server)



