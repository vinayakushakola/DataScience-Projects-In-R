d = bank
View(d)

colnames(d)

d = subset(d, select = -c(2,3,4,5,10,11,12,13,14,15))
View(d)

table(d$deposit)

d$deposit = ifelse(d$deposit == 'yes', 1, 0)
d$deposit = factor(d$deposit, levels = c(1, 0))
View(d)

d = subset(d, select = -c(5,6))
View(d)

d$housing = factor(d$housing)
d$loan = factor(d$loan)
library(caret)
index = createDataPartition(d$deposit, p=0.7, list = FALSE)

str(d)

train = d[1:7000,]
test = d[7000:11162,] 
View(train)

model = glm(deposit ~ ., family = 'binomial', data=train)
summary(model)

train = subset(train, select = -c(1))
test = subset(test, select = -c(1))

model = glm(deposit ~ ., family = 'binomial', data=train)
summary(model)

pred = predict(model, test)
View(pred)


