#Reading data
data <- read.table(file="household_power_consumption.txt",
 sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
 na.strings="?",colClasses =c("character","character",rep("numeric",7)),skip=66637,nrows=2881)
#combining the date and time columns
data$dateTime <- paste(data$Date,data$Time,sep = " ")
# converting string to Date
data$dateTime <- strptime(data$dateTime,"%d/%m/%Y %H:%M:%S")

#Plotting histogram
hist(data$Global_active_power,col="red",xlab="global active power (kilowatts)", main = "Global Active Power")
# Copying the graph to png file using device
dev.copy(png, file = "plot1.png")
dev.off()