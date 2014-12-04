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




# Create a new data frame called "datetime" that combines the "Date" and "Time" column in the "subset" data frame

datetime<-data.frame(paste(subset$Date,subset$Time))

# Combine the "subset" data frame with "datetime" data frame and name the combination "new" 

new<-cbind(subset,datetime)

# Rename the column "Datetime"
names(new)[10]<-"Datetime"

# Use strptime to new$Datetime

new$Datetime<-strptime(new$Datetime,"%Y-%m-%d %H:%M:%S")


#plot 3

# First, create plot with Sub_metering_1
plot(new$Datetime,new$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

# Second, use lines() to add Sub_metering_2 and Sub_metering_3

lines(new$Datetime,new$Sub_metering_2,col="red")
lines(new$Datetime,new$Sub_metering_3,col="blue")

# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.4)
