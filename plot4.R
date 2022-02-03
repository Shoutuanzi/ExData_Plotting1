setwd("~/Downloads/coursera/2_R programming/w2_assignment/")
library(data.table)
a <- as.data.table(read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character"))
str(a)
b <- a[Date %in% c("1/2/2007", "2/2/2007"),]
b$Date <- as.Date(b$Date, "%d/%m/%Y")
b$DateTime <- paste(b$Date, b$Time)
b[, DateTime:=strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")]
b$Global_active_power <- as.numeric(b$Global_active_power)
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot4.1 <- plot(x = b$DateTime, y = b$Global_active_power, type = "l",
              xlab = "",
              ylab = "Global Active Power")
plot4.2 <- plot(x = b$DateTime, y = b$Voltage, type = "l",
                xlab = "datetime",
                ylab = "Voltage")
plot4.3 <- plot(x = b$DateTime, y = b$Sub_metering_1, type = "l",
                xlab = "",
                ylab = "Energy sub metering")
lines(x = b$DateTime, y = b$Sub_metering_2, col = "red")
lines(x = b$DateTime, y = b$Sub_metering_3, col = "blue")
legend("topright", bty = "n", cex = 1, lty = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"))
print(plot3)
plot4.4 <- plot(x = b$DateTime, y = b$Global_reactive_power, type = "l",
                xlab = "datetime",
                ylab = "Global_reactive_power")
dev.off()
