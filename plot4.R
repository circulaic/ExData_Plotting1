## Exploratory Data Analysis Course Project 1
## Plot 4 Creation

##Load the Data
hhpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("factor", "factor", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))


##Ensure "Date" column coverted to date and Create New Combined Date Time Column in POSIXlt format
hhpower$DateTime<-paste(hhpower$Date,hhpower$Time)
hhpower$Date<-as.Date(hhpower$Date, format="%d/%m/%Y")
hhpower$DateTime<-strptime(hhpower$DateTime,format="%d/%m/%Y %H:%M:%S")


##Subset the data to  2007-02-01 and 2007-02-02 only 
feb12<-hhpower[hhpower$Date>="2007-02-01" & hhpower$Date<="2007-02-02",]

##Generate Plot 4
##Open PNG device
png(filename="plot4.png", width = 480, height = 480, units = "px")

#Set up matrix frame
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Plot 1:
with(feb12,plot(DateTime,Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)"))

##Plot 2
with(feb12,plot(DateTime,Sub_metering_1,type="n", ylab="Energy sub metering", xlab=""))
with(feb12,points(DateTime,Sub_metering_1,type="l",col="black"))
with(feb12,points(DateTime,Sub_metering_2,type="l",col="red"))
with(feb12,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")

#Plot 3
with(feb12,plot(DateTime,Voltage,type="l", ylab="Voltage"))


#Plot 4
with(feb12,plot(DateTime,Global_reactive_power,type="l"))

##Close off Device
dev.off()

