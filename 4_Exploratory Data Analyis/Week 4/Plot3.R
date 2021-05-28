#Question 3 Of the four types of sources indicated by 
#the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases/increase in emissions 
#from 1999–2008 for Baltimore City? 
#use ggplot2

library(ggplot2)
# caculate the total emission by TYPES in baltimore city

baltimore<-subset(NEI, NEI$fips == "24510")

#since we will use two index vector year and type -> better use aggregate function
baltimore_typetotal<-aggregate(baltimore$Emissions, by = list(baltimore$year, baltimore$type), sum)
head(baltimore_typetotal, n=5)

#assign column names to the new data frame
colnames(baltimore_typetotal)<- c("year", "type", "Emissions")

#plot
# wrap x y variable around aes() , define color by types of pollutant
#geom_line and geom_points   add points and connected line to the graph
png(file="Plot3.png")
ggplot(baltimore_typetotal, aes(x=year, y= Emissions, col= type)) + geom_line() + 
  geom_point() + 
  ggtitle("Total Emissions Pm2.5 by Types in Baltimore") +
  ylab("Total Emissions") +xlab("Year")
dev.off()
