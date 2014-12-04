# Load the txt file
power <- read.csv("~/Documents/R docs/power.txt", sep=";")

# Use as.Date to change the "Date" column from factor to date

power$Date <- as.Date(power$Date,"%d/%m/%Y")

# Load dplyr library
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

# Create a subset data frame that only have data from the 2 days that the assignment looks at

subset<-filter(power,power$Date == "2007-02-01" | power$Date =="2007-02-02")

# Turn "Global_active_power" column from factor to numeric

subset$Global_active_power <-as.numeric(subset$Global_active_power)

# Create a histogram for plot 1
hist(subset$Global_active_power/500,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)",breaks = 14)

