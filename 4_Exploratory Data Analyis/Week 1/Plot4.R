#combine plot 2 and 3 then add 2 new plots
png("plot4.png")
par(mfcol = c(2,2))
with(finaldata,{
  plot(finaldata$Datetime, finaldata$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts",xlab = "", col="black" )
  
  plot(finaldata$Datetime, finaldata$Sub_metering_1, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")
  lines(finaldata$Datetime,finaldata$Sub_metering_2, col = "red")
  lines(finaldata$Datetime, finaldata$Sub_metering_3, col ="blue")
  legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1) )
  
  plot(finaldata$Datetime, finaldata$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
  
  plot(finaldata$Datetime, finaldata$Global_reactive_power, type = "l", ylab = "Global_Reactive_Power", xlab = "datetime")
})
dev.off()
