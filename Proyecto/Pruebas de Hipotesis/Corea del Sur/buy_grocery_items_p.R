#Encuesta sobre el cambio de habitos entre el 28 de feb al 2 de mar

#Source Hankook Research
#1000 encuestados telefonicamente

#Pregunta original: ¿Hay algun cambio en su vida diaria antes del brote del coranavirus? 

#¿Es posible que menos del 50%
#de la poblacion surcoreana empezo a comprar mas articulos de supermercado?

#Se hallará el valor p de la siguiente prueba de hipotesis

p_buy = 0.35
p_no_buy = 0.65
n = 1000

#H_0: p = 0.5 v_s H_q: p < 0.5

z = (p_buy-0.5)/sqrt(p_no_buy*p_no_avoid/n)
p = pnorm(z, lower.tail = TRUE)
p

#El valor p es infimo por lo cual, podemos afirmar que 
#menos del 50% de la poblacion surcoreana empezo a comprar mas articulos de supermercado