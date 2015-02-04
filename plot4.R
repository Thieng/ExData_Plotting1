##read data from 1/2/2007 to 2/2/2007 in working directory 
data<-read.table("./household_power_consumption.txt",sep=";",header=FALSE,na.strings="?",stringsAsFactors=F,skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrow=2880)

##name the data
names(data)<-read.table("./household_power_consumption.txt",nrow=1,sep=";",stringsAsFactors=F)

##add 1 datetime column with its type is POSIXt(datetime)
data$datetime<- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##open png device, create plot3.png file in working directory
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
##plot lines
with(data,{
  plot(datetime, Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(datetime, Voltage,type="l")
  plot(datetime, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  ##add line
  lines(datetime,Sub_metering_2,col="red")
 lines(datetime,Sub_metering_3,col="blue")
  ##add legend
  legend("topright", pch="__", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 plot(datetime, Global_reactive_power,type="l")
  
})

##Close png file device
dev.off()