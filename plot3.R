# plot3.R -- Generates line graph of Submetering power by day

# Pull in data for February 1-2, 2007
data = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data = subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Generate plot
png('plot3.png', 480, 480)
with(data, {
  plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
})
dev.off()