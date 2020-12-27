#Plot 2 - Load library and data
library(readr)
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Converting Date to date format and other variables to numeric format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)



#Subsetting the data
data_2 <- subset(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

#New variable formed with Time and Date
data_2$DateTime <- strptime(paste(data_2$Date, data_2$Time, sep=" "),"%Y-%m-%d %T")


#Plot 2
png("plot2.png")
plot(data_2$DateTime, data_2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
