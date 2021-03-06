
d<-read.csv('C:\\Users\\User27\\Documents\\Vinayak\\R\\fwtimeforecastinggasandgolddataset\\monthly_csv.csv')
View(d)

colnames(d)
library(tseries)
library(forecast)


d<-sapply(d$Price, FUN=tsclean)
d<-ts(d, start=c(1997,1), frequency = 12)
plot.ts(d)

acf(d)
pacf(d)


fit<-auto.arima(d, trace= TRUE, ic ="aicc", approximation = FALSE, stepwise = FALSE,seasonal = FALSE)
fc<-forecast(fit)
fc

pred = predict(fit, n.ahead = 36) # 3 years means 36 month
pred
