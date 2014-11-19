# Exploratory Data Analysis. Course Project 1
# Author Payam Rahmdel
# Date 9 Nov 2014

# Read data
data1 <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Adjust format for variable Date 
date <- as.Date(data1$Date, "%d/%m/%Y")
data1$Date <- date

# subset the date for 1st and 2nd day of Feb 2007 only
subset <- (data1$Date == "2007-02-01") | (data1$Date =="2007-02-02")
DT <- data1[subset,]

# merge time and date, add new variable Merge in Date-Time format
mrg <- as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")
DT["Merge"] <- mrg

# plot1
png(file="plot1.png")
hist(DT$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()