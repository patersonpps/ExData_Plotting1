#Set Directory
setwd("C:/Users/fronte/Downloads")

# Read data into table
house <- read.table("household_power_consumption.txt", sep =  ";", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")

#Convert Date to POSIXlt format 
house$Date <- strptime(house$Date, format = "%d/%m/ %Y")

#Select subset of data
FebHouse <- subset(house, house$Date== "2007-02-01" | house$Date== "2007-02-02")

#Open connection for PNG file
png(filename = "plot1.png", width = 480, height = 480)

#Draw Histogram
hist(FebHouse$Global_active_power, col = "red", main= paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

#Close connection
dev.off()
