## The following functions are used to calculate the inverse of a matrix, and
## set the result in cache so it can be called later.


## This function creates a special "matrix" object that can cache its inverse.
## It generates a list containing a function to
##  1. set the value of the matrix
##  2. get the value of the matrix
##  3. set the value of the inverse of the matrix
##  4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get,
	     setinverse = setinverse,
           getinverse = getinverse)

}


## The following function calculates the inverse of the matrix created with
## the above function. It first checks whether the inverse has been calculated.
## If so it just prints the cached data. If not it calculates the inverse of
## the matrix and sets the value in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data)
	x$setinverse(m)
	m

}
