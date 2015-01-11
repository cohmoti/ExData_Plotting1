houseRaw = read.table("household_power_consumption.txt", sep=";", header = TRUE,colClasses="character")
house = subset(houseRaw,Date == "1/2/2007" | Date == "2/2/2007")
house$RTime = strptime(paste(house$Date, house$Time),format="%d/%m/%Y %H:%M:%S")
house$Global_active_power = as.numeric(house$Global_active_power)
hist(house$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")

dev.copy(png,"plot1.png")
dev.off()
