#Compararemos nuestro modelo con datos mas actualizados
library(readr)
library(ggplot2)

sk_tests <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/cum_num_tests_sk_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

Test <- sk_tests$`cumulative number of tests`[81:98]
day <- sk_tests$`cumulative number of tests`[80]

newTest <- c(rep(0,length(Test)))
newTest[1] = Test[1] -day

for(i in 2:length(Test)){
  newTest[i] = Test[i] - Test[i-1]
}

# Nuestro modelo
f <- function(x){ 
  exp(5.81226758)*exp(0.05512746 *x)
}


x = c(81:98)
y = f(x)
a = min(newTest)
b = max(y)

plot(x, newTest, xlab = "Dias", ylab = "Número de pruebas", main = "Test para el número de pruebas en Corea",type="o", col="blue", pch="o", lty=1, ylim=c(a,b))
points(x, y, col="red", pch="*")
lines(x, y, col="red",lty=2)
legend(82,70000,legend=c("Realidad", "Modelo"), col=c("blue","red"),lty=1:2,cex=0.8,
       box.lty=0)