#! /usr/bin/env Rscript

library(HadoopStreaming)
library(getopt)

reduce <- function(piece.of.map){
  #aggregate the values per date
  result <- aggregate(x=piece.of.map$value, by=list(date=piece.of.map$date), FUN=function(map.values){
    sum(as.integer(map.values))
  })
  
  #write a nicely formatted table
  write.table(result, file=stdout(), quote=FALSE, row.names=FALSE, col.names=FALSE)
}


(function() {
  input <- file("stdin", open="r")
  
  #create column names to make it easier to work with the data set
  names <- c("date", "value")
  cols = as.list(vector(length=2, mode="character"))
  names(cols) <- names
  
  #read from the input
  hsTableReader(file=input, cols, ignoreKey=TRUE, chunkSize=100000, FUN=reduce, sep="\t")
})()
