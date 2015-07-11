## Read the household power consumption dataset
readData <- read.csv("household_power_consumption.txt", sep = ';', na.strings = "?")
readData$Date <- as.Date(readData$Date, format = "%d/%m/%Y")

## Subset the specified date range
subsetData <- subset(readData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates to date-time class
date_conv <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$TimeOfDay <- as.POSIXct(date_conv)

## Construct plot of data subset and save to PNG file
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 1, .1))
with(subsetData, {
        plot(Global_active_power ~ TimeOfDay, 
             type = "l",
             xlab = "",
             ylab = "Global Active Power")
        plot(Voltage ~ TimeOfDay,
             type = "l",
             xlab = "datetime",
             ylab = "Voltage")
        plot(Sub_metering_1 ~ TimeOfDay, 
             type = "l",
             xlab = "",
             ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ TimeOfDay, col = "red")
        lines(Sub_metering_3 ~ TimeOfDay, col = "blue")
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")
        plot(Global_reactive_power ~ TimeOfDay, 
             type = "l",
             xlab = "datetime",
             ylab = "Global_reactive_power")
})
dev.off()