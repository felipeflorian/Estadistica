# Vamos a estimar la media poblacional de los nuevos casos en Corea del Sur, de manera puntual
# y con un intervalo de confianza del 95%. Como la muestra es grande supondremos distribución
# normal.

library(readr)
sk_act <- read_delim("Estadística/Proyecto/Datos actualizados/new_cases_sk_040520.csv", ";", escape_double = FALSE, trim_ws = TRUE)

new_cases = sk_act$cases

# Puntualmente la media es:

media = mean(new_cases); media

# Más o menos 102 casos al día (nada mal!)

# Ahora mediante un intervalo de confianza del 95%

S = sd(new_cases); 
n = length(new_cases)
alpha = 0.05
IC = c(media - qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n), media + qnorm(alpha/2, lower.tail = FALSE)*S/sqrt(n)); IC
