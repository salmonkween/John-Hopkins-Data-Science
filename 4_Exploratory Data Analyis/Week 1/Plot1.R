library(data.table)
#load data, seperation between variable is ;
powerdata<-read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?")

#convert date and time variable to Date time in R
powerdata$Date<- as.Date(powerdata$Date, "%d/%m/%Y")

#subset data from feb 1 2007 to feb 2 2007 only
power2<- subset(powerdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#second way using subset()
#power3<-subset(powerdata, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

#construct plot and save to PNG file named plot1.png
#Plot1 global active power vs frequency
png(file="plot1.png")
hist(power2$Global_active_power, main ="Global Active Power", xlab = "Global Active Power(killowatts)", ylab = "Frequency", col = "red")
dev.off()


