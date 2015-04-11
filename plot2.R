#Loads data from text file and creates a subset of data from specific dates
powerDataFile <- "~/Developer/DataScience/household_power_consumption.txt"
powerData <- read.table(powerDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na="?")
subSetData <- data[powerData$Date %in% c("1/2/2007","2/2/2007") ,]


#Creates a compined date/time field and set varibles to numeric values
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Create png file
png("plot2.png", width=480, height=480)

#Plot data
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
