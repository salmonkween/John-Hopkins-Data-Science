#Question 2 Have total emissions from PM2.5 decreased in 
#the Baltimore City, Maryland(fips == "24510") from 1999 to 2008? 
#Use base plotting system

#monitor is a city. Variable of interest: fips, then year and emissions

#first subset the data via fips id 
baltimore<-subset(NEI, NEI$fips == "24510")

#caculate the total emission by year in baltimore
totalbaltimore<- tapply(baltimore$Emissions, baltimore$year, sum)
head(totalbaltimore, n=5)

#plotting
png(file = "Plot2.png")
plot(names(totalbaltimore), totalbaltimore, type =  "l", xlab = "Year", ylab = "Total Emissions Pm2.5", main = "Total Emissions by Year in Baltimore")
dev.off()


