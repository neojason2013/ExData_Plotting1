#read data 
tdata <- read.table("household_power_consumption.txt",header=T,sep=";")
as.Date(tdata[,"Date"],"dd/mm/yyyy")
sdata <- subset(tdata,Date %in% c("1/2/2007","2/2/2007"))

# plot 2

Sys.setlocale("LC_TIME", "C")

dt <- strptime(paste(sdata[,"Date"],sdata[,"Time"]),"%d/%m/%Y%H:%M:%S")
gap <- as.numeric(as.character(sdata[,"Global_active_power"]))
plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.print(png, file="plot2.png", width=480, height=480)
dev.off()