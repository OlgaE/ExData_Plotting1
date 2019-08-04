#fileName <- "./household_power_consumption.txt"
#data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE)
#data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Here we create a string: date + time (%d/%m/%Y %H:%M:%S):
dateWithTime <- paste(data$Date, data$Time, sep=" ")

# strptime() takes a string and converts it into a date format.
dateWithTime <- strptime(dateWithTime, "%d/%m/%Y %H:%M:%S")

# Extracting data for the first picture:
globalAPower <- as.numeric(data$Global_active_power)

# Extracting data for the top right picture:
voltage <- as.numeric(data$Voltage)

# Extracting data for the bottom right picture:
globalRPower <- as.numeric(data$Global_reactive_power)

# Extracting data for the bottom left picture:
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

# type="l" is for plotting lines.
# top left
plot(dateWithTime, globalAPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# bottom left
plot(dateWithTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateWithTime, subMetering2, type="l", col="red")
lines(dateWithTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# top right
plot(dateWithTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# bottom right
plot(dateWithTime, globalRPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()