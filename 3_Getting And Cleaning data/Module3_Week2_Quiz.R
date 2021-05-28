uscdb<-dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(uscdb,"show databases"); dbDisconnect(uscdb);


#hdf5
#installing HDF5 and create a file

##Quiz
#Question1 API from github
library(httr)

#to create token, got to github profile, developer setting
#create new app API, fill info
oauth_endpoints("github")
# accessing the data
myapp<-oauth_app("github", key="Iv1.88a85f450c0792ad", secret="70269790c7a412b7c6947174ceb1c0acdd811dd1" )
#getting the token ***
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#signature
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
data<-content(req)
#convert to datafram
json2=jsonlite::fromJSON(jsonlite::toJSON(data))

#Getting the time the DATASHARING repo was created DM DEO HIEU
datasharing<-json2[json2$full_name == "jtleek/datasharing"]
dateshared= datasharing[datasharing$created_at]
dateshared


#### Question 2
install.packages("sqldf")
library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "acs.csv")
acs <- read.csv("acs.csv")
head(acs)
#Which of the command will select data pwgtp1 with age less than 50
sqldf("select pwgtp1 from acs where AGEP < 50")

###Question3
A<-unique(acs$AGEP)
# same with
B<-sqldf("select distinct AGEP from acs")
B
identical(A,B$AGEP)


### Question 4 HTML
library(XML)
htmlURL<- "http://biostat.jhsph.edu/~jleek/contact.html"
html_parsed<-htmlTreeParse(htmlURL, useInternalNodes = T)
# Now its pretty and we can work on it
install.packages("rvest")
html_text<-readLines(htmlURL)
c(nchar(html_text[10]), nchar(html_text[20]), nchar(html_text[30]), nchar(html_text[100]))


##Question 5
#read.fwf  : read fixed width space
fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
SST <- read.fwf(fileUrl5, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(SST[,4])

#OR
df <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  widths=c(-1, 9, -5, 4, 4, -5, 4, 4, -5, 4, 4, -5, 4, 4),
  skip=4)
sum(df[,4])
#open teh data to see clearly the width
#skip1, get the next 9, skip 5 get the next 4 and so on
