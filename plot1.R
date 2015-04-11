if (!file.exists("household_power_consumption.txt"))
{
    unzip("exdata-data-household_power_consumption.zip")
}
partialData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), nrows = 100)
classes <- sapply(partialData, class)
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), colClasses=classes, skip = 0)
sampleData <- allData[allData$Date == '1/2/2007' | allData$Date == '2/2/2007',]

png(filename='plot1.png', width = 480, height = 480)
hist(sampleData$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()