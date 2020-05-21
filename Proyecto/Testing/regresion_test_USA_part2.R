library(readr)
library(ggplot2)

usa_new_test <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/us_covid19_daily.csv",";", escape_double = FALSE, trim_ws = TRUE)

newTest <- usa_new_test$totalTestResultsIncrease[1:15]
newTest
# Nuestro modelo
f <- function(x){ 
  exp(5.7666183)*exp(0.1459993*x)
}


x = c(52:66)
y = f(x)
b = min(y)
a = max(newTest)


plot(x, newTest, type="o", xlab = "Dias", ylab = "Número de pruebas", main = "Test para el número de pruebas en Estados Unidos",col="blue", pch="o", lty=1, ylim=c(a,10*b))
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(52,5000000,legend=c("Realidad", "Modelo"), col=c("blue","red"),lty=1:2,cex=0.8,
       box.lty=0)