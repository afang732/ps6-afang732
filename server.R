
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(DT)
server <- function(input, output) {
  
  spotify <- read.csv("spotify_top_charts_22.csv")
  
  spotify_data <- reactive({
    spotify %>%
      filter(artist_names %in% as.character(input$artist_names), weeks_on_chart >= 20, na.rm = TRUE) %>%
      select(artist_names, duration_ms, weeks_on_chart)
  })
  
  output$barchart <- renderPlotly({
    data_subset <- spotify_data()
    
    barchart <- ggplot(data_subset, aes(x = artist_names, y = weeks_on_chart, fill = artist_names)) +
      geom_col() +
      theme(axis.text.x = element_text(angle = 45)) +
      xlab("Artist Names") +
      ylab("Weeks on Chart") +
      labs(fill="Artists")
    
    ggplotly(barchart)
  })
  
  observeEvent(input$artist_names, {
    spotify_data()
  })
  
  filtered_data <- reactive({
    spotify %>% 
      filter(weeks_on_chart >= input$weeks_on_chart) %>% 
      select(artist_names)
  })
  
  output$artist_names <- renderText({
    paste(filtered_data()$artist_names, collapse = ", ")
  })
  
}

