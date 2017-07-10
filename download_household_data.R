## This code is to download the data of the household power consumption, and unzip the file into the current directory

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household.zip")
unzip("household.zip", exdir = ".")