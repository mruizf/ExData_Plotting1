#move wd
setwd("C:\\Users\\MR\\Documents\\Electric")

#read data
data<-read.csv("household_power_consumption.txt",sep=";")

#change ranges to strings

data$Date<-strftime(strptime(as.character(data$Date),"%d/%m/%Y"),"%d/%m/%Y")
data$Time<-strftime(strptime(data$Time, format="%H:%M:%S"),"%H:%M:%S")
data$Time<-strptime(subdata$Time, format="%H:%M:%S")

#subdata
subdata<-data[data$Date=="01/02/2007" | data$Date=="02/02/2007",]

subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
pegados<-paste(subdata$Date,subdata$Time)

times<-strptime(pegados,"%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")

plot(times,subdata$Global_active_power,type="l",ylab="Global Avtive Power (kilowatts)")

dev.off()