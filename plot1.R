## This script is to read the household power consumption text file that is inside the previously downloaded zip file 

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

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

## Creation of the plot 1

png(filename = "plot1.png", width = 480, height = 480)
hist(household_subset$Global_active_power, col = "red", main = "Global ACtive Power", xlab = "Global Active Power (kilowatts)")
dev.off()