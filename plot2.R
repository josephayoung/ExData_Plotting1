# plot2.R -- Generates line graph of Global Active power by day

# Pull in data for February 1-2, 2007
data = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data = subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Generate plot
png('plot2.png', 480, 480)
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()