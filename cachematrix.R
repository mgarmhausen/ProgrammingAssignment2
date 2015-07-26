## Just as in the example for returning the mean of a vector, these 2 functions
## return the inverse of a supplied matrix. To save ressources, this matrix
## and its inverse should be cached across computation by making use of 
## scoping. Therefore the <<- assignment operator shall be used.

## Create a list object, containing 4 functions to create and get a matrix and to set and retrieve 
## the inverse of the matrix

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

## If not already cached, calculate the inverse of matrix x and cache it

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}


