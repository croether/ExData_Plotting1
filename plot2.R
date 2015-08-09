# plot2 creates 2nd plot for Exploratory Data Analysis, Assignment 1


# read in data and define relevant subset
dat <- read.table("household_power_consumption.txt", header=TRUE, 
                  sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

# extract dates and times for plotting
Date_Time <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# set png for plot2 to correct size, then create plot2
png("plot2.png", width=480, height=480, units = "px")
plot(Date_Time, as.numeric(subSetDat$Global_active_power), type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

# turn off graphics device
dev.off()
