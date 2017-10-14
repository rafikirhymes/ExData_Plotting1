table <- subset(read.table(file = "household_power_consumption.txt",
                           sep = ";",
                           header = TRUE, 
                           colClasses = "character"),
                Date == "1/2/2007" | Date == "2/2/2007")

table$datetime <- paste(table$Date,
                        table$Time)

table$datetime <- strptime(table$datetime, format = "%d/%m/%Y %H:%M:%S")

hist(as.numeric(table$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power")

dev.copy(png, 'plot1.png')
dev.off()