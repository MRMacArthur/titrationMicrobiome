library(shiny)
library(plotly)

microData <- read.csv("./Data/betaDiv_weighted.csv")

fluidPage(
  titlePanel("PR Microbiome"),
  sidebarLayout(
    sidebarPanel(width = 3,
      checkboxInput('weighted', "Check for weighted"),
      selectInput('xAxis', 'Choose X Axis',
                  choices = c("PC1", "PC2", "PC3")),
      selectInput('yAxis', 'Choose Y Axis',
                  choices = c("PC1", "PC2", "PC3"), selected = "PC2"),
      selectizeInput('studyIn', 'Select Study',
                     choices = levels(microData$Study), multiple = T),
      selectizeInput(
        'pctProtIn', 'Select Percent Protein',
        choices = levels(microData$pctProt), multiple = T),
      selectizeInput('compIn', 'Select Protein Composition',
                     choices = levels(microData$Composition), multiple = T),
      selectizeInput('timeIn', 'Select Timepoint',
                     choices = levels(microData$Timepoint), multiple = T),
      selectInput('colorIn', 'Select Color Variable',
                  choices = c("Composition", "Study", "pctProt", "Timepoint")),
      actionButton('updateButt', "Update Plot")
      ),
    mainPanel(plotlyOutput('scatterOut', height = 800))
    )
  )
