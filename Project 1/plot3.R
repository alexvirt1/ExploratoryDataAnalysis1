#load dplyr
library(dplyr)

#load the file
electric <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#filter for only 1/2/2007 and 2/2/2007
electric1 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")
rm(electric)

#make a time vector
time <- strptime(paste(electric1$Date,electric1$Time," "), "%d/%m/%Y %H:%M:%S")

#draw 3 plot lines at the same chart for submeterings
png(filename = "plot3.png", width = 500, height = 500, bg = "white")
plot(time, electric1$Sub_metering_1, col="black", type="n", ylab = "Energy sub metering", xlab = "")
lines(time, electric1$Sub_metering_1, col="black", type="l")
lines(time, electric1$Sub_metering_2, col="red")
lines(time, electric1$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()