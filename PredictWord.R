### Necesarry libraries
################################################################################
library(quanteda)                        ## Allows the use of the tokenizer


## Set up
################################################################################
## Working Directory - Set when testing off local PC
##setwd("C:/Users/Hermit/Desktop/Coursera Course/Data Science Specialization - JH/10) Capstone/Week 3/wk3 - NPL model/data/")

## IMport the N Grams created from previous homework
load(file = "data/ngrams.Rda")

## Main Function
################################################################################
## Example
nextWord("When you breathe, I want to ")

# Get the next words, main function -- Tokenizes the passed string, pulls last 2 
#words that is used to attempt to predict the next word
nextWord <- function(str,n = 5){
  words <- getlast2words(str)                        ## Call Sub Function to words
  
  w1 <- words[1]                                     ## Split return into 
  w2 <- words[2]                                     ##  2 possible words
  
  # got the last two words
  pwords <- triWords(w1,w2,n)                        ## Pass words to tri check
  
  ## Return Findings
  pwords                                             ## Return findings
}

### local functions
################################################################################
## Tokenizes the sentence then return the last 2 words of what was passed
getlast2words <- function(str){
  # Tokenize the passed string, cleaning it at the same time 
  words <- tokens(x = tolower(str), remove_punct = TRUE, remove_numbers = TRUE, 
                  split_hyphens = TRUE, remove_symbols = TRUE, remove_url = TRUE)
  
  ## Remove Stop words for better compares
  words <- tokens_select(words, pattern = stopwords("en"), selection = "remove")
  
  # reverse the sentence, pull the last 2 words then revese the order of them - Return
  rev(rev(tokens_wordstem(words, language = "english")[[1]])[1:2])
}


## Search in the list of Trigrams for a possible answer
triWords <- function(w1,w2,n = 5){            ## N-Allow to limit return
  wordList <- ngram3[.(w1,w2)][order(-Prob)]  ## Try to pull from Trigrams DB
  
  if(any(is.na(wordList)))                    ## If no response 
    return(biWords(w2,n))                     ## Try the Bigram list 
  
  if(nrow(wordList)>n)                        ## If more than limit 
    return(wordList[1:n,wor3])                ##   Trim and  Return

  ## If here we can pull more from Bigram list  
  count <- nrow(wordList)                     ## Determine how many to pull  
  wordListB <- biWords(w2,n)[1:(n-count)]     ## Pull up to the limit   
  return(c(wordList[,wor3],wordListB))        ## Merge lists and return
}

# search for words in bigram, same as trigram function
biWords <- function(w1,n = 5){                ## N-Allow to limit return
  wordListB <- ngram2[w1][order(-Prob)]       ## Try to pull from Bigrams DB
 
  if(any(is.na(wordListB)))                   ## If no response
    return(uniWords(n))                       ## Try the Unigram list
  
  if(nrow(wordListB)>n)                       ## If More than limit pulled
    return(wordListB[1:n,wo2])                ## Return the best ones
  
  ## If here we can pull more from Unigram list  
  count <- nrow(wordListB)                    ## Determine how many to pull
  wordListU <- uniWords(n)[1:(n-count)]       ## Pull up to the limit
  return(c(wordListB[,wo2],wordListU))        ## Merge lists and return
}

# use the unigram, rather than sending the same words all the time
# send random words from the top fifty.
uniWords <- function(n = 5){                  ## N-Allow to limit return
  sample(unigram[,w1],size = n)
}