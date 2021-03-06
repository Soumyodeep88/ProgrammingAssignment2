# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)

makeCacheMatrix <- function(x = numeric()) {
  
  
  cache <- NULL
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  getInverse <- function() {
    cache
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# The following function calculates the inverse of a matrix created with makeCacheMatrix
cacheSolve <- function(y, ...) {
  inverse <- y$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  inverse
}
