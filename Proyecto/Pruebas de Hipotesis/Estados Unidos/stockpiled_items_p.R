#Encuesta sobre el cambio de habitos entre el 10 y 11 de marzo

#YouGov; Yahoo
#1635 encuestados telefonicamente

#Pregunta original: ¿Ha realizado algunos cambios a su rutina por el coronavirus? 

#¿La minoria de los estadounidenses almacenan productos alimenticios?

#Se hallará el valor p de la siguiente prueba de hipotesis

p_yes = 0.15
p_no = 0.85
n = 1635

#H_0: p = 0.5 v_s H_q: p < 0.5

z = (p_yes-0.5)/sqrt(p_yes*p_no/n)
p = pnorm(-z, lower.tail = FALSE)
p

#El valor p es cero por lo cual, podemos afirmar que
#la minoria de la poblacion estadounidense no almacena productos alimenticios
