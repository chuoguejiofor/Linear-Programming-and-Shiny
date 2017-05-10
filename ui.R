library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Optimization Viewer"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        column(12,
          fileInput("lpFile", "LP File"),
          verbatimTextOutput("modelText")
        )
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      fluidRow(
        column(12,
          plotOutput("linPlot")
        )
      )
    )
  )
))