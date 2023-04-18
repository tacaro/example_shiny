#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(lubridate)
source("source/plot_co2.R")



###### UI
ui <- fluidPage(
  
  # Application title
  titlePanel("CO2 measurements"),
  
  # Sidebar with a slider input
  sidebarLayout(
    sidebarPanel(
      # X limits
      sliderInput(inputId = "timerange",
                  label = "Time",
                  min = 0,
                  max = 12500,
                  value = c(0, 12500)
      ),
      # y limits
      sliderInput(inputId = "yrange",
                  label = "ppm",
                  min = 0,
                  max = 1500,
                  value = c(0, 1000)
      ),
      # Choose color
      textInput(
        inputId = "colorchoice", 
        label = "Plot Line Color",
        value = "lightblue4"
      ),
      # title choice
      textInput(
        inputId = "title_choice",
        label = "Title Text",
        value = "Your label here"
      )
    ),
    
    # Show a plot
    mainPanel(
      plotOutput("co2_plot")
    )
  )
)









#### SERVER

server <- function(input, output) {
  # Define the outputs
  output$co2_plot <- renderPlot({
    # call our sourced plot function
    plot_co2(
      color = input$colorchoice,
      xlim = input$timerange,
      title_text = input$title_choice,
      ylim = input$yrange
    )
  })
  
}





# Run the application 
shinyApp(ui = ui, server = server)
