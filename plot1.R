# plot1.R
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

# open the graphics device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",
    bg = "white")

# plot the histogram
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close the graphics device
dev.off()