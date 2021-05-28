#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California fips == "06037"
#Which city has seen greater changes over time in motor vehicle emissions?

#subset the emissions data from motor vehicle for LA and Balitimore 
LAbaltimoremotor<-subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type =="ON-ROAD")
totalLAbaltimoremotor<-aggregate(LAbaltimoremotor$Emissions, by= list(LAbaltimoremotor$year, LAbaltimoremotor$fips), sum)

#rename the column
colnames(totalLAbaltimoremotor)<- c("year", "City", "Emissions")

#plot
# x is year, y is total emissions, separated by different FIGS aka city
# use scale_colour _discrete to correctly label the legends with city names instead of fips code

png(file="Plot6.png")
ggplot(totalLAbaltimoremotor, aes(x=year, y=Emissions, col= City))+
         geom_line()+
         geom_point()+
         xlab("Year")+ylab("Total Emissions Pm2.5 from motor vehicles")+
         ggtitle("Total Emissions Pm2.5 across the years from motor vehicles in LA and Baltimore")+
        scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) 
  )
dev.off()
