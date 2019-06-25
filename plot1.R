consumption <- read.delim("household_power_consumption.txt", sep = ";") ##reads the data into RStudio from the .txt document
consumption1 <- consumption[66637:69516,1:9] ##creates a new data table only containing the rows we want

consumption1$Global_active_power <- as.character(consumption1$Global_active_power)
consumption1$Global_active_power <- as.numeric(consumption1$Global_active_power)

png(file = "plot1.png")
hist(consumption1$Global_active_power, breaks = 12, xlim = range(0,6), ylim = range(0,1200), xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()