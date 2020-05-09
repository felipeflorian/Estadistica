# Ahora vamos a comparar nuestro modelo con datos más actualizados!

library(readr)
library(ggplot2)
usa_act <- read_delim("Estadística/Proyecto/Datos actualizados/new_cases_usa_060520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

plot(usa_act$`number of days`,usa_act$cases, type="o", col="blue", pch="o", lty=1)

new_data <- usa_act[89:106,]
new_y <- new_data$cases; new_y

# Nuestro modelo
f <- function(x){ 
  exp(-2.810111)*exp(0.156694*x)
}

x = c(89:106)
y = f(x); y

plot(x, new_y, type="o", col="blue", pch="o", lty=1, ylim=c(30023,984070.68), xlab="Número de Días",ylab="Nuevos Casos",main="Test del modelo en EEUU")
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(89,900000,legend=c("Realidad","Modelo"),col=c("blue","red"),lty=1:2, cex=0.8,
       box.lty=0)
