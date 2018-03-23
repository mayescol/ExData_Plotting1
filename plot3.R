#set working directory
setwd("C:/datasciencecoursera/module4/project1")
#read data from the dates 2007-02-01 and 2007-02-02 and saved to data variable 
data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                col.names = c( "Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                skip = 66637,nrows=2879 , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#convert data and time format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3: plot sub_metering_1 ~ 3 vs DAte and Time
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file to png format
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()