#plot3.R
# Read the file into data frame
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")


#Create a subset for date = Feb 1, 2007
inp1 <- subset(data, data$Date == "1/2/2007")
#Create a subset for date = Feb 2, 2007
inp2 <- subset(data, data$Date == "2/2/2007")
#Combine the two subsets to create one single dataframe
inp <- rbind(inp1, inp2)

#Combine date and time columns and then convert it to datetime
date_time <- strptime(paste(inp$Date, inp$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot the 3 submetering columns against datetime.

plot(date_time, inp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(date_time, inp$Sub_metering_2, type="l", col="red")

lines(date_time, inp$Sub_metering_3, type="l", col="blue")

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))


#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot3.png")
dev.off()



