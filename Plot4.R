#Load, name and subset power consumption data
  GP <- read.table("household_power_consumption.txt",skip=1,sep=";")
  names(GP) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  subGP <- subset(GP,GP$Date=="1/2/2007" | GP$Date =="2/2/2007")

#Transform Date and Time
  subGP$Date <- as.Date(subGP$Date, format="%d/%m/%Y")
  subGP$Time <- strptime(subGP$Time, format="%H:%M:%S")
  subGP[1:1440,"Time"] <- format(subGP[1:1440,"Time"],"2007-02-01 %H:%M:%S")
  subGP[1441:2880,"Time"] <- format(subGP[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
  
#Plot with multi row and col
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  with(subGP,{
    plot(subGP$Time,as.numeric(as.character(subGP$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(subGP$Time,as.numeric(as.character(subGP$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(subGP$Time,subGP$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(subGP,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(subGP,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(subGP,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(subGP$Time,as.numeric(as.character(subGP$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
  })
  dev.off()