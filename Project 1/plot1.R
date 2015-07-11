#load dplyr
library(dplyr)

#load the file
electric <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#filter for only 1/2/2007 and 2/2/2007
electric1 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")

#remove "big" data
rm(electric)

#draw plot for the active power value and create PNG file
png(filename = "plot1.png", width = 480, height = 480, bg = "white")
hist(electric1$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
legend("topright", legend = c("Made by alexvirt1"), col = "red")
dev.off()
