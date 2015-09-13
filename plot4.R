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

subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))

times<-strptime(pegados,"%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
plot(times,subdata$Global_active_power,type="l",xlab="",ylab="Global Avtive Power (kilowatts)")
plot(times,subdata$Voltage,type="l",ylab="Global Avtive Power (kilowatts)",xlab="datetime")

plot(times,subdata$Sub_metering_1,type="l",ylab="Global Avtive Power (kilowatts)",ylim=c(0.0,40.0))
par(new=T)
plot(times,subdata$Sub_metering_2,type="l",ylab="Global Avtive Power (kilowatts)",col="red",ylim=c(0.0,40.0))
par(new=T)
plot(times,subdata$Sub_metering_3,type="l",ylab="Global Avtive Power (kilowatts)",col="blue",ylim=c(0.0,40.0))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c('black','red','blue'), lty=1,lwd=1.5)
par(new=F)

plot(times,subdata$Global_reactive_power,type="l",ylab="Global Avtive Power (kilowatts)",xlab="datetime")



dev.off()