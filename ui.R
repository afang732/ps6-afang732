library(htmltools)
library(shiny)
library(ggplot2)
library(htmltools)

setwd('/Users/annafang/desktop/info201/ps6-afang732')
spotify <- read.csv("spotify_top_charts_22.csv")

# Define UI for application
ui <- fluidPage(
  
  navbarPage("Spotify Top Chart Songs 2022",
             
             # Opening page
             tabPanel("Overview",
                      fluidPage(
                        br(),
                        h4("General Information"),
                        p("This dataset includes the top 200 Spotify songs of 2022, ranked by popularity on the platform. The dataset includes information on the song's name, artist, and streaming metrics such as ", em("danceability"), ", ", em("energy"), ",", em("key"), " and more."),
                        br(),
                        h4("Variables"),
                        p(em(strong("The dataset includes the following variables:"))),
                        p(
                          em("Track Name:"), " the name of the song",
                          em("Artist:"), " the artist(s) of the song",
                          em("Week on Charts:"), " Number of weeks the song was on top charts",
                          em("URL:"), " the URL of the song on Spotify",
                          em("Danceability:"), " Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo.",
                          em("Key:"), " The key the track is in. Integers map to pitches using standard Pitch Class Notation."
                        )
                        
                      )
             ),
             
             # Visualizations tab
             tabPanel("Bar Chart",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("artist_names", "Select Artist Names:",
                                      choices = c("All", unique(spotify$artist_names)),
                                      multiple = TRUE,
                                      selected = c("Justin Bieber", "Doja Cat", "Adele"))
                        ),
                        mainPanel(
                          plotlyOutput(outputId = "barchart"),
                          verbatimTextOutput(outputId = "summary")
                        )
                      )
             ),
             
             # Table tab
             tabPanel("chart",
                      titlePanel("Spotify Top Chart Songs 2022: Artists and their Weeks on Charts"),
                      sidebarLayout(
                        sidebarPanel(
                          sliderInput("weeks_on_chart", "Select Weeks on Chart:", min = 1, max = 100, value = 10)
                        ),
                        mainPanel(
                          textOutput("artist_names")
                        )
                      )
             )
  )
)
