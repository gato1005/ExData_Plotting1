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
png("plot3.png",height = 480,width = 480)

# make the graph/plot in the file
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
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close the graphical device
dev.off()
