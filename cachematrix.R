## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function




# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

  minv <- NULL
  
  set <- function(y){
    x <<- y 
    minv <<- NULL
  }
  
  get <- function() x
  setmatrixinverse <- function(matrixinv) minv <<- matrixinv
  getmatrixinverse <- function() minv
  list(set=set, get=get, setmatrixinverse=setmatrixinverse, getmatrixinverse=getmatrixinverse)
}


## Write a short comment describing this function



# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  minv <- x$getmatrixinverse()
  
  if(!is.null(minv)){
    message ("getting cached data")
    return(minv)
  }
  
newdata <- x$get()
minv <- solve(newdata, ...)
x$setmatrixinverse(minv)
minv

  }


