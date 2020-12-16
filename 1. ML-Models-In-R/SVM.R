d<-glass
View(d)

library(caTools)

install.packages('caTools')


split<-sample.split(d$Type, SplitRatio = 0.7)

train<-subset(d, split==TRUE)
test<-subset(d, split==FALSE)


train[-10]<-scale(train[-10])
test[-10]<-scale(test[-10])

library(e1071)

classifier<-svm(formula= Type ~ .,
                data=train,
                kernel='linear',
                classifier='C-classification')

summary(classifier)

pred<-predict(classifier, test[-10])
View(pred)
