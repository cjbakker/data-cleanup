## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL #null will change when user sets a value
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x #get the matrix
        setInverse <- function(inverse) inv <<- inverse #set the inverse of the matrix
        getInverse <- function() inv #get the inverse of the matrix
        list(set = set, 
             get = get,
             setInverse = setInverse,
             getInverse = getInverse) #put everything in a list
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv) #returns computed inverse
        }
        data <- x$get() #otherwise, return the matrix itself
        inv <- solve(data, ...) #then find the inverse
        x$setInverse(inv) #cache inverse
        inv
}
