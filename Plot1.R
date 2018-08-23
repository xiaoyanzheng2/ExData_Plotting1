##Download and unzip file to working directory, assign data to HPC
HPC<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC<-subset(HPC, Date=="2007-02-02" | Date=="2007-02-02" )

## Plot 1
png(file = './data/plot1.png', width = 480, height = 480)
with(HPC, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()
