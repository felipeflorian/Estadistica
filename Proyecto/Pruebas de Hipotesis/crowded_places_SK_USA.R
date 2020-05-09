# Vamos a comparar los cambios de habitos en las poblaciones de estados unidos y
# corea del sur, por medio de una prueba de hipotesis. En este caso, 
# tomaremos en cuenta si las personas dejaron de asistir a lugares llenos de gente. 

# Corea del Sur

p_1 = 0.96
q_1 = 0.04
n1 = 1000

# Estados Unidos

p_2 = 0.37
q_2 = 0.63
n2 = 1635

# Prueba de Hipótesis, p-value.

theta = p_1 - p_2
# H_0: theta = 0 vs H_a: theta != 0

s = sqrt(p_1*q_1/n1 + p_2*q_2/n2)
z = theta/s
p = 2*pnorm(z, lower.tail = FALSE)
p

# Podemos afirmar casi con un 100% de certeza que las proporciones de cambio de habito son distintas
# para ambos paises. Es decir, los surcoreanos dejaron de asisitir a lugares llenos de genter mientras 
# que los estadounidenses no cumplieron en un cien por cineto este habito