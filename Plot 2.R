##Download and unzip file to working directory, assign data to HPC
HPC<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC<-subset(HPC, Date=="2007-02-02" | Date=="2007-02-02" )

## Plot 2
## Convert date, time
HPC$DateTime <- as.POSIXct(paste(HPC$Date, HPC$Time))
png(file = "./data/plot2.png", width = 480, height = 480)
with(HPC, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = 'l'))
dev.off()
