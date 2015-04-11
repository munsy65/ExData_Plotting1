#Loads data from text file and creates a subset of data from specific dates
powerDataFile <- "~/Developer/DataScience/household_power_consumption.txt"
powerData <- read.table(powerDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na="?")
subSetData <- data[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Set varibles to numeric values 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Create png file
png("plot1.png", width=480, height=480)

#Plot data
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()