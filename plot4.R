# plot3.R -- Generates panel plot of four summary graphs

# Pull in data for February 1-2, 2007
data = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data = subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## Generate 2x2 plots
png('plot4.png', 480, 480)
par(mfcol=c(2,2))

# Plot 1
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# Plot 2
with(data, {
  plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")
})

# Plot 3
with(data, plot(DateTime, Voltage, type="l", xlab="datetime"))

# Plot 4
with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()