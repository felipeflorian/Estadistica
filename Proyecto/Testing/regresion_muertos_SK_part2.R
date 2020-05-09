#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

sk_deaths <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/cum_confirmed_vs_deaths_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

newData <- sk_deaths[89:106,]
newDeaths <- newData$Deaths

# Nuestro modelo
f <- function(x){ 
  exp(-1.06936857)*exp(0.08380922*x)
}


x = c(89:106)
y = f(x)
min(newDeaths)
max(y)

plot(x, newDeaths, xlab = "Dias", ylab = "Muertes",main = "Test para el número de muertes en Corea", type="o", col="blue", pch="o", lty=1, ylim=c(230,2476.023))
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(89,2200,legend=c("Realidad", "Modelo"), col=c("blue","red"),lty=1:2,cex=0.8,
       box.lty=0)