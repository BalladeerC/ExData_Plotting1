#Run plot1.R first to download dataset

#Plot 4
png("./ExData_Plotting1/plot4.png")
par(mfcol=c(2,2))

#first
plot(hpc$datetime,hpc$Global_active_power,type="l"
     ,ylab="Global Active Power (kilowatts)",xlab="")
axis(1,at=tickmarksvec,labels=weekdaysvec)

#second
plot(hpc$datetime,hpc$Sub_metering_1,type="l"
     ,ylab="Energy sub metering",xlab="")
points(hpc$datetime,hpc$Sub_metering_2,type="l",col="red")
points(hpc$datetime,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1"
                             ,"Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lty=1,bty="n")
axis(1,at=tickmarksvec,labels=weekdaysvec)

#third
with(hpc,plot(datetime,Voltage,type="l"))
axis(1,at=tickmarksvec,labels=weekdaysvec)

#fourth
with(hpc,plot(datetime,Global_reactive_power,type="l"))
axis(1,at=tickmarksvec,labels=weekdaysvec)

dev.off()