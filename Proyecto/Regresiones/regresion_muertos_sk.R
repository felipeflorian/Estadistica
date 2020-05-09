library(readr)
sk_deaths <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/South Korea/cum_confirmed_vs_deaths_160420.csv",";", escape_double = FALSE, trim_ws = TRUE)

totalDeaths <- sk_deaths$Deaths

deathsPerDay <- c(rep(0,length(totalDeaths)))

for(i in 2:length(totalDeaths)){
  deathsPerDay[i] = totalDeaths[i] - totalDeaths[i-1]
}

log_deaths = log(totalDeaths)
log_deaths_per_day = log(deathsPerDay)

for(j in 1:length(log_deaths)){
  if(is.infinite(log_deaths[j])){
    log_deaths[j] = 0
  }
}


for(k in 1:length(log_deaths_per_day)){
  if(is.infinite(log_deaths_per_day[k])){
    log_deaths_per_day[k] = 0
  }
}

#Resumen del modelo
model = lm(log_deaths ~ sk_deaths$`Number of days`)
summary(model)

#Valores obtenidos
coef(model)
beta0 = coef(model)[1]
beta1 = coef(model)[2]

#Modelo para el número de muertes diarias
model2 = lm(log_deaths_per_day ~ sk_deaths$`Number of days` )

#Gráficas para los modelos 
par(mfrow=c(1,3))
plot(sk_deaths$`Number of days`, log_deaths,main = "Regresión para el número de muertes acumuladas", xlab = "Dias", ylab = "Log del numero de muertes",col="red",pch=20,cex=1.5)
abline(model, col ='black',lwd=3)

plot(sk_deaths$`Number of days`,sk_deaths$Deaths, main = "Modelo exponencial para el número de muertes acumuladas", xlab = "Dias", ylab = "Muertes acumuladas",col="red",pch=20,cex=1.5)
curve(exp(beta0)*exp(beta1*x),add=T,col="black",lwd=3)


plot(sk_deaths$`Number of days`, log_deaths_per_day, main = "Regresión para el número de muertes diarias", xlab = "Dias", ylab = "Log numero de muertes diarias", col = "red",pch = 20, cex = 1.5)
abline(model2, col = "black",lwd=3)

#Correlación
cor(sk_deaths$Deaths,sk_deaths$`Number of days`)

#Intervalo de confianza del 95%
alpha = 0.05
Sxy = sum((sk_deaths$`Number of days`-mean(sk_deaths$`Number of days`))*(sk_deaths$Deaths-mean(sk_deaths$Deaths)))
Sxx = sum((sk_deaths$`Number of days`-mean(sk_deaths$`Number of days`))^2)
Syy = sum((sk_deaths$Deaths-mean(sk_deaths$Deaths))^2)
SSE = Syy - beta1*Sxy
c00 = sum((sk_deaths$`Number of days`)^2)/(length(sk_deaths$Deaths)*Sxx)
c11 = 1/Sxx
S = sqrt(SSE/(length(sk_deaths$Deaths)-2))
IC_beta0 = c(beta0 - qt(alpha/2,df = length(sk_deaths)-2, lower.tail = FALSE)*S*sqrt(c00),beta0 + qt(alpha/2,df = length(sk_deaths$Deaths)-2, lower.tail = FALSE)*S*sqrt(c00)) 
IC_beta0
IC_beta1 = c(beta1 - qt(alpha/2,df = length(sk_deaths)-2, lower.tail = FALSE)*S*sqrt(c11),beta1 + qt(alpha/2,df = length(sk_deaths$Deaths)-2, lower.tail = FALSE)*S*sqrt(c11))
IC_beta1

confint(model, level = 0.95)
cor(sk_deaths$`Number of days`,log_deaths)