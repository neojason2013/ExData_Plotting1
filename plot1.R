#read data 
tdata <- read.table("household_power_consumption.txt",header=T,sep=";")
as.Date(tdata[,"Date"],"dd/mm/yyyy")
sdata <- subset(tdata,Date %in% c("1/2/2007","2/2/2007"))

# plot 1

with (sdata, hist(as.numeric(as.character(Global_active_power)),
                  col="red",main ="Global Active Power",
                  xlab = 'Global Active Power(Kilowatts)' ))
dev.print(png, file="plot1.png", width=480, height=480)
dev.off()