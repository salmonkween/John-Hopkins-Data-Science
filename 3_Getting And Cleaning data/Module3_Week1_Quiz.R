#JUST FOR GIT testing
#Question 1 worth $1 mor more
# Load the data
Q1<-read.csv("getdata_data_ss06hid.csv")
head(Q1)
# 1m or more is denoted by 24 and not NA
sum(Q1$VAL == "24" & !is.na(Q1$VAL))

#Question 3 get the data that have row from 18-23 and col from 7-15
library(xlsx)
dat<-read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15, header=TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)


#Question 4 XML Data
install.packages("XML")
library(XML)
# remove the s from https will help do the treeparse
fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
Q4<- xmlTreeParse(fileURL, useInternal=TRUE)
#get the root node-wrapper
rootnode<-xml_root(Q4)
# How many has zip code
sum(xmlApply(rootnode,"//zipcode", xmlvalue) ==21231)

#Q5: data table
library(data.table)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv','./Module2_WEEK1_Q5.csv','curl')
print(date())

#use fread() to load data in R object
DT = fread('./Module2_Week1_Q5.csv')

#the answer is
##system.time(ENTER THE FUNCTION in question)

