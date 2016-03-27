## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object which is really a list containing a function to
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of solve\inverse
## 4. get the value of the solve\inverse

makeCacheMatrix <- function(x = matrix()) {
     s <- NULL
     set <- function(y) {
          x <<- y
          s <<- NULL
     }
     get <- function() x
     setsolve <- function(solve) m <<- solve
     getsolve <- function() s
     list(set = set, get = get,
          setsolve = setsolve,
          getsolve = getsolve)

}


## This function calculates the solve\inverse of the special "matrix" object created
## from the above function. It checks to see if the solve\inverse has been calculated
## If so, then it gets the solve\inverse from teh cahche and skips the computation.
## Otherwise it calculates the solve\inverse of the data and sets the value of the
## solve\inverse in teh cahce.  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     s <- x$getsolve()
     if(!is.null(s)) {
          message("getting cached data")
          return(s)
     }
     data <- x$get()
     s <- solve(data, ...)
     x$setsolve(s)
     s
}
