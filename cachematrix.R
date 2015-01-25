

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

      m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinversematrix <- function(solve) m <<- solve
        getinversematrix <- function() m
        list(set = set, get = get,
             setinversematrix = setinversematrix ,
             getinversematrix  = getinversematrix )





}


## This function computes the inverse of the special "matrix" returned by 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		  m <- x$getinversematrix()
        if(!is.null(m)) {
                message("If the inverse has already been calculated (and the matrix has not changed)")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinversematrix(m)
        m
		
		
}
