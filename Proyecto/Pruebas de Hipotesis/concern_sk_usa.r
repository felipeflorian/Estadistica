# Vamos a comparar las proporciones de nivel de preocupación para Corea del Sur y 
# Estados Unidos mediante una prueba de hipótesis.

# Corea del Sur

p_1 = 0.74
q_1 = 0.26
n_1= 1000

# Estados Unidos

p_2 = 0.8
q_2 = 0.2
n_2 = 1986

# Prueba de Hipótesis, p-value.

theta = p_2 - p_1
# H_0: theta = 0 vs H_a: theta != 0

s = sqrt( p_1*q_1/n_1 + p_2*q_2/n_2 )
z = theta/s
p = 2*pnorm(z, lower.tail = FALSE); p

# Podemos afirmar casi con un 100% de certeza que las proporciones del nivel de preocupación
# son distintos para ambos países. Es decir, los estadounidenses estaban más preocupados para 
# Marzo que los surcoreanos.