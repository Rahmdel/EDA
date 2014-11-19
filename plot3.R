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

# plot3
png(file="plot3.png")
plot(DT$Merge,DT$Sub_metering_1, pch=".", main="", xlab="", ylab="Energy sub metering")
lines(DT$Merge,DT$Sub_metering_1, col="black")
lines(DT$Merge,DT$Sub_metering_2, col="red")
lines(DT$Merge,DT$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
