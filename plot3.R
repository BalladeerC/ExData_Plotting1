#Run plot1.R first to download dataset

#Plot 3
png("./ExData_Plotting1/plot3.png")
plot(hpc$datetime,hpc$Sub_metering_1,type="l"
     ,ylab="Energy sub metering",xlab="")
points(hpc$datetime,hpc$Sub_metering_2,type="l",col="red")
points(hpc$datetime,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1"
                             ,"Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lty=1)
axis(1,at=tickmarksvec,labels=weekdaysvec)
dev.off()