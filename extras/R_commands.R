single = 45
multiple = c(2, 3, 4, 5)

mean(single)
mean(multiple)
summary(single)
summary(multiple)

?c
?mean
?summary

single*3
mulitple*3

sum(multiple)
sum(single, multiple)

afew = c(2,3,4)
acouple = c(3,4)

multiple * multiple
multiple * acouple
multiple * afew

raw_data  = read.table("~/git/M-R.booster2014/extras/test.csv")

plot(multiple)
lines(multiple)
plot(multiple)
lines(multiple, col="red")

pdf("test.pdf")
plot(multiple)
lines(multiple, col="blue")
points(acouple, col="green", pch=2)
dev.off()

a.sum = function(input) {
    sum.of.input = sum(input)
    return (sum.of.input)
}

cats = c("bob", "scardi", "angry")
sapply(cats, FUN=function(kitty){paste(kitty, 'cat')})
