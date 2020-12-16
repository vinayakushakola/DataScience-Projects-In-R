d = sales
View(d)

d = subset(d, select = -c(1,2,3,4))

library(caret)

str(d)
train = d[1:6000, ]
test = d[6001:8723, ]

model = lm(SellingPrice ~ ., data=train)
summary(model)

pred = predict(model, test)
View(pred)
