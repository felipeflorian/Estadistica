# Vamos a estimar la media poblacional de los tests en Estados Unidos.
# Además, se realizará un intervalo de confianza del 95% como la muestra es grande
# suponemos que es una normal.

library(readr)

usa_test <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/us_covid19_daily.csv",";", escape_double = FALSE, trim_ws = TRUE)

test <- usa_test$totalTestResultsIncrease 
tests <- tests[1:length(tests)-1]

media = mean(tests)
media

# Ahora mediante un intervalo de confianza del 95%

S = sd(tests) 
n = length(tests)
alpha = 0.05
IC = c(media - qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n), media + qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n))
IC