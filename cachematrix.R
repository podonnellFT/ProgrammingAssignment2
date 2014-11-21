## This script contains a pair of functions that cache the inverse of a matrix to
## avoid unnecessary computation of an inverse if it already exists - ie caching.

## The function below creates the object that can cache its inverse
## this is my second go at this so hope it is ok now

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
                  }
get<-function()x
  setmatrix<-function(solve) m<<-solve
  getmatrix<-function() m
  list(set=set, get=get, setmatrix=setmatrix,getmatrix=getmatrix)
}


## this function computes the inverse of the matrix. 
## however, if the inverse is already calcualted, it retrieves the inverse from the cache.
## if not, then it recalcualtes it

cacheSolve <- function(x,...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){
      message("inverse already computed so retrieving cached version")
      return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setmatrix(m)
  m
}
