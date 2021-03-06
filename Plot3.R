library(dplyr)
library(lubridate)
par(mfrow = c(1,1))
# Read in the rows of the data table that correspond to 1st & 2nd February 2007
filepath <- "C:/Users/Kelly/Desktop/DataScience/Exploratory Data Analysis/data/household_power_consumption.txt"
power <- read.table(file = filepath,
                    sep = ";", nrows = 2880, skip = 66637, na.strings = "?")
colnames(power) <- unlist(strsplit(readLines(con = filepath, n=1), split = ";"))

power$fulldate <- with(power, as.POSIXct(paste(Date, Time), 
                                         format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot3.png", width = 480, height = 480)
plot(power$fulldate, power$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(power$fulldate, power$Sub_metering_1, col = "black")
lines(power$fulldate, power$Sub_metering_2, col = "red")
lines(power$fulldate, power$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()
