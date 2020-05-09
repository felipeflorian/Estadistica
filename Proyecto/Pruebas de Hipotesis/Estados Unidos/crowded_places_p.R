#Encuesta sobre el cambio de habitos entre el 10 y 11 de marzo

#YouGov; Yahoo
#1635 encuestados telefonicamente

#Pregunta original: ¿Ha realizado algunos cambios a su rutina por el coronavirus? 

#¿Es posible que la minoria de estadounidenses dejaran de asistir a lugares llenos de gente?

#Se hallará el valor p de la siguiente prueba de hipotesis

p_avoid = 0.37
p_no_avoid = 0.63
n = 1635

#H_0: p = 0.5 v_s H_q: p < 0.5

z = (p_avoid-0.5)/sqrt(p_avoid*p_no_avoid/n)
p = pnorm(-z, lower.tail = FALSE)
p

#El valor p es pequeño por lo cual, podemos afirmar que
#la minoria de la poblacion estadounidense no asiste a lugares llenos de gente
