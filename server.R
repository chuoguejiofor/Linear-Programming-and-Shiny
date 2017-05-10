library(shiny)
library(lpSolveAPI)


shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot


  output$linPlot <- renderPlot({
    if(is.null(input$lpFile)) {
      return(NULL)
    }
    print(input$lpFile)
    lprec <- read.lp(input$lpFile$datapath, type="lp")
    solve(lprec)
    plot(lprec)
  })
  
  output$modelText <- renderPrint({
    if(is.null(input$lpFile)) {
      return(NULL)
    }
    lprec <- read.lp(input$lpFile$datapath, type="lp")
    print(lprec)
  })
})