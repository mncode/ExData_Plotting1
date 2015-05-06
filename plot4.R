## Set cursor to read data
firstrow <- read.table('household_power_consumption.txt', sep =';',
                  header = TRUE, stringsAsFactors = TRUE, nrow = 1)
firsttime <- strptime(paste(firstrow$Date, firstrow$Time), format = "%d/%m/%Y %H:%M:%S")

starttime <- strptime("2007-02-01 0:0:0", format = "%Y-%m-%d %H:%M:%S")

stoptime <- strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S")

startrow = as.numeric(starttime -firsttime, units = "mins")
nbrow = 2 * 24 * 60  # 2 days in minutes



## Read data
dat <- read.table('household_power_consumption.txt', sep =';',header = FALSE, stringsAsFactors = TRUE, skip = startrow, nrow = nbrow)
names(dat) <- names(firstrow)
gap <-as.numeric(dat$Global_active_power)
days <- strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
subm1 <- as.numeric(dat$Sub_metering_1)
subm2 <- as.numeric(dat$Sub_metering_2)
subm3 <- as.numeric(dat$Sub_metering_3)
voltage <- as.numeric(dat$Voltage)
grpw <- as.numeric(dat$Global_reactive_power)




png("Plot4.png", width  = 480, height = 480)
par(mfcol = c(2, 2))
plot(days, gap, main = "", type ="l", lwd = 1,  ylab = "Global active power(kilowatts)", xlab = "")
plot(days, subm1, main = "", type ="l", lwd = 1,  ylab = "Energy sub mettering", xlab = "")
lines(days, subm2, col="red")
lines(days, subm3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),      
       lty=c(1,1,1),lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"), bty ="n")

plot(days, voltage, main = "", type ="l", lwd = 1,  ylab = "Voltage", xlab = "daytime")
plot(days, grpw, main = "", type ="l", lwd = 1,  ylab = "Global_reactive_power", , xlab = "daytime")
dev.off()





