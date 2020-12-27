#Plot 1
library(readr)
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Converting Date to date format and other variables to numeric format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)



#Subsetting the data
data_1 <- subset(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

#Histogram for png 1
png("plot1.png")
hist(data_1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()




