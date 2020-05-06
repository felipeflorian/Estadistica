#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

sk_deaths <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/cum_confirmed_vs_deaths_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

newData <- sk_deaths[89:106,]
newDeaths <- newData$Deaths

# Nuestro modelo
f <- function(x){ 
  exp(-2.810111)*exp(0.156694*x)
}


x = c(89:106)
y = f(x)


plot(x, newDeaths, type="o", col="black", pch="o", lty=1, ylim=range(y))
points(x, y, col="blue", pch="*")
lines(x, y, col="red",lty=2)
