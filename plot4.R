# download file from coursera page
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "household_power_consumption.zip")

# unzip the file
unzip(zipfile = "household_power_consumption.zip",exdir = getwd())

# store the table in a dataframe
df<-read.csv2("household_power_consumption.txt",sep = ";")

# make appropriate converions of datatypes
reqdf<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

# store the date and time 
datetime <- strptime(paste(reqdf$Date, reqdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# make a png file to store the graph/plot
png("plot4.png",height = 480,width = 480)

# divide the graphical device into sections as asked in the question
par(mfrow=c(2,2),
    mar=c(4,4,3,3))

# make the graph/plot in the file
plot(datetime,
     as.numeric(reqdf$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
plot(datetime,
     as.numeric(reqdf$Voltage),
     type="l",
     xlab = "datetime",
     ylab = "Voltage")
plot(datetime,
     as.numeric(reqdf$Sub_metering_1),
     col="black",
     type="l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, as.numeric(reqdf$Sub_metering_2), col="red")
lines(datetime, as.numeric(reqdf$Sub_metering_3), col="blue")

# give the legend
legend("topright",
       lty=1,
       lwd=2,
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
plot(datetime,
     as.numeric(reqdf$Global_reactive_power),
     col="black",
     type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# close the graphical device
dev.off()
