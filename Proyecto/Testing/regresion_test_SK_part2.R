#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

sk_tests <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/cum_num_tests_sk_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

newTest <- sk_tests$`cumulative number of tests`[81:98]

# Nuestro modelo
f <- function(x){ 
  exp(-2.810111)*exp(0.156694*x)
}


x = c(81:98)
y = f(x)


plot(x, newTest, type="o", col="black", pch="o", lty=1, ylim=range(y))
points(x, y, col="blue", pch="*")
lines(x, y, col="red",lty=2)