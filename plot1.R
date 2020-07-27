#opening the data set
data<-read.table("/cloud/project/household_power_consumption.txt",sep = ";", header = TRUE)
#formating date type columns
data$Date<-as.Date(data$Date, "%d/%m/%Y")
#  subsetting dates 2007-02-01 and 2007-02-02
newdata<-subset(data, Date=="2007-02-01"|Date=="2007-02-02")

#Generating plot1.png
png(filename = "plot1.png",width = 480, height = 480)
with(newdata, hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()