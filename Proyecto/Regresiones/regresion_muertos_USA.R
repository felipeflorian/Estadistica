library(readr)
usa_deaths <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/United States/deaths_recovery_cases.csv",";", escape_double = FALSE, trim_ws = TRUE)

totalDeaths <- usa_deaths$Deaths
days <- usa_deaths$`Number of days`

deathsPerDay <- c(rep(0,length(totalDeaths)))

for(i in 2:length(totalDeaths)){
  deathsPerDay[i] = d - totalDeaths[i-1]
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
model = lm(log_deaths ~ days)
summary(model)

#Valores obtenidos
coef(model)
beta0 = coef(model)[1]
beta1 = coef(model)[2]

#Modelo para el número de muertes diarias
model2 = lm(log_deaths_per_day ~ days )

#Gráficas para los modelos 
par(mfrow=c(1,3))
plot(days, log_deaths, xlab = "Dias", ylab = "Log del numero de muertes",col="red",pch=20,cex=1.5)
abline(model, col ='black',lwd=3)

plot(days, totalDeaths,xlab = "Dias", ylab = "Muertes acumuladas",col="red",pch=20,cex=1.5)
curve(exp(beta0)*exp(beta1*x),add=T,col="black",lwd=3)


plot(days, log_deaths_per_day, xlab = "Dias", ylab = "Log numero de muertes diarias", col = "red",pch = 20, cex = 1.5)
abline(model2, col = "black",lwd=3)

#Correlación
cor(totalDeaths,days)

#Intervalo de confianza del 95%
alpha = 0.05
Sxy = sum((days-mean(days))*(totalDeaths-mean(totalDeaths)))
Sxx = sum((days-mean(days))^2)
Syy = sum((totalDeaths-mean(totalDeaths))^2)
SSE = Syy - beta1*Sxy
c00 = sum((days)^2)/(length(totalDeaths)*Sxx)
c11 = 1/Sxx
S = sqrt(SSE/(length(totalDeaths)-2))
IC_beta0 = c(beta0 - qt(alpha/2,df = length(totalDeaths)-2, lower.tail = FALSE)*S*sqrt(c00),beta0 + qt(alpha/2,df = length(totalDeaths)-2, lower.tail = FALSE)*S*sqrt(c00)) 
IC_beta0
IC_beta1 = c(beta1 - qt(alpha/2,df = length(totalDeaths)-2, lower.tail = FALSE)*S*sqrt(c11),beta1 + qt(alpha/2,df = length(totalDeaths)-2, lower.tail = FALSE)*S*sqrt(c11))
IC_beta1