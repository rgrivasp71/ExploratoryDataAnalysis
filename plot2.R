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

#plot2
png(filename = "plot2.png",width = 480, height = 480)
plot(DateAndTime, newdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
