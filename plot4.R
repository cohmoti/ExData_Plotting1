houseRaw = read.table("household_power_consumption.txt", sep=";", header = TRUE,colClasses="character")
house = subset(houseRaw,Date == "1/2/2007" | Date == "2/2/2007")
house$RTime = strptime(paste(house$Date, house$Time),format="%d/%m/%Y %H:%M:%S")

house$Global_active_power = as.numeric(house$Global_active_power)
house$Voltage = as.numeric(house$Voltage)
house$Global_reactive_power = as.numeric(house$Global_reactive_power)
house$Sub_metering_1 = as.numeric(house$Sub_metering_1)
house$Sub_metering_2 = as.numeric(house$Sub_metering_2)
house$Sub_metering_3 = as.numeric(house$Sub_metering_3)

par(mfrow=c(2,2))

plot(house$RTime, house$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(house$RTime,house$Global_active_power)

plot(house$RTime, house$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(house$RTime, house$Voltage)

plot(house$RTime, house$Sub_metering_1, ylab="Energy sub metering",xlab="", type="n")
lines(house$RTime,house$Sub_metering_1,col="black")
lines(house$RTime,house$Sub_metering_2,col="red")
lines(house$RTime,house$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n")


plot(house$RTime, house$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(house$RTime, house$Global_reactive_power)

dev.copy(png,"plot4.png")
dev.off()