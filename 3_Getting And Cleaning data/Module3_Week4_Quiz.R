#Question 1
url1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, destfile = "Module3.4.1.csv")
Q1<- read.csv("Module3.4.1.csv")
Q1_answer<-strsplit(names(Q1), "\\wgtp")
Q1_answer[123]

#Question 2
url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2, destfile = "Module3.4.2.csv")
Q2<-read.csv("Module3.4.2.csv")
# the data is messy so we need to REFORMAT the data, rename the column
library(data.table)
Q2.2<-fread("module3.4.2.csv", skip=5, nrows=190, select=c(1,2,4,5), col.names = c("CountryCode", "Rank","countryNames", "GDP"))
#use gsub to remove all , in GDP column -> it will give back
#all the value of GDP without column, NOT THE ENTIRE DATA
Q2clean<-as.integer(gsub(",", "", Q2.2$GDP))

Q2answer<- mean(Q2clean, na.rm = TRUE)     
Q2answer

#Question 3 using the same dataset as Q2
#finding country start with United
Q3<-as.character(Q2.2$countryNames)
#use grep to grab any value start with united in countryname column
#userbytes= true to make the matching done byte by bte?
Q3answer<-grep("^United", Q2.2$countryNames, useBytes = TRUE)
Q3answer
Q3[c(1,6,32)]

#Question 4
url4.1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url4.1, destfile = "Module3.4.4.csv")

url4.2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url4.2, destfile = "Module3.4.42.csv")
Q4.education<-read.csv("Module3.4.42.csv")

#match the data by country short code
#first we need to clean up Q4 gross product data 
Q4.grossproduct<-fread("module3.4.4.csv", skip=5, nrows=190, select=c(1,2,4,5), col.names = c("CountryCode", "Rank","countryNames", "GDP"))

#now merge
Q4merge<-merge(Q4.grossproduct, Q4.education, by="CountryCode")
#grab in the specialnote colun anything end in june
fiscalyear<-grep("Fiscal year end: June", Q4merge$Special.Notes)

#Question 5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
# sample time is the data we work with, that has teh date the data is collected

#load library lubridate for working with time
install.packages("lubridate")
library(lubridate)
y2012<-sampleTimes[grep("2012",sampleTimes)]
library(plyr)
count(y2012)

#how many are counted on Monday
count(y2012[weekdays(y2012) == "Monday"])
