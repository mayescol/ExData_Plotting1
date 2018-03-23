#set working directory
setwd("C:/datasciencecoursera/module4/project1")
#read data from the dates 2007-02-01 and 2007-02-02 and saved to data variable 
data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 col.names = c( "Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                skip = 66637,nrows=2879 , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#convert data and time format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#PLOT1: histogram for Global_active_power 
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file (plot1.png)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()