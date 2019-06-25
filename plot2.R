consumption <- read.delim("household_power_consumption.txt", sep = ";") ##reads the data into RStudio from the .txt document
consumption1 <- consumption[66637:69516,1:9] ##creates a new data table only containing the rows we want

consumption1$Global_active_power <- as.character(consumption1$Global_active_power)
consumption1$Global_active_power <- as.numeric(consumption1$Global_active_power)

dateAndTime <- strptime(paste(consumption1$Date, consumption1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png")
plot(dateAndTime, consumption1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()