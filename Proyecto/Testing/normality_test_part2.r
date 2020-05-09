# Ahora vamos a comparar nuestro modelo con datos más actualizados!

library(readr)
library(ggplot2)
sk_act <- read_delim("Estadística/Proyecto/Datos actualizados/new_cases_sk_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

new_data <- sk_act[89:106,]
new_y <- new_data$cases

# Nuestro modelo
f <- function(x, theta)  { 
  m <- theta[1]; s <- theta[2]; a <- theta[3]; b <- theta[4];
  a*exp(-0.5*((x-m)/s)^2) + b
}

# Parámetros obtenidos con la regresión

# b (el ultimo parámetro) es... complicado.
params = c(43.3714,-4.5854,612.5075,0)

x = c(89:106)
y = f(x,params)

plot(x, new_y, type="o", col="blue", pch="o", lty=1, ylim=c(0,50), main="Test del modelo en Corea",xlab="Número de Días",ylab="Nuevos Casos")
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(89,50,legend=c("Realidad","Modelo"),col=c("blue","red"),lty=1:2, cex=0.8,
       box.lty=0)
