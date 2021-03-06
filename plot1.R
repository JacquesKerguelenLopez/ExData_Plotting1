household_frame<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";");
colnames(household_frame)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_frame$DateTime<-paste(household_frame$Date,household_frame$Time,sep="/")
household_frame$DateTime<-strptime(household_frame$DateTime,format = "%d/%m/%Y/%H:%M:%S")
household_frame$Date<-NULL
household_frame$Time<-NULL
household_frame1<-household_frame[,c(8,1,2,3,4,5,6,7)]
png(filename="plot1.png",width=480,height = 480)
hist(household_frame1$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
