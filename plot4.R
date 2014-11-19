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

# plot4
png(file="plot4.png")
par(mfcol = c(2,2)) # created two columns and two rows plot

plot(DT$Merge,DT$Global_active_power, pch=".",  main="", lty=6, xlab="", ylab="Global Active Power")
lines(DT$Merge,DT$Global_active_power)

plot(DT$Merge,DT$Sub_metering_1, pch=".", main="", xlab="", ylab="Energy sub metering")
lines(DT$Merge,DT$Sub_metering_1, col="black")
lines(DT$Merge,DT$Sub_metering_2, col="red")
lines(DT$Merge,DT$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1), bty="n")

plot(DT$Merge,DT$Voltage, pch=".", main="", xlab="datetime", ylab="Voltage")
lines(DT$Merge,DT$Voltage)
plot(DT$Merge,DT$Global_reactive_power, pch=".", main="", xlab="datetime", ylab="Global_reactive_power")
lines(DT$Merge,DT$Global_reactive_power)
dev.off()
