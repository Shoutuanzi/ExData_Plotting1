setwd("~/Downloads/coursera/2_R programming/w2_assignment/")
library(data.table)
a <- as.data.table(read.table("household_power_consumption.txt", header = TRUE, sep = ";"))
#a的默认日期格式是日/月/年
str(a)
table(a$Date)
# b <- a[Date %in% c("1/2/2007", "2/2/2007"),]
# # b$Date <- as.Date(b$Date, "%d/%m/%y")
# b$DateTime <- paste(b$Date, b$Time)
# b[, DateTime:=strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")]
b$Global_active_power <- as.numeric(b$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
plot1 <- hist(b$Global_active_power, freq = T, col = "red",
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
print(plot1)
dev.off()
