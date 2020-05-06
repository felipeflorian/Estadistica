library(readr)
usa <- read_delim("Estadística/Proyecto/United States/new_cases_160420.csv",";", escape_double = FALSE, trim_ws = TRUE)

#Un vistazo inicial a la gráfica
plot(usa$`New Cases`, type = "l", col= "blue")

#Vamos a hacer una regresión exponencial. Con fines meramente científicos,
#diremos que ln(0) = 0 (un matemático llora en la distancia)
log_new_cases = log(usa$`New Cases`)
for(i in 1:88){
  if(is.infinite(log_new_cases[i])){
    log_new_cases[i] = 0
  }
}

#Resumen del modelo
mod_exp = lm(log_new_cases~usa$`Number of days`)
summary(mod_exp)

#Parámetros obtenidos
beta_0 = -2.810111
beta_1 = 0.156694

#Graficamos el modelo
par(mfrow=c(1,2))
plot(usa$`Number of days`,log_new_cases, xlab = "Dias", ylab = "Log del numero de casos",col="red",pch=20,cex=1.5)
abline(mod_exp,col="blue",lwd=3)

plot(usa$`Number of days`,usa$`New Cases`,xlab = "Dias", ylab = "Numero de casos",col="red",pch=20,cex=1.5)
curve(exp(beta_0)*exp(beta_1*x),add=T,col="blue",lwd=3)

#Correlación
cor(log_new_cases,usa$`Number of days`)

#Establezcamos intervalos de confianza del 95% para los parámetros obtenidos.
alpha = 0.05
Sxx = sum((usa$`Number of days`-mean(usa$`Number of days`))^2)
Syy = sum((usa$`New Cases`-mean(usa$`New Cases`))^2)
Sxy = sum((usa$`Number of days`-mean(usa$`Number of days`))*(usa$`New Cases`-mean(usa$`New Cases`)))
c00 = sum(usa$`Number of days`^2)/(88*Sxx)
c11 = 1/Sxx
SSE = Syy - beta_1*Sxy
S = sqrt(SSE/86)
IC_beta0 = c(beta_0 - qt(alpha/2,df = 86, lower.tail = FALSE)*S*sqrt(c00),beta_0 + qt(alpha/2,df = 86, lower.tail = FALSE)*S*sqrt(c00)); IC_beta0
IC_beta1 = c(beta_1 - qt(alpha/2,df = 86, lower.tail = FALSE)*S*sqrt(c11),beta_1 + qt(alpha/2,df = 86, lower.tail = FALSE)*S*sqrt(c11)); IC_beta1
