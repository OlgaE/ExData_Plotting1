#fileName <- "./household_power_consumption.txt"
#data <- read.table(fileName, header=TRUE, sep=";")
#data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Here we create a string: time + date (%H:%M:%S %d/%m/%Y):
dateWithTime <- paste(data$Time, data$Date, sep=" ")

# strptime() takes a string and converts it into a date format.
dateWithTime <- strptime(dateWithTime, "%H:%M:%S %d/%m/%Y")

globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateWithTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()