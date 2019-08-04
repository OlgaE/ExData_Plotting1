#fileName <- "./household_power_consumption.txt"
#data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE)
#data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Here we create a string: date + time (%d/%m/%Y %H:%M:%S):
dateWithTime <- paste(data$Date, data$Time, sep=" ")

# strptime() takes a string and converts it into a date format.
dateWithTime <- strptime(dateWithTime, "%d/%m/%Y %H:%M:%S")

# Extracting data to be plotted:
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)

# type="l" is for plotting lines.
plot(dateWithTime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(dateWithTime, subMetering2, type="l", col="red")
lines(dateWithTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()