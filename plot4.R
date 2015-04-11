#Loads data from text file and creates a subset of data from specific dates
powerDataFile <- "~/Developer/DataScience/household_power_consumption.txt"
powerData <- read.table(powerDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na="?")
subSetData <- data[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Creates a compined date/time field and set varibles to numeric values
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Creates png file
png("plot4.png", width=480, height=480)



#Set graph parameters
par(mfrow = c(2, 2)) 

#Plot data into four graphs and create a legend
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()