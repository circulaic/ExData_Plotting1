## Exploratory Data Analysis Course Project 1
## Plot 2 Creation

##Load the Data
hhpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("factor", "factor", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))


##Ensure "Date" column coverted to date and Create New Combined Date Time Column in POSIXlt format
hhpower$DateTime<-paste(hhpower$Date,hhpower$Time)
hhpower$Date<-as.Date(hhpower$Date, format="%d/%m/%Y")
hhpower$DateTime<-strptime(hhpower$DateTime,format="%d/%m/%Y %H:%M:%S")


##Subset the data to  2007-02-01 and 2007-02-02 only 
feb12<-hhpower[hhpower$Date>="2007-02-01" & hhpower$Date<="2007-02-02",]
##Generate Plot 2
    ##Open PNG device
    png(filename="plot2.png", width = 480, height = 480, units = "px")
    ##Plot
    with(feb12,plot(DateTime,Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)"))
    ##Close off Device
    dev.off()

