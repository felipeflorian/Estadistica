# Vamos a comparar las proporciones de satisfacción positivo ante las acciones
# tomadas por el gobierno ante el COVID-19 en Corea del Sur y en Estados Unidos
# mediante una prueba de hipótesis.

# Corea del Sur

p_1 = 0.42
q_1 = 0.56
n_1= 1000

# Estados Unidos

p_2 = 0.39
q_2 = 0.61
n_2 = 7700

# Prueba de Hipótesis, p-value.

theta = p_1 - p_2

# H_0: theta = 0 vs H_a: theta != 0

s = sqrt( p_1*q_1/n_1 + p_2*q_2/n_2 )
z = theta/s
p = 2*pnorm(z, lower.tail = FALSE); p

# Podemos afirmar con un 94% de certeza que las proporciones son diferentes. Luego,
# aunque ambas poblaciones en general no estaban satisfechos con las acciones de sus
# gobiernos para Marzo, los estadounidenses estaban más enojados con Trump.