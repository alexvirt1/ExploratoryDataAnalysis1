#load dplyr
library(dplyr)

#load the file
electric <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#filter for only 1/2/2007 and 2/2/2007
electric1 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")
rm(electric)

#make a time vector
time <- strptime(paste(electric1$Date,electric1$Time," "), "%d/%m/%Y %H:%M:%S")

#draw a line chart for active power
png(filename = "plot2.png", width = 480, height = 480, bg = "white")
plot(time, electric1$Global_active_power, type="l", ylab = "Global Active Power (killowats)", xlab = "")
legend("topright", legend = c("Made by alexvirt1"), col = "red")
dev.off()

