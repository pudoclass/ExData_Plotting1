#plot1.R
# Read the file into data frame
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")


#Create a subset for date = Feb 1, 2007
inp1 <- subset(data, data$Date == "1/2/2007")
#Create a subset for date = Feb 2, 2007
inp2 <- subset(data, data$Date == "2/2/2007")
#Combine the two subsets to create one single dataframe
inp <- rbind(inp1, inp2)

#draw the histogram
hist(inp$Global_active_power, col = "red", breaks = 25, main = "Global Active Power",xlab = "Global Active Power (kilowatts)")


#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot1.png")
dev.off()



