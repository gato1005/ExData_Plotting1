# load the library
library(lubridate)

# download file from coursera page
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "household_power_consumption.zip")

# unzip the file
unzip(zipfile = "household_power_consumption.zip",exdir = getwd())

# store the table in a dataframe
df<-read.csv2("household_power_consumption.txt",sep = ";")

# make appropriate converions of datatypes
df$Date<-dmy(df$Date)

# subset only the rows with spcific dates according to the question
reqdf<-subset(df,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

# make appropriate converions of datatypes
reqdf$Global_active_power<-as.numeric(reqdf$Global_active_power)

# make a png file to store the graph/plot
png("plot1.png",height = 480,width = 480)

# make the graph/plot in the file
hist(reqdf$Global_active_power,
     col="red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close the graphical device
dev.off()