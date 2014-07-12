# plot1.R -- Generates histogram of Global Active Power

# Pull in data for February 1-2, 2007
data = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data = subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Generate plot
png('plot1.png', 480, 480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()