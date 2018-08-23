##Download and unzip file to working directory, assign data to HPC
HPC<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC<-subset(HPC, Date=="2007-02-02" | Date=="2007-02-02" )

# Plot 3
png(file = "./data/plot3.png", width = 480, height = 480)
plot(HPC$DateTime, HPC$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
