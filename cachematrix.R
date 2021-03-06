## A pair of functions that cache the inverse of a matrix.

## makeCacheMatrix creates a special "matrix", which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setInverse <- function(Inverse) m <<- Inverse
	getInverse <- function() m
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
	m <- x$getInverse()
	if(!is.null(m)){
		message("getting cached inverse")
		return(m)
	}       
	data <- x$get()
	m <- solve(data,...) ## calculates the inverse
	x$setInverse(m)
	m
}
