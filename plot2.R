#Set Directory
setwd("C:/Users/fronte/Downloads")

#Read data into table
house <- read.table("household_power_consumption.txt", sep =  ";", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")

#Convert Date field  to POSIXlt
house$Date <- strptime(house$Date, format = "%d/%m/ %Y")

#Combine Date and Time fields
house$DateTime <- paste(house$Date, house$Time)

#Convert DateTime Field to POSIXlt
house$DT <- strptime(house$DateTime, format = "%Y-%m-%d %H:%M:%S")

#Select subset of data
FebHouse <- subset(house, house$Date== "2007-02-01" | house$Date== "2007-02-02")

#Open PNG connection
png(filename = "plot2.png", width = 480, height = 480)

#Create  Plot
with(FebHouse, plot(DT, Global_active_power, type="l", ylab= "Global Active Power", xlab = ""))

#Close connection
dev.off()
