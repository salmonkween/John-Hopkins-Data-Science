add2<-function(x,y){
  x+y
}

#Practice 2: Take a subset of vector and return vector that has value above 10
# in the console: define above with value x, and n >> R will find any value
#in x that is bigger than n
above10<-function(x){
  use <- x>10
  x[use]
  
}

above<- function(x,n){
  use<-x>n
  x[use]
  
}

#Practice 3: With matrix and data frame, take mean of each column
columnmean <- function(x, na.rm=TRUE){
  nc=ncol(y)
  means=numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i], na.rm=TRUE)
  }
  means
}

### Practice SWIRL
install.packages("swirl")
#check the package version
packageVersion("swirl")

#load package
library(swirl)

# install R programing class
install_from_swirl("R Programming")

#start swirl
swirl()


# ASSIGNMENT 1: AIR POLLUTION
pollutantmean<-function(directory,pullutant, id=1:332)
## polutant: sulfate or nitrate, id: the case number

pollutantmean("specdata", "sulfate", 1:10)
