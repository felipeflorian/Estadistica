#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

new_covid_complete <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/covid_19_clean_complete_060520.csv",";", escape_double = FALSE, trim_ws = TRUE)

usa_deaths <- new_covid_complete$Deaths[new_covid_complete$`Country/Region` == 'US']
newDeaths <- usa_deaths[86:105]


# Nuestro modelo
f <- function(x){ 
  exp(-2.810111)*exp(0.156694*x)
}


x = c(86:105)
y = f(x)


plot(x, newDeaths, type="o", col="blue", pch="o", lty=1, ylim=range(y))
points(x, y, col="blue", pch="*")
lines(x, y, col="red",lty=2)

