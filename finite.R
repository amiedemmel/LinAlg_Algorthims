#Finite Differences

#Need to input any length vector of x values and either
#y-values or a function to calculate

#Then perform (n-1)! calculations
finite <- function(x, y) {
#x <- c(0,1,2,3)
#y <- c(2,1,-2,-7)

n <- length(x)

f <- y
cof <- rep(0,n)
cof[1] <- y[1]

for(j in 1:(n-1)){
    for(i in 1:(n-j)){
        f[i] <- (f[i+1]-f[i])/(x[i+j]-x[i])
    }
    
    cof[j+1] <- f[1]
}

#correction of coefficent terms
ccof <- cof
ccof[1] <- cof[3]*(x[1]*x[2])+-1*cof[2]*x[1]+cof[1]
ccof[2] <- -1*cof[3]*(x[1]+x[2])+cof[2]

return(cof)
}

plotfinite <- function(x,c,cof,go=.1) {
  #input the interpolation x points and the coffecient vector
  #from the finite differences algorithm, user can also adj
  #the fine-ness of the produced polynomial
  n <- length(x)
  a <- x[1]
  b <- x[n]
  
  t <- seq(from=a, to=b, by=go)
  m <- length(t)
  y <- rep(0,m)
  
  for(i in 1:n){
    px <- 1
    dx <- rep(0,m)
    if(i!=1){for(j in 1:(i-1)){
      dx <- t - x[j]
      px <- px*dx
    }}
    y <- y + cof[i]*px
  }
  
    plot(t,y,col="red",type="l")
    points(x,c)

  return(y)
}

plotfunction <- function(x,fn,go=.1){
  n <- length(x)
  a <- x[1]
  b <- x[n]
  
  t <- seq(from=a, to=b, by=go)
  
}