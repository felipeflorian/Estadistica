library(readr)
library(ggplot2)

usa_new_test <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/us_covid19_daily.csv",";", escape_double = FALSE, trim_ws = TRUE)

newTest <- usa_new_test$totalTestResultsIncrease[1:15]

# Nuestro modelo
f <- function(x){ 
  exp(-2.810111)*exp(0.156694*x)
}


x = c(52:66)
y = f(x)


plot(x, newTest, type="o", col="black", pch="o", lty=1, ylim=range(y))
points(x, y, col="blue", pch="*")
lines(x, y, col="red",lty=2)