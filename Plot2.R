#Load, name and subset power consumption data
  GP <- read.table("household_power_consumption.txt",skip=1,sep=";")
  names(GP) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  subGP <- subset(GP,GP$Date=="1/2/2007" | GP$Date =="2/2/2007")
  
#Transform Date and Time
  subGP$Date <- as.Date(subGP$Date, format="%d/%m/%Y")
  subGP$Time <- strptime(subGP$Time, format="%H:%M:%S")
  subGP[1:1440,"Time"] <- format(subGP[1:1440,"Time"],"2007-02-01 %H:%M:%S")
  subGP[1441:2880,"Time"] <- format(subGP[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
  
  
#Plot
  png("plot2.png", width=480, height=480)
  plot(subGP$Time,as.numeric(as.character(subGP$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
  dev.off()