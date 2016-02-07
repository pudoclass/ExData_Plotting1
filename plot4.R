#plot4.R
# Read the file into data frame
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")


#Create a subset for date = Feb 1, 2007
inp1 <- subset(data, data$Date == "1/2/2007")
#Create a subset for date = Feb 2, 2007
inp2 <- subset(data, data$Date == "2/2/2007")
#Combine the two subsets to create one single dataframe
inp <- rbind(inp1, inp2)


 
#Set the parameter for the panel 2 rows and 2 columns
par(mfrow = c(2, 2)) 

#Plot1
hist(inp$Global_active_power, col = "red", breaks = 25, main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

#Plot2

date_time <- strptime(paste(inp$Date, inp$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(date_time, inp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot3
plot(date_time, inp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(date_time, inp$Sub_metering_2, type="l", col="red")

lines(date_time, inp$Sub_metering_3, type="l", col="blue")

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

#Plot4

plot(date_time, inp$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot4.png")
dev.off()



