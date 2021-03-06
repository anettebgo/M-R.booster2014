#! /usr/bin/env Rscript

data.size = 1000000

id = format(seq.int(from=1, to=data.size, by=1), scientific=FALSE)

date = as.character(seq(as.Date("2013/9/1"), as.Date("2013/9/30"), length.out=data.size))

currencies = c('NOK', 'EUR', 'GBP', 'AUD')
currency = sample(currencies, size=data.size, replace=TRUE, prob=c(0.7, 0.1, 0.1, 0.1))

amount.paid = sample.int(999, size=data.size, replace=TRUE)

first = c('petters', 'amazon', 'karis')
last = c('blomster', 'bøker', 'verktøy')
shop.name = paste(sample(first, size=data.size, replace=TRUE), sample(last, size=data.size, replace=TRUE))

data = cbind(id, date, shop.name, currency, amount.paid)
subset = head(data, 20)

write.table(data, file="bank.csv", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(subset, file="bank_sample_with_headings.csv", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
