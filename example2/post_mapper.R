#! /usr/bin/env Rscript

library(HadoopStreaming)
library(getopt)

#transform input to a uniform and processable stream of data, consisting of key/value pairs 
emit <- function(lines){
  apply(lines, 1, function(x){
    amount <- as.integer(x[9])
    sender.country <- as.character(x[6])
    if(amount > 200 && sender.country != "Norge"){
      write(paste(x[2], "1", sep="\t"), file=stdout())
    }
  })
}

(function() {
  input <- file("stdin", open="r")

  names <- c("id", "order.date", "delivery.date", "sender.name","sender.address","sender.country"
             ,"recipient.name", "recipient.address", "declared.value")
  cols = as.list(vector(length=9, mode="character"))
  names(cols) <- names
   #read input in reasonable chunks and apply emit to each chunk
  hsTableReader(file=input, cols, ignoreKey=TRUE, chunkSize=10000, FUN=emit, sep="\t")
})()
