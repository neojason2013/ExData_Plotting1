#read data 
tdata <- read.table("household_power_consumption.txt",header=T,sep=";")
as.Date(tdata[,"Date"],"dd/mm/yyyy")
sdata <- subset(tdata,Date %in% c("1/2/2007","2/2/2007"))

# plot 3

Sys.setlocale("LC_TIME", "C")

dt <- strptime(paste(sdata[,"Date"],sdata[,"Time"]),"%d/%m/%Y%H:%M:%S")

s1 <- as.numeric(as.character(sdata[,"Sub_metering_1"]))
s2 <- as.numeric(as.character(sdata[,"Sub_metering_2"]))
s3 <- as.numeric(as.character(sdata[,"Sub_metering_3"]))

png(filename="plot3.png", width=480, height=480)
plot(dt,s1,type="l",xlab="",ylab="Energy sub metering")
lines(dt,s2,type="l",xlab="",ylab="",col="red")
lines(dt,s3,type="l",xlab="",ylab="",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

dev.off()