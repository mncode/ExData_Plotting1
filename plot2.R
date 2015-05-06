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




png("Plot2.png", width  = 480, height = 480)
plot(days, gap, main = "", type ="l", lwd = 1,  ylab = "Global active power(kilowatts)", xlab = "")
dev.off()





