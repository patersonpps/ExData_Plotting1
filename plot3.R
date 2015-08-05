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
png(filename = "plot3.png", width = 480, height = 480)

#Create  Plot
with(FebHouse, plot(DT, Sub_metering_1, type = "l", ylab = "Energy sub  metering", xlab=""))
with(FebHouse, lines(DT, Sub_metering_2, type = "l", col = "red"))
with(FebHouse, lines(DT, Sub_metering_3, type = "l",  col = "blue"))
legend("topright", lwd=2, col= c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Close connection
dev.off()
