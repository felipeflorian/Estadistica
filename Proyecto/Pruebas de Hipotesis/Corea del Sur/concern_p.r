# Encuesta sobre el nivel de preocupación de ser infectados por COVID-19 de Mar 3 
# a Mar 5.

# Source = Gallup Korea
# 1000 encuestados vía telefónica

# Pregunta original: ¿Está preocupado o no respecto a ser infectado por COVID-19? (4 escalas)

# ¿Será que la mayoría de Corea del Sur está preocupada (Very concerned - Somewhat Concerned)
# de ser infectados?

# El objetivo es hallar el valor p de la siguiente prueba de hipótesis: 

p_concern = 0.74
p_no_concern = 0.26
n = 1000

# H_0: p_concern = 0.5 vs H_a: p_good > 0.5

z = (p_concern-0.5)/sqrt(p_concern*p_no_concern/n)
p = pnorm(z, lower.tail = FALSE); p

# El valor p es ínfimo. Podemos concluir que la mayoría de los surcoreanos
# están preocupados por ser infectados.