## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix function creates a special vector
## containing functions to get, set matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    matInverse <- NULL
    set <- function(y) {
    x <<- y
    matInverse <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) matInverse <<- solve
    getInverse <- function() matInverse
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
     }
## Write a short comment describing this function

## The following function calculates the inverse of the special "vector"
## created with the makeCacheMatrix function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setInverse` function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' inv <- x$getInverse()
    if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
    }
