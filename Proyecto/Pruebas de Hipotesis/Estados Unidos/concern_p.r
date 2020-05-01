# Encuesta sobre el nivel de preocupación de ser infectados por COVID-19 de Mar 13 
# a Mar 16.

# Source = Morning Consult
# 1986 encuestados vía online

# Pregunta original: Como puede saber, una nueva cepa de un virus llamado coronavirus fue
# identificado por autoridades chinas a inicios de enero, y sea esparcido a lo largo de 
# países asiáticos, infectando a más de 136.000 individuos y matando a más de 5000 personas.
# Basado en tu conocimiento, ¿Qué tan preocupado estás sobre el brote del coronavirus?

# ¿Será que la mayoría de estadounidenses está preocupada (Very concerned - Somewhat Concerned)
# de ser infectados?

# El objetivo es hallar el valor p de la siguiente prueba de hipótesis: 

p_concern = 0.8
p_no_concern = 0.2
n = 1986

# H_0: p_concern = 0.5 vs H_a: p_good > 0.5

z = (p_concern-0.5)/sqrt(p_concern*p_no_concern/n)
p = pnorm(z, lower.tail = FALSE); p

# El valor p es ínfimo. Podemos concluir que la mayoría de estadounidenses
# están preocupados por ser infectados.