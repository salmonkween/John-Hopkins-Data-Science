#How have emissions from motor vehicle sources changed from 1999–2008 
#in Baltimore City?

#subset the data with fips ID for baltimore and type = on roadfor motor vehicle
baltimoremotor<-subset(NEI, NEI$fips == "24510" & NEI$type =="ON-ROAD")

#calculate the sum of emissions from motor vehicle
totalbaltimoremotor<- tapply(baltimoremotor$Emissions, baltimoremotor$year, sum)
head(totalbaltimoremotor, n=5)

#plot x is year, y is Emissions, separated by year
png(file="Plot5.png")
plot(names(totalbaltimoremotor), totalbaltimoremotor, type =  "l", xlab = "Year", ylab = "Total Emissions Pm2.5 from motor vehicle", main = "Total Emissions from motor vehicles by Year in Baltimore")
dev.off()

