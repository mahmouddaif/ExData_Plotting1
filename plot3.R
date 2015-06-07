#Reading data
data <- read.table(file="household_power_consumption.txt",
 sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
 na.strings="?",colClasses =c("character","character",rep("numeric",7)),skip=66637,nrows=2881)
#combining the date and time colums
data$dateTime <- paste(data$Date,data$Time,sep = " ")
# converting string to Date
data$dateTime <- strptime(data$dateTime,"%d/%m/%Y %H:%M:%S")
# a list of min and max date
daterange=c(as.POSIXlt(min(data$dateTime)), as.POSIXlt(max(data$dateTime)))
daysNumeric <- as.numeric(data$dateTime)

#Plotting
plot(data$Sub_metering_1~daysNumeric,type="l",xaxt="n",ylab="Energy Sub Metering",xlab="",xaxt="n")
lines(data$Sub_metering_2~daysNumeric,type="l",xaxt="n",ylab="Energy Sub Metering",xlab="",xaxt="n",col="red")
lines(data$Sub_metering_3~daysNumeric,type="l",xaxt="n",ylab="Energy Sub Metering",xlab="",xaxt="n",col="blue")
legend("topright", col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = c(1, 1, 1))
# drawing x axis
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a")
# Copying the graph to png file using device
dev.copy(png, file = "plot3.png")
dev.off()