#Question 4 Across the United States, how have emissions 
#from coal combustion-related sources changed from 1999–2008?

#first we need to match SCC name in NEI data to anything coal related in SCC data
#extract SCC code combustion-related sources from SCC data
head(SCC, n =5)
names(SCC)
unique(SCC$Short.Name)

#grab all the coal related source in SCC short name column
#make sure to grab both coal and Coal => ignore.case is TRUE
coalsource<- SCC[grep("coal", SCC$Short.Name, ignore.case = T),]
nrow(coalsource)

#from the NEI data, subset the data with the matching SCC number in the coalsource data
UScoal<-subset(NEI, NEI$SCC %in% coalsource$SCC)

#total emissions all over US from combustion related source
# x is year y is emissions, separated by type
# use aggregate
totalUScoal<-aggregate(UScoal$Emissions, by=list(UScoal$year, UScoal$type), sum)

#assigning the name to new dataframe, containing the sum value
colnames(totalUScoal)<-c("Year", "Type","Emissions")

# making the plot, include the points, and the connected line
png(file="Plot4.png")
ggplot(totalUScoal, aes(x=Year, y= Emissions, col= Type)) + geom_line() + 
  geom_point() + 
  ggtitle("Total Emissions Pm2.5 from coal combustion related sources in US") +
  ylab("Total Emissions") +xlab("Year")
dev.off()
