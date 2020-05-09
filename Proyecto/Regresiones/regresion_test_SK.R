library(readr)
sk_test <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/South Korea/cum_number_test_160420.csv",";", escape_double = FALSE, trim_ws = TRUE)

number_of_test <- sk_test$`Number of test`
days <- sk_test$`Number of days`


daily_test <- c(rep(0,length(days)))
daily_test[1] = number_of_test[1]
for(i in 2:length(number_of_test)){
  daily_test[i] = number_of_test[i] - number_of_test[i-1]
}
  
log_test <- log(daily_test)  

#Resumen del modelo
model <- lm(log_test ~ days)
summary(model)

#Valores obtenidos
coef(model)
beta0 = coef(model)[1]
beta1 = coef(model)[2]

#Gráficas para los modelos 
par(mfrow=c(1,2))
plot(days, log_test, main = "Regresión número test diarios", xlab = "Dias", ylab = "Log del numero de test",col="red",pch=20,cex=1.5)
abline(model, col ='black',lwd=3)

plot(days, daily_test,main = "Modelo exponencial para el número de test diarios", xlab = "Dias", ylab = "Test acumulados",col="red",pch=20,cex=1.5)
curve(exp(beta0)*exp(beta1*x),add=T,col="black",lwd=3)

#Intervalos de confianza del 95%
alpha = 0.05
Sxy = sum((days-mean(days))*(number_of_test-mean(number_of_test)))
Sxx = sum((days-mean(days))^2)
Syy = sum((number_of_test-mean(number_of_test))^2)
SSE = Syy - beta1*Sxy
c00 = sum((days)^2)/(length(days)*Sxx)
c11 = 1/Sxx
S = sqrt(SSE/(length(number_of_test)-2))
IC_beta0 = c(beta0 - qt(alpha/2,df = length(days)-2, lower.tail = FALSE)*S*sqrt(c00),beta0 + qt(alpha/2,df = length(days)-2, lower.tail = FALSE)*S*sqrt(c00)) 
IC_beta0
IC_beta1 = c(beta1 - qt(alpha/2,df = length(days)-2, lower.tail = FALSE)*S*sqrt(c11),beta1 + qt(alpha/2,df = length(days)-2, lower.tail = FALSE)*S*sqrt(c11))
IC_beta1

confint(model, level = 0.95)
cor(days,log_test)
