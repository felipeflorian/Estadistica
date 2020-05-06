#Encuesta sobre el cambio de habitos entre el 28 de feb al 2 de mar

#Source Hankook Research
#1000 encuestados telefonicamente

#Pregunta original: ¿Hay algun cambio en su vida diaria antes del brote del coranavirus? 

#¿Es posible que la mayoria de los surcoreanos evadieron ir a lugares con mucha gente?

#Se hallará el valor p de la siguiente prueba de hipotesis

p_avoid = 0.96
p_no_avoid = 0.04
n = 1000

#H_0: p = 0.5 v_s H_q: p < 0.5

z = (p_avoid-0.5)/sqrt(p_avoid*p_no_avoid/n)
p = pnorm(z, lower.tail = FALSE)
p

#El valor p es cero por lo cual, podemos concluir que
#los surcoreanos evadieron lugares llenos de gente
