#plot4.R
# Read the file into data frame
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")


#Create a subset for date = Feb 1, 2007
inp1 <- subset(data, data$Date == "1/2/2007")
#Create a subset for date = Feb 2, 2007
inp2 <- subset(data, data$Date == "2/2/2007")
#Combine the two subsets to create one single dataframe
inp <- rbind(inp1, inp2)


mDate <- strptime(inp$Date, format = "%d/%m/%y")
wd <- weekdays(mDate)
inp <- cbind(inp,wd)

inp <- cbind(inp,mDate)
#draw the plot
par(mfrow = c(1, 4), mar = c(5, 4, 2, 1))
hist(inp$Global_active_power, col = "red", breaks = 25)
plot(inp$wd, inp$Global_active_power)
plot(inp$wd, inp$Sub_metering_1, type = "l")

#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot4.png")
dev.off



