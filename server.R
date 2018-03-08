library(shiny)
library(plotly)

function(input, output, session) {
  
  output$scatterOut <- renderPlotly({
    
    input$updateButt
    
    if (isolate(input$weighted)==T) {
      microData <- read.csv("./Data/betaDiv_weighted.csv")
    }else{
      microData <- read.csv("./Data/betaDiv_unweighted.csv")
    }
    
    plotData <- microData[microData$Composition %in% isolate(input$compIn) &
                  microData$pctProt %in% isolate(input$pctProtIn) &
                  microData$Study %in% isolate(input$studyIn) &
                  microData$Timepoint %in% isolate(input$timeIn),]
    
    ggplotly(ggplot(data = plotData, aes_string(x = isolate(input$xAxis), y = isolate(input$yAxis),
                                     color = isolate(input$colorIn))) +
      geom_point(size = 2.5, alpha = (1/2), 
                 aes(text = sprintf("Prot: %s<br>Comp %s<br>Time%s",
                                    pctProt, Composition, Timepoint))))
    
  })
  
}