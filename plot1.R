##read data from 1/2/2007 to 2/2/2007 in working directory 
data<-read.table("./household_power_consumption.txt",sep=";",header=FALSE,na.strings="?",stringsAsFactors=F,skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrow=2880)

##name the data
names(data)<-read.table("./household_power_consumption.txt",nrow=1,sep=";",stringsAsFactors=F)

##add 1 datetime column with its type is POSIXt(datetime)
data$datetime<- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##open png device, create plot1.png file in working directory
png(file="plot1.png", width=480, height=480)


##plot histogram
hist(data$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)", main="Global Active Power")

##Close png file device
dev.off()