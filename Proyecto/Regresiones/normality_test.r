library(readr)
sk <- read_delim("Estadística/Proyecto/South Korea/new_cases_160420.csv",";", escape_double = FALSE, trim_ws = TRUE)

#Un vistazo inicial a la gráfica
plot(sk$`New Cases`, type = "l", col= "blue")

#Por comodidad...
x <- sk$`Number of days`
y <- sk$`New Cases`

#Este será nuestro modelo, nótese que tiene 4 parámetros y es no lineal
f <- function(x, theta)  { 
  m <- theta[1]; s <- theta[2]; a <- theta[3];
  a*exp(-0.5*((x-m)/s)^2)
}

#Escogemos valores iniciales
m.0 <- x[which.max(y)]; s.0 <- (max(x)-min(x))/4; a.0 <- (max(y)-min(y))

#Minimizamos el error cuadrático medio
fit <- nls(y ~ f(x,c(m,s,a)), data.frame(x,y), start=list(m=m.0, s=s.0, a=a.0))

#Resumen del resultado
summary(fit)

#Gráfica del modelo
par(mfrow=c(1,1))
plot(c(x,0),c(y,f(coef(fit)["m"],coef(fit))), main="Regresión Nuevos Casos Corea", type="n",
     xlab="Número de Días", ylab="Nuevos Casos")
curve(f(x, coef(fit)), add=TRUE, col="Red", lwd=2)
points(x,y, pch=19)

