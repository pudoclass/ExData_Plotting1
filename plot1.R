#plot1.R
# Read the file into data frame
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")


#Create a subset for date = Feb 1, 2007
inp1 <- subset(data, data$Date == "1/2/2007")
#Create a subset for date = Feb 2, 2007
inp2 <- subset(data, data$Date == "2/2/2007")
#Combine the two subsets to create one single dataframe
inp <- rbind(inp1, inp2)

#draw the histogram
hist(inp$Global_active_power, col = "red", breaks = 25)

#Copy the plot to a png file and then close the device
dev.copy(png, file = "plot1.png")
dev.off


inp <- subset(data, strptime(data$Global_active_power, format = "%d/%m/%y") == as.Date.character("2007-02-01"))
