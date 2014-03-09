#! /usr/bin/env Rscript

library(HadoopStreaming)
library(getopt)

#transform input to a uniform and processable stream of data, consisting of key/value pairs 
emit <- function(lines){
  apply(lines, 1, function(x){
    amount <- as.integer(x[5])
    currency <- as.character(x[4])
    if(amount > 200 && currency != "NOK"){
      write(paste(x[2], "1", sep="\t"), file=stdout())
    }
  })
}

(function() {
  input <- file("stdin", open="r")
  
  names <- c("id", "date", "vendor","currency","amount")
  cols = as.list(vector(length=5, mode="character"))
  names(cols) <- names
   #read input in reasonable chunks and apply emit to each chunk
  hsTableReader(file=input, cols, ignoreKey=TRUE, chunkSize=10000, FUN=emit, sep="\t")
})()
