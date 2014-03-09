#! /usr/bin/env Rscript

data.size = 100000

id = format(seq.int(from=1, to=data.size, by=1), scientific=FALSE)

order.date = as.character(seq(as.Date("2013/9/1"), as.Date("2013/9/30"), length.out=data.size))
delivery.date = as.character(seq(as.Date("2013/9/8"), as.Date("2013/10/7"), length.out=data.size))

first = c('petters', 'amazon', 'karis')
last = c('blomster', 'bøker', 'verktøy')
sender.name = paste(sample(first, size=data.size, replace=TRUE), sample(last, size=data.size, replace=TRUE))

street = c('storegaten', 'lillegaten', 'bigstreet', 'littlestreet')
number = seq.int(12)
sender.address = paste(sample(number, size=data.size, replace=TRUE), sample(street, size=data.size, replace=TRUE))

countries = c('Great Britain', 'Norge', 'Deutschland', 'Australia')
sender.country = sample(countries, size=data.size, replace=TRUE, prob=c(0.12, 0.66, 0.12, 0.1))

recipient.first = c('ola', 'kari', 'petter', 'alex', 'sha', 'rob')
recipient.last = c('singh', 'smith', 'saksevik', 'surrehode')
recipient.name = paste(sample(recipient.first, size=data.size, replace=TRUE), sample(recipient.last, size=data.size, replace=TRUE))

recipient.address = paste(sample(number, size=data.size, replace=TRUE), sample(street, size=data.size, replace=TRUE))
declared.value = sample.int(999, size=data.size, replace=TRUE)

data = cbind(id, order.date, delivery.date, sender.name, sender.address, sender.country, recipient.name, recipient.address, declared.value)
subset = head(data, 20)

write.table(data, file="post.csv", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(subset, file="post_sample_with_headings.csv", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
