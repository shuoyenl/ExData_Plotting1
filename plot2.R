if (!file.exists("household_power_consumption.txt"))
{
    unzip("exdata-data-household_power_consumption.zip")
}
partialData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), nrows = 100)
classes <- sapply(partialData, class)
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses=classes, skip = 0)
sampleData <- allData[allData$Date == '1/2/2007' | allData$Date == '2/2/2007',]

png(filename='plot2.png', width = 480, height = 480)
plot(sampleData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt='n')
axis(side=1, at=c(0, 1440, 2880), lab=c("Thu","Fri", "Sat"))
dev.off()