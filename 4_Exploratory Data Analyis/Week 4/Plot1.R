#load library ggplot2
#load library Rcolor brewer for coloring
library(ggplot2)
library(RColorBrewer)

#load RDS data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "project2file.zip")
unzip("./project2file.zip", exdir = "./project2file" )

NEI <- readRDS("./project2file/summarySCC_PM25.rds")
SCC <- readRDS("./project2file/Source_Classification_Code.rds")

#take a look at the data
dim(NEI)
str(NEI)
str(SCC)

#Question 1 Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system
#make a plot showing the total PM2.5 emission from all sources for each years

# Variable of interest: SCC sources, Emission pm2.5, Year
#find total emission by year
totalemiss<- with(NEI, tapply(Emissions, year, sum))

#make a data frame for totalemiss
totalNEI<- data.frame(Year = names(totalemiss), Emissions = totalemiss)
head(totalNEI)

#plot. x is year, y axis is the total emission BASE PLOT
png(file= "Plot1.png")
plot(totalNEI$Year, totalNEI$Emissions, type = "l", xlab = "Year", ylab = "Total Emission pm25", main = "Total Emissions Pm25 by year")
dev.off()

# Note: choose type l to make a connect black line

