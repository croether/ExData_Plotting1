# plot4

# read in data and define relevant subset
dat <- read.table("household_power_consumption.txt", header=TRUE, 
                  sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

# extract dates and times for plotting
Date_Time <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set variables to make code more readable
globalActivePower <- as.numeric(subSetDat$Global_active_power)
globalReactivePower <- as.numeric(subSetDat$Global_reactive_power)
subMetering1 <- as.numeric(subSetDat$Sub_metering_1)
subMetering2 <- as.numeric(subSetDat$Sub_metering_2)
subMetering3 <- as.numeric(subSetDat$Sub_metering_3)
voltage <- as.numeric(subSetDat$Voltage)

# set png size for plot 4 and create the four required panels
png("plot4.png", width=480, height=480, units = "px")
par(mfrow = c(2, 2)) 

# plot panel 1, top left - corresponds to plot2 except unit in ylabel
plot(Date_Time, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power")#, cex = 0.2)

# plot panel 2, top right
plot(Date_Time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot panel 3, bottom left - corresponds to plot3
plot(Date_Time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(Date_Time, subMetering2, type = "l", col = "red")
lines(Date_Time, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"))

# plot panel 4, bottom right
plot(Date_Time, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# turn off graphics device
dev.off()