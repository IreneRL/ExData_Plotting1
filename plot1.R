# Exploratory analysis - Week1_project - plot1

#R packages needed:
install.packages("data.table")	
library(data.table)
install.packages("dplyr")
library(dplyr)

#read data subset for dates 1.2.2007- 2.2.2007
unzip("./exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- subset(fread("household_power_consumption.txt",na.strings = "?"), grepl("^1/2/2007|^2/2/2007", Date))  

png(file="plot1.png") 
#width of 480 pixels and a height of 480 pixels (default)
hist(data2$Global_active_power, col = "red", main = "Global Active power",xlab = "Global Active Power (kilowatts)")
dev.off()