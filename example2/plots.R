setClass("myDate")
setAs("character", "myDate", function(from)
as.Date(from, "%d/%m/%Y"))
bank =
read.table("/Users/sivhollup/git/M-R.booster2014/example2/bank_output.csv", colClasses=c("myDate", NA))

post =
read.table("/Users/sivhollup/git/M-R.booster2014/example2/post_output.csv", colClasses=c("myDate", NA))

