if (!file.exists("household_power_consumption.txt"))
{
    unzip("exdata-data-household_power_consumption.zip")
}
partialData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), nrows = 100)
classes <- sapply(partialData, class)
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses=classes, skip = 0)
sampleData <- allData[allData$Date == '1/2/2007' | allData$Date == '2/2/2007',]

png(filename='plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

#1
plot(sampleData$Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt='n')
axis(side=1, at=c(0, 1440, 2880), lab=c("Thu","Fri", "Sat"))

#2
plot(sampleData$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt='n')
axis(side=1, at=c(0, 1440, 2880), lab=c("Thu","Fri", "Sat"))

#3
plot(sampleData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt='n')
points(sampleData$Sub_metering_2, type="l", col="red")
points(sampleData$Sub_metering_3, type="l", col="blue")
axis(side=1, at=c(0, 1440, 2880), lab=c("Thu","Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n",lwd=1, col=c("black","red","blue"), lty=c(1,1,1))

#4
plot(sampleData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt='n')
axis(side=1, at=c(0, 1440, 2880), lab=c("Thu","Fri", "Sat"))

dev.off()