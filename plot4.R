#opening the data set
data<-read.table("/cloud/project/household_power_consumption.txt",sep = ";", header = TRUE)
#formating date type columns
data$Date<-as.Date(data$Date, "%d/%m/%Y")
#  subsetting dates 2007-02-01 and 2007-02-02
newdata<-subset(data, Date=="2007-02-01"|Date=="2007-02-02")
#Creating a new variable with the date and time
DateAndTime<-paste(as.character(newdata$Date), newdata$Time)
#POSIXlt format to DateAndTime variable
DateAndTime<-strptime(DateAndTime, "%Y-%m-%d %H:%M:%S" )

#plot4
png(filename = "plot4.png",width = 480, height = 480)
#formatting 2x2 graphs and also the margins
par(mfrow=c(2,2), mar=c(4,4,1,1))
#topleft graph: time vs global active power
plot(DateAndTime, newdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#topright graph: time vs voltage
plot(DateAndTime, newdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
#bottomleft graph: time vs energy
plot(DateAndTime, newdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateAndTime, newdata$Sub_metering_2, col="red")
lines(DateAndTime, newdata$Sub_metering_3, col="blue")
legend("topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
#bottomright graph: time vs global reactive power
plot(DateAndTime, newdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()

