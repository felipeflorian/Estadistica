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
plot(usa$`Number of days`,log_new_cases, xlab = "Dias", ylab = "Log del numero de casos",col="red",pch=20,cex=1.5,main="Regresión Nuevos Casos EEUU")
abline(mod_exp,col="blue",lwd=3)

plot(usa$`Number of days`,usa$`New Cases`,xlab = "Dias", ylab = "Numero de casos",col="red",pch=20,cex=1.5,main="Regresión Nuevos Casos EEUU")
curve(exp(beta_0)*exp(beta_1*x),add=T,col="blue",lwd=3)

#Correlación
cor(log_new_cases,usa$`Number of days`)

#Establezcamos intervalos de confianza del 95% para los parámetros obtenidos.
confint(mod_exp, level = 0.95)
