## Set working directory
setwd("~/Desktop/Data Scientist/R Data")
## Create working path
if(!file.exists('data')) dir.create('data')
## Download .zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
##Unzip file
unzip('./data/household_power_consumption.zip', exdir = './data')
## HPC= Household Power Consumption
Txtfile <- file('./data/household_power_consumption.txt')
## Assign downloaded data to HPC"household power consumption"
HPC1 <- read.table(Txtfile, stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?", dec = ".")
HPC1$Date <- as.Date(HPC1$Date, format = "%d/%m/%Y")
HPC <- subset(HPC1, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 3
png(file = "./data/plot3.png", width = 480, height = 480)
plot(HPC$DateTime, HPC$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
