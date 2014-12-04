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



#plot 4

# Createa a 2*2 table, add margin
par(mfrow=c(2,2),mar=c(3,4,1,1))

# code for plot 2
plot(new$Datetime,new$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# plot Voltage ~ Datetime
plot(new$Datetime,new$Voltage,type="l",xlab="datetime",ylab="Voltage")

# code for plot 3
plot(new$Datetime,new$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(new$Datetime,new$Sub_metering_2,col="red")
lines(new$Datetime,new$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.3,lty=c(1,1,1),col=c("black","red","blue"))

# code for Global_reactive_power ~ Datetime
plot(new$Datetime,new$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")





