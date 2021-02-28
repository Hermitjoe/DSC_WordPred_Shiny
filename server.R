#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(quanteda)

load("data/ngrams.Rda")
source("PredictWord.R",local = TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    get_Txt <- reactive({  words <- tokens(x = tolower(input$str), remove_punct = TRUE, remove_numbers = TRUE, 
                                               split_hyphens = TRUE, remove_symbols = TRUE, remove_url = TRUE)
                           ts <- tokens_select(words, pattern = stopwords("en"), selection = "remove") ## Remove Stop words for better compares
                           na.omit(rev(rev(tokens_wordstem(ts, language = "english")[[1]])[1:2]))     # reverse the sentence, pull the last 2 words in reverse order
                       })    ## Call Sub Function to words
    
    output$USE_Txt <- renderText({ get_Txt() })
    
    output$predict <- renderText({
        if(input$str=="")
            return("Please enter some text to get started.")
        predictions <- nextWord(input$str,input$n)
        paste0(1:input$n,".",predictions,"\n")
    })
})