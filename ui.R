#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
## See Associate readme for full disclosure

library(shiny)
library(markdown)

shinyUI(fluidPage(
    titlePanel("JH Data Science Capstone Project - Word Selection"),
    sidebarLayout(
        sidebarPanel(
            textInput("str",label = h4("Enter Some Text:"),value = ""),
            numericInput("n",label = h4("# of words to display: (1-10)"),min = 1,max = 10,value = 5,step = 1),
            helpText("Select the 'Help' tab for program info")
        )
        ,
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Program",
                                 h2("Words Used:"),
                                 h4("This will display the words being used to draw the prediction"),
                                 h4(textOutput("USE_Txt",container = pre)),
                                 h2("Predictions:"),
                                 h4(textOutput("predict",container = pre))
                        ),
                        tabPanel("Help",
                                 includeMarkdown("readme.md"))
                        
            )
        )
    )
))
