table <- subset(read.table(file = "household_power_consumption.txt",
                           sep = ";",
                           header = TRUE, 
                           colClasses = "character"),
                Date == "1/2/2007" | Date == "2/2/2007")

table$datetime <- paste(table$Date,
                        table$Time)

table$datetime <- strptime(table$datetime, format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

#plot 1

plot(table$datetime, as.numeric(table$Global_active_power), 
     type = "n", 
     xlab = "",
     ylab = "Global Active Power")

lines(table$datetime, as.numeric(table$Global_active_power))

#plot 2

with(table, plot(datetime, Voltage, type = "n"))

lines(table$datetime, table$Voltage)

#plot 3

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
       lty = "solid",
       bty = "n")

#plot 4

with(table, plot(datetime, Global_reactive_power, type = "n"))

lines(table$datetime, table$Global_reactive_power)

dev.copy(png, 'plot4.png')
dev.off()