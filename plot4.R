consumption <- read.delim("household_power_consumption.txt", sep = ";") ##reads the data into RStudio from the .txt document
consumption1 <- consumption[66637:69516,1:9] ##creates a new data table only containing the rows we want

consumption1$Global_active_power <- as.character(consumption1$Global_active_power)
consumption1$Global_active_power <- as.numeric(consumption1$Global_active_power)

consumption1$Sub_metering_1 <- as.character(consumption1$Sub_metering_1)
consumption1$Sub_metering_1 <- as.numeric(consumption1$Sub_metering_1)
consumption1$Sub_metering_2 <- as.character(consumption1$Sub_metering_2)
consumption1$Sub_metering_2 <- as.numeric(consumption1$Sub_metering_2)
consumption1$Sub_metering_3 <- as.character(consumption1$Sub_metering_3)
consumption1$Sub_metering_3 <- as.numeric(consumption1$Sub_metering_3)

consumption1$Voltage <- as.character(consumption1$Voltage)
consumption1$Voltage <- as.numeric(consumption1$Voltage)

consumption1$Global_reactive_power <- as.character(consumption1$Global_reactive_power)
consumption1$Global_reactive_power <- as.numeric(consumption1$Global_reactive_power)

dateAndTime <- strptime(paste(consumption1$Date, consumption1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



png("plot4.png")
par(mfrow = c(2,2))
plot(dateAndTime, consumption1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dateAndTime, consumption1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateAndTime, as.numeric(consumption1$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
points(dateAndTime, as.numeric(consumption1$Sub_metering_2), type  = "l", col = "red")
points(dateAndTime, consumption1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", cex = 0.8, pch = "_")

plot(dateAndTime, consumption1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = range(0,0.5))
dev.off()