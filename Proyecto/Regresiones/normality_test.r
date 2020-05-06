library(readr)
sk <- read_delim("~/Cuarto Semestre/Estadistica/Proyecto/United States/new_cases_160420.csv",";", escape_double = FALSE, trim_ws = TRUE)

#Un vistazo inicial a la gráfica
plot(sk$`New Cases`, type = "l", col= "blue")

#Por comodidad...
x <- sk$`Number of days`
y <- sk$`New Cases`

#Este será nuestro modelo, nótese que tiene 4 parámetros y es no lineal
f <- function(x, theta)  { 
  m <- theta[1]; s <- theta[2]; a <- theta[3]; b <- theta[4];
  a*exp(-0.5*((x-m)/s)^2) + b
}

#Escogemos valores iniciales
m.0 <- x[which.max(y)]; s.0 <- (max(x)-min(x))/4; b.0 <- min(y); a.0 <- (max(y)-min(y))

#Minimizamos el error cuadrático medio
fit <- nls(y ~ f(x,c(m,s,a,b)), data.frame(x,y), start=list(m=m.0, s=s.0, a=a.0, b=b.0))

#Resumen del resultado
summary(fit)

#Gráfica del modelo
par(mfrow=c(1,1))
plot(c(x,0),c(y,f(coef(fit)["m"],coef(fit))), main="Data", type="n",
     xlab="x", ylab="Brightness")
curve(f(x, coef(fit)), add=TRUE, col="Red", lwd=2)
points(x,y, pch=19)

#Cálculo de R2
y_model = f(x, coef(fit))
R2 = sum((y_model-mean(y))^2)/sum((y-mean(y))^2); R2
