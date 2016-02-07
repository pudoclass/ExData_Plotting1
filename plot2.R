#plot2.R
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

plot(date_time, inp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot2.png")
dev.off()



