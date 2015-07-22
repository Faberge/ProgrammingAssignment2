
## Two functions below are used to create a special object that stores a 
## matrix and caches its inverse 

## makeCacheMatrix  creates a special "matrix", which is really a 
##list containing a function to:
##set matrix
##get matrix
##set inverted matrix 
##get inverted matrix

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function computes the inverse of the special 
##"matrix" returned by makeCacheMatrix above.
##If the inverse has already been calculated, then
##function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) { 
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m 
}
