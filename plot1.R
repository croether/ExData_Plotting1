# plot1.R creates 1st plot for Exploratory Data Analysis, Assignment 1

# read in data and define relevant subset
dat <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

# set png for plot1 to correct size, then create histogram
png("plot1.png", width=480, height=480, units = "px")
hist(as.numeric(subSetDat$Global_active_power), main = "Global Active Power",  
     xlab = "Global Active Power (kilowatts)", col = "red")

# switch off graphics device
dev.off()
