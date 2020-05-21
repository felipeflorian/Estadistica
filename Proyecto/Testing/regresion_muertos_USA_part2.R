#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

new_covid_complete <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/covid_19_clean_complete_060520.csv",";", escape_double = FALSE, trim_ws = TRUE)

usa_deaths <- new_covid_complete$Deaths[new_covid_complete$`Country/Region` == 'US']
newDeaths <- usa_deaths[86:105]


# Nuestro modelo
f <- function(x){ 
  exp( -2.7836051)*exp(0.1434351*x)
}


x = c(86:105)
y = f(x)


plot(x, newDeaths, xlab = "Dias", ylab = "Muertes",main = "Test para el número de muertes en EEUU", type="o", col="blue", pch="o", lty=1, ylim=range(y))
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(86,170000,legend=c("Realidad", "Modelo"), col=c("blue","red"),lty=1:2,cex=0.8,
       box.lty=0)
