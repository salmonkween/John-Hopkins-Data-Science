#Thu Fri Sat and Global Active Power(killowats)
png("plot2.png")
#> d <- strptime(x, format="%y-%m-%d, %I:%M%p")
#strgptime take string and convert it a time data frame   ->> use this to calculate
#strftime take time data frame and convert into string

#type of date column is double  ->> time data frame
#type of time data frame is character ->> need to switch
#combine Date and time column. Use paste() to concatenate two string column
Datetime<- paste(power2$Date, power2$Time, sep=" ")

#Datetime[8]
# drop the old date and time column from the original data
power3<-power2[, !names(power2) %in% c("Date", "Time")]
#comebine the new datetime column to the edited data
finaldata<-cbind(Datetime,power3)

#format the Datetime column for calculation
finaldata$Datetime<-as.POSIXct(finaldata$Datetime)

#typeof(finaldata$Datetime)
#check and see that the classes for Datetime column is double

#Plot2. Choose type l for connected line
plot(finaldata$Datetime, finaldata$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts",xlab = "", col="black" )
dev.off()

