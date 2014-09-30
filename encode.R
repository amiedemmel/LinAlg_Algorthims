L <- c(" ",'a','b','c','d','e','f','g','h','i',
		 'j','k','l','m','n','o','p','q','r','s',
		 't','u','v','w','x','y','z','A','B','C',
		 'D','E','F','G','H','I','J','K','L','M',
		 'N','O','P','Q','R','S','T','U','V','W',
		 'X','Y','Z','.',',','?','-','+','=','{',
		 '}','(',')','1','2','3','4','5','6','7',
		 '8','9','0')

letter <- function(x) {
	n <- length(x)
	x <- x+1
	lett <- rep(" ",n)

	for(i in 1:n) {
		lett[i] <- L[x[i]]
	}

	return(lett)
}

number <- function(x) {
	n <- length(x)
	num <- rep(0,n)

	for(i in 1:n) {
		num[i] <- match(x[i],L)
	}
	num <- num - 1

	return(num)
}

code <- function(x,key=matrix(c(2,4,1,3),2,2)) {
	x <- strsplit(x, NULL)
	x <- x[[1]]
	x <- number(x)
	n <- length(x)

	if(n%%2) {
		x[n+1] <- 0
		n <- length(x)
	}

	M <- matrix(x,(n/2),2)
	#print(M)

	#key <- matrix(c(2,4,1,3),2,2)
	#print(key)
	M <- M%*%key
	#c(M[,1],M[,2])
	return(M)
}

breaker <- function(x,key=matrix(c(2,4,1,3),2,2)) {
	n <- length(x)
	
	y <- solve(key)
	x <- x%*%y
	x <- letter(x)
	mess <- "Message : "
	
	for(i in 1:n) {
		mess <- paste(mess,x[i],sep="")
	}

	return(mess)
}