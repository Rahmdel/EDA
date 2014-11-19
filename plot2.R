# Exploratory Data Analysis. Course Project 1
# Author Payam Rahmdel
# Date 9 Nov 2014

# Set working directory
setwd("/Users/Payam/OneDrive/Data-Science-Toolbox/Exploratory Analysis")

# Read data
data1 <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Adjust format for variable Date 
date <- as.Date(data1$Date, "%d/%m/%Y")
data1$Date <- date

# subset the date for 1st and 2nd dat of Feb 2007 only
subset <- (data1$Date == "2007-02-01") | (data1$Date =="2007-02-02")
DT <- data1[subset,]

# merge time and date, add new variable Merge in Date-Time format
mrg <- as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")
DT["Merge"] <- mrg

# plot2
png(file="plot2.png")
plot(DT$Merge,DT$Global_active_power, pch=".",  main="", lty=6, xlab="", ylab="Global Active Power (kilowatts)")
lines(DT$Merge,DT$Global_active_power)
dev.off()
