# Load necessary packages
library(shiny)

setwd('/Users/annafang/desktop/info201/ps6-afang732')
spotify <- read.csv("spotify_top_charts_22.csv")

source("ui.R")
source("server.R")

# Run the shiny app
shinyApp(ui, server)

