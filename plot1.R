fileName <- "./household_power_consumption.txt"
data <- read.table(fileName, header=TRUE, sep=";")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Another way to subset data between two dates:
# date1 <- as.Date("2016-07-01")
# date2 <- as.Date("2017-08-01")
# data <- df[df$Date >= date1 & df$Date <= date2,]

gPower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gPower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()