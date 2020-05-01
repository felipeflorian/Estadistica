# Encuesta de Feb 28 a Mar 2 en cuanto al nivel de satisfacción con 
# el gobierno y su reacción ante el COVID-19.

# Source = Hankook Research
# 1000 encuestados via online

# La pregunta original fue: ¿Cómo cree que el presidente y el gobierno
# están respondiendo ante la crisis del coronavirus?

# ¿Será que la mayoría de los surcoreanos desaprueban las acciones
# tomadas por su gobierno?
# El objetivo es hallar el valor p para la siguiente prueba de hipótesis:

p_good = 0.42
p_bad = 0.56
n = 1000

# H_0: p_good = 0.5 vs H_a: p_good < 0.5

z = (p_good-0.5)/sqrt(p_good*p_bad/n)
p = pnorm(z, lower.tail = TRUE); p

# El valor p es ínfimo. Podemos concluir que la mayoría de los surcoreanos
# desaprueban las medidas del gobierno.