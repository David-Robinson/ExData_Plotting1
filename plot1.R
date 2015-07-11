## Read the household power consumption dataset
readData <- read.csv("household_power_consumption.txt", sep = ';', na.strings = "?")
readData$Date <- as.Date(readData$Date, format = "%d/%m/%Y")

## Subset the specified date range
subsetData <- subset(readData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Construct histogram of data subset
par(mar = c(4, 4, 1, .1))
hist(subsetData$Global_active_power, 
        main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", 
        ylab = "Frequency", 
        col = "red")

## Save to PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()