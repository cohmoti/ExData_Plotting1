houseRaw = read.table("household_power_consumption.txt", sep=";", header = TRUE,colClasses="character")
house = subset(houseRaw,Date == "1/2/2007" | Date == "2/2/2007")
house$RTime = strptime(paste(house$Date, house$Time),format="%d/%m/%Y %H:%M:%S")
house$Global_active_power = as.numeric(house$Global_active_power)

plot(house$RTime, house$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(house$RTime,house$Global_active_power)
dev.copy(png,"plot2.png")
dev.off()
