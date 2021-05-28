# Datetime vs Enger Sub Metering
png("plot3.png")
#this is an overlapped graph of sub mettering 1 2 and 3
plot(finaldata$Datetime, finaldata$Sub_metering_1, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")

#gradually add sub mettering 2 in. Instead of adding points, we add line
lines(finaldata$Datetime,finaldata$Sub_metering_2, col = "red")

#add sub mettering 3 in
lines(finaldata$Datetime, finaldata$Sub_metering_3, col ="blue")

#adding legend, define lty for solid line
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1) )
dev.off()
