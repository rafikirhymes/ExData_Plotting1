table <- subset(read.table(file = "household_power_consumption.txt",
                           sep = ";",
                           header = TRUE, 
                           colClasses = "character"),
                Date == "1/2/2007" | Date == "2/2/2007")

table$datetime <- paste(table$Date,
                        table$Time)

table$datetime <- strptime(table$datetime, format = "%d/%m/%Y %H:%M:%S")

plot(table$datetime, as.numeric(table$Global_active_power), 
     type = "n", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

lines(table$datetime, as.numeric(table$Global_active_power))

dev.copy(png, 'plot2.png')
dev.off()