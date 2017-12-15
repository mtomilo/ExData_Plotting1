#Load, name and subset power consumption data
GP <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(GP) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subGP <- subset(GP,GP$Date=="1/2/2007" | GP$Date =="2/2/2007")

#Plot
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subGP$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
