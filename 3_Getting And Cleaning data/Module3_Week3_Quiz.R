#question1
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, destfile = "module3.3.csv", )
house<-read.csv("module3.3.csv")
head(house, n=10)
#variable of interest acr and ags
# do not need to use [  ] since they dont ask for subset of data, only vector
answer1<-which((house$ACR == 3 & house$AGS == 6)) [1:3]
answer1

##Question 2
install.packages("jpeg")
library(jpeg)
url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url2, destfile="module3.3.2.jpeg")
#the priblem asked to define the file NATIVE=true
filejpeg<-readJPEG("module3.3.2.jpeg", native = TRUE)
quantile(filejpeg, c(0.3, 0.8))

###Question 3
url3<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url3, destfile = "module3.3.3.csv")
data1<- read.csv("module3.3.3.csv")
url3.2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url3.2, destfile="module3.3.32.csv")
data2<- read.csv("module3.3.32.csv")
install.packages("dplyr")
library(dplyr)

#the data 1 has NO column name -> must match with data 2
#add column name to data1
# use fread function. Load data table package first
library(data.table)
data1.2= fread("module3.3.3.csv", skip=4, nrows=190, select=c(1,2,4,5), col.names = c("CountryCode", "Rank","Economy", "GDP"))
#merge 2 data
newdata<-merge(data1.2, data2, by = "CountryCode")
dim(newdata)
#sort data via rank descending
newdata2<-arrange(newdata,desc(Rank))
newdata2[13,]


# Question 4
unique(newdata$Income.Group)
#use tapply to apply to an object, vector is the income group, function mean
tapply(newdata$Rank, newdata$Income.Group, mean)

#Question 5
install.packages("Hmisc") 
#easier cutting Check week 3 XXX.Creating New variables
library(Hmisc)
Q5<-cut2(newdata$Rank, g=5)
Q5
table(Q5,newdata$Income.Group) 

# OR use quantile function
Q5try<-cut(newdata$Rank,breaks = quantile(newdata$Rank, probs = seq(0, 1, 1/5)))
table(Q5try, newdata$Income.Group)
