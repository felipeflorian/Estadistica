# Encuesta diaria de Mar 23 a Abr 15 respecto a la satisfacción con el gobierno.
# Dado que los datos no varían mucho, usaremos el promedio.

# Source = Statista Survey
# 7700 encuestados vía online

# ¿Será que la mayoría de los estadounideses desaprueban las acciones
# tomadas por su gobierno?
# El objetivo es hallar el valor p para la siguiente prueba de hipótesis:

p_good = 0.39
p_bad = 0.61
n = 7700

# H_0: p_good = 0.5 vs H_a: p_good < 0.5

z = (p_good-0.5)/sqrt(p_good*p_bad/n)
p = pnorm(z, lower.tail = TRUE); p

# El valor p es ínfimo. Podemos concluir que la mayoría de los estadounidenses
# desaprueban las medidas del gobierno.
