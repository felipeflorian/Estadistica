#Vamos a comparar los cambios de habitos entee corea del sur
#y estados unido por medio de una pruebas de hipotesis.
#en este caso tomaremos en cuenta si las personas empezaron a comprar elementos 
#de supermercado.

# Corea del Sur

p_1 = 0.35
q_1 = 0.65
n_1= 1000

# Estados Unidos

p_2 = 0.15
q_2 = 0.75
n_2 = 1635

# Prueba de Hipótesis, p-value.

theta = p_1 - p_2

# H_0: theta = 0 vs H_a: theta != 0

s = sqrt( p_1*q_1/n_1 + p_2*q_2/n_2 )
z = theta/s
p = 2*pnorm(z, lower.tail = FALSE)
p

#Dado que el valor p es pequeño, podemos afirmar que parte de las poblaciones
#surcoreanas y estadounidenses empezaron a almacenar alimentos.