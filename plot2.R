# Exploratory analysis - Week1_project_plot2

#R packages needed:
install.packages("data.table")	
library(data.table)
install.packages("lubridate")
library(lubridate)
install.packages("dplyr")
library(dplyr)

#read data subset for dates 1.2.2007- 2.2.2007
unzip("./exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- subset(fread("household_power_consumption.txt",na.strings = "?"), grepl("^1/2/2007|^2/2/2007", Date))        
#create datetime column
data2<- mutate (data, datetime = paste(Date,Time, sep = " ")) %>%
        select(-Date, -Time)
data2 <- data2[,c(8,1:7)] 
#convert to data-time
data2$datetime <- strptime(data2$datetime, format = "%d/%m/%Y %H:%M:%S" , tz = "")

#make plot2 in png device
#width of 480 pixels and a height of 480 pixels (default)
png(file="plot2.png") 
with(data2, plot(datetime, Global_active_power, type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()