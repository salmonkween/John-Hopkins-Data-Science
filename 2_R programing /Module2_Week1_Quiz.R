quiz.data <-read.csv('hw1_data.csv')

#name of column
names(quiz.data)

#extract the first 2 row of the data CAN CHECK LAI TAI KO NHO
quiz.data[c(1,2)]

# how many rows are in data
dim(quiz.data)
# hoac la dung specificly for row
nrow(quiz.data)

#extract the last two row and see how it look like
#same thing as line 6

#what is the value of ozone in row 47th
quiz.data[47,1]
quiz.data[47,"Ozone"]

#Question 16: how many missing value are in ozone column
# cai dau tien ko tinh ra dc
bad <-is.na(quiz.data[,"Ozone"])
# this work. Sum of all NA in ozone column value of quiz data
sum(is.na(quiz.data$Ozone))

#question 17: mean of ozone column, exclude the NA value
mean(quiz.data$Ozone, na.rm = TRUE)

#question 18
#Extract the subset of rows of the data frame where Ozone values are above 31 
#and Temp values are above 90. What is the mean of Solar.R in this subset?
data1<- quiz.data[(quiz.data$Ozone>30) & (quiz.data$Temp>90), "Solar.R"]
mean(data1, na.rm=TRUE)

#question 19: mean of temp when month is 6
data19= subset(quiz.data, Month == 6, select = Temp)
apply(data19, 2, mean, na.rm=TRUE)


#question 20: maximum ozone value in Month of may
data20= subset(quiz.data, Month ==5, select = Ozone)
apply(data20,2,max, na.rm=TRUE)
