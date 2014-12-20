## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
}
## Write a short comment describing this function
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}

# Cache Inverse of Matrix to avoid repetitive calculations
makeCacheMatrix <- function(x = matrix()) {
    #Initialize matrix
    m <- NULL
    # Set matrix value
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    # Get matrix value
    get <- function() x
    # Set and Get inverse of matrix
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    #Create List with Set and Get Inverses of Matrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
# Return the "cached" inverse of matrix if it already exists,
# If not calculate the inverse of matrix and set value in cache
# using setinverse function.
cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    # Return "cached" value of matrix inverse if already calculated
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    # Caluclate matrix inverse if not previously calculated
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
