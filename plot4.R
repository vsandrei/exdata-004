# plot4.R
# exdata-004 Assignment 1
# 07.12.2014
# vandrei@gmu.edu

# read the data file for 02/01/2007 and 02/02/2007 only
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";",
                   skip = 66636, nrows = 2880)

colnames(data) <- c("Date", "Time",
                    "Global_active_power",
                    "Global_reactive_power",
                    "Voltage",
                    "Global_intensity",
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# date and time conversions
x <- strptime(paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time),
              format = "%Y-%m-%d %H:%M:%S")

# open the graphics device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px",
    bg = "white")

# set parameters
par(mfrow = c(2, 2))

# plot the upper left element
plot(x, data$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")

# plot the upper right element
plot(x, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot the lower left element
plot(x, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

points(x, data$Sub_metering_2,
       type = "l",
       col = "red")

points(x, data$Sub_metering_3,
       type = "l",
       col = "blue")

legend("topright",
       lwd = 1,
       bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot the lower right element
plot(x, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# close the graphics device
dev.off()
