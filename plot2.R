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
png("plot2.png",height = 480,width = 480)

# make the graph/plot in the file
plot(datetime, as.numeric(reqdf$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the graphical device
dev.off()

