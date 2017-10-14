table <- subset(read.table(file = "household_power_consumption.txt",
                           sep = ";",
                           header = TRUE, 
                           colClasses = "character"),
                Date == "1/2/2007" | Date == "2/2/2007")

table$datetime <- paste(table$Date,
                        table$Time)

table$datetime <- strptime(table$datetime, format = "%d/%m/%Y %H:%M:%S")

plot(table$datetime, as.numeric(table$Sub_metering_1), 
     type = "n", 
     xlab = "",
     ylab = "Energy sub metering")

lines(table$datetime, as.numeric(table$Sub_metering_1))
lines(table$datetime, as.numeric(table$Sub_metering_2), col = "red")
lines(table$datetime, as.numeric(table$Sub_metering_3), col = "blue")

legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = "solid")

dev.copy(png, 'plot3.png')
dev.off()