is.object(1)
library(datasets)
data(iris)

#get data of the dataset
?iris

#Question 1: mean of sepal length for virginica
sapply(iris, class)
mean(iris[iris$Species == "virginica", ]$Sepal.Length)

#cach nay lam dai hon nhung minh tu lam
data1<- subset(iris, iris$Species == "virginica")
data2<-data1$Sepal.Length
mean(data2)

#cach 3: dung tapply  ->> can apply different condition (vector)
tapply(iris$Sepal.Length, iris$Species == "virginica", mean)

#Question 2: what R code to return the mean of column Sepal length
#sepal width, spetal length, petal width
#use apply for data frame
apply(iris[,1:4],2,mean)

#Question 3: mtcars
library(datasets)
data(mtcars)
?mtcars
#calculate the mean of mpg by number of cyl
tapply(mtcars$mpg, mtcars$cyl, mean)


#Question 4: abs difference between the average horse power
#of 4 cylinder and 8 cylinder car
mean(mtcars[mtcars$cyl == "8",]$hp) - mean(mtcars[mtcars$cyl == "4",]$hp)

#Thu lam. HIGHPOWER is the key HP4-HP8 
mean1<-mean(mtcars[mtcars$cyl == "4",]$hp)
mean1
mean2<-mean(mtcars[mtcars$cyl == "8",]$hp)
mean2


### ASSIGNMENT 3 Matrix Inversion
please see Coursera/JH/ProgrammingAssignment2/
