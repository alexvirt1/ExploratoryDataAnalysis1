#load dplyr
library(dplyr)

#load the file
electric <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#filter for only 1/2/2007 and 2/2/2007
electric1 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")
rm(electric)

#make a time vector
time <- strptime(paste(electric1$Date,electric1$Time," "), "%d/%m/%Y %H:%M:%S")

#draw plot #4 - 4 charts at once
# 2 x 2
png(filename = "plot4.png", width = 480, height = 480, bg = "white")

par(mfrow = c(2,2))

# chart #1 - Global active power
plot(time, electric1$Global_active_power, col="black", type="l", ylab = "Global Active Power", xlab = "")

#chart #2 - Voltage
plot(time, electric1$Voltage, col="black", type="l", ylab = "Voltage", xlab = "datetime")

# chart #3 - three submeters at one chart
plot(time, electric1$Sub_metering_1, col="black", type="n", ylab = "Energy sub metering", xlab = "")
lines(time, electric1$Sub_metering_1, col="black", type="l")
lines(time, electric1$Sub_metering_2, col="red")
lines(time, electric1$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, border = "white")

#chart #4 - global reactive power
plot(time, electric1$Global_reactive_power, col="black", type="l", xlab = "datetime")
dev.off()
