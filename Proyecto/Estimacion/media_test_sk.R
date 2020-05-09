# Vamos a estimar la media poblacional de las nuevas muertes en Estados Unidos.
# Además, se realizará un intervalo de confianza del 95% como la muestra es grande
# suponemos que es una normal.
# Vamos a estimar la media poblacional de los tests en Corea Del Sur.
# Además, se realizará un intervalo de confianza del 95% como la muestra es grande
# suponemos que es una normal.

library(readr)

sk_tests <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/Datos actualizados/cum_num_tests_sk_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)
Ctests <- sk_tests$`cumulative number of tests`

tests <-c(rep(0,length(Ctests)))
tests[1] = Ctests[1]

for(i in 2:length(Ctests)){
  tests[i] = Ctests[i] - Ctests[i-1]
}

media = mean(tests)
media

# Ahora mediante un intervalo de confianza del 95%

S = sd(tests) 
n = length(tests)
alpha = 0.05
IC = c(media - qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n), media + qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n))
IC