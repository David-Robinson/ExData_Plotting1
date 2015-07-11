## Read the household power consumption dataset
readData <- read.csv("household_power_consumption.txt", sep = ';', na.strings = "?")
readData$Date <- as.Date(readData$Date, format = "%d/%m/%Y")

## Subset the specified date range
subsetData <- subset(readData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates to date-time class
date_conv <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$TimeOfDay <- as.POSIXct(date_conv)

## Construct plot of data subset
par(mar = c(4, 4, 1, .1))
plot(subsetData$Global_active_power ~ subsetData$TimeOfDay, 
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)") 

## Save to PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()