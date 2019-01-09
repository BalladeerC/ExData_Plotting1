#Run plot1.R first to download dataset

#Plot 2
png("./ExData_Plotting1/plot2.png")
plot(hpc$datetime,hpc$Global_active_power,type="l"
     ,ylab="Global Active Power (kilowatts)",xlab="")
axis(1,at=tickmarksvec,labels=weekdaysvec)
dev.off()