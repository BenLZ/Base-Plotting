consumption <- read.delim("household_power_consumption.txt", sep = ";") ##reads the data into RStudio from the .txt document
consumption1 <- consumption[66637:69516,1:9] ##creates a new data table only containing the rows we want

consumption1$Sub_metering_1 <- as.character(consumption1$Sub_metering_1)
consumption1$Sub_metering_1 <- as.numeric(consumption1$Sub_metering_1)
consumption1$Sub_metering_2 <- as.character(consumption1$Sub_metering_2)
consumption1$Sub_metering_2 <- as.numeric(consumption1$Sub_metering_2)
consumption1$Sub_metering_3 <- as.character(consumption1$Sub_metering_3)
consumption1$Sub_metering_3 <- as.numeric(consumption1$Sub_metering_3)

dateAndTime <- strptime(paste(consumption1$Date, consumption1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png")
plot(dateAndTime, as.numeric(consumption1$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
points(dateAndTime, as.numeric(consumption1$Sub_metering_2), type  = "l", col = "red")
points(dateAndTime, consumption1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "o", cex = 0.8, pch = "_")
dev.off()