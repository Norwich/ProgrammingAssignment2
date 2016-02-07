## Put comments here that give an overall description of what your
## functions do
## Functions allow computing an inverse matrix and saving computational steps if a value of an inverse matrix is already stored in cache.

## Write a short comment describing this function

## 1. makeCacheMatrix function creates a matrix, and list of functions that 
## a) set a matrix value: introducing a new matrix value that gets stored in a cache, 
## clearing inverse matrix cache. x & a are to be stored in environment that is different from a function environment;
## b) get a matrix value: returns a current matrix value;
## c) set a value of inverse matrix: sets an inverse matrix value, and stores it in a cache;
## d) get a value of inverse matrix: returns an inverse matrix value from cache.

makeCacheMatrix <- function(x = matrix()) {
        a <- NULL
        set <- function(y) {
                x <<- y
                a <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) a <<- inverse
        getinverse <- function() a
        list(set=set, get=get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
## The function gets an inverse matrix value from cache. 
## If a value is not null, it means it exists in cache, hence it will be passed to a return value 
## saving computational steps. If a value is null, then inverse matrix is to be computed. Its value gets stored in cache.


cacheSolve <- function(x, ...) {
        a <- x$getinverse()
        if(!is.null(a)){
                message("Returning a matrix that is the inverse of 'x'")
                return(a)
        }
        data <- x$get()
        a <- solve(data)
        x$setinverse(a)
        a
}



