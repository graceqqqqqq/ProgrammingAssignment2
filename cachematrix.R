## 
## This function creates a special "matrix" object that can cache its inverse.


##  Set and get the value of the Matrix.
        

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setSolve <- function(solve) m <<- solve
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
}



## The following function calculates the inverse of the special "matrix" created with the above function. 

cacheSolve <- function(x) {
        m <- x$getSolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setSolve(m)
        m
}     ## Return a matrix that is the inverse of 'x'
