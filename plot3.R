## This script is to read the household power consumption text file that is inside the previously downloaded zip file 

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Adding the information from date and time to a new column

RealTime <- strptime(paste(household$Date,household$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household <- cbind(household,RealTime)

## Converting variables to facilitate the manipulation in the plots

household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
household$Time <- format(household$Time, format = "%H:%M:%S")
household$Global_active_power <-  as.numeric(household$Global_active_power)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)
household$Voltage <- as.numeric(household$Voltage)
household$Global_intensity <- as.numeric(household$Global_intensity)
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)

## A subset of the file is created in order to get only the information related to the days 2007-02-01 and 2007-02-02

household_subset <- subset(household,household$Date=="2007-02-01"|household$Date=="2007-02-02")

## Creation of the plot 3

png(filename = "plot3.png", width = 480, height = 480)
with(household_subset, plot(RealTime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black"))
lines(household_subset$RealTime,household_subset$Sub_metering_2, type = "l", col = "red")
lines(household_subset$RealTime,household_subset$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=1, col = c("black", "red", "blue"))
dev.off()