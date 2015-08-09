# plot3

# read in data and define relevant subset
dat <- read.table("household_power_consumption.txt", header=TRUE, 
                  sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

# extract dates and times for plotting
Date_Time <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set variables to make code more readable
globalActivePower <- as.numeric(subSetDat$Global_active_power)
subMetering1 <- as.numeric(subSetDat$Sub_metering_1)
subMetering2 <- as.numeric(subSetDat$Sub_metering_2)
subMetering3 <- as.numeric(subSetDat$Sub_metering_3)

# set png for plot3 to correct size, then create plot3
png("plot3.png", width=480, height=480, units = "px")

plot(Date_Time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(Date_Time, subMetering2, col = "red") #, type = "l")
lines(Date_Time, subMetering3, col = "blue") #, type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2.5)

# turn off graphics device
dev.off()
