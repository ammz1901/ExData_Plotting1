#Plot 4 - Load library and data
library(readr)
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Converting Date to date format and other variables to numeric format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#New variable for Data and time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%Y-%m-%d %T")

#Subset 
data_2 <- subset(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

#PNG 4
png("plot4.png")
par(mfrow = c(2,2)) #Set

#Plot 1

plot(data_2$DateTime, data_2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Plot 2

plot(data_2$DateTime,data_2$Voltage,type="l",xlab="datetime",ylab="Voltage")
#Plot 3

plot(data_2$DateTime, data_2$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(data_2$DateTime,data_2$Sub_metering_2,type="l",col="red")
lines(data_2$DateTime,data_2$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 4

plot(data_2$DateTime,data_2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()