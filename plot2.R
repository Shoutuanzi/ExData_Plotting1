setwd("~/Downloads/coursera/2_R programming/w2_assignment/")
library(data.table)
a <- as.data.table(read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character"))
str(a)
b <- a[Date %in% c("1/2/2007", "2/2/2007"),]
b$Date <- as.Date(b$Date, "%d/%m/%Y")
b$DateTime <- paste(b$Date, b$Time)
b[, DateTime:=strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")]
b$Global_active_power <- as.numeric(b$Global_active_power)
png(filename = "plot2.png", width = 480, height = 480)
plot2 <- plot(x = b$DateTime, y = b$Global_active_power, type = "l",
              xlab = "",
              ylab = "Global Active Power(kilowatts)")
print(plot2)
dev.off()


