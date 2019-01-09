#RUN THIS CODE FIRST

library(dplyr)

#access file from website, unzip
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./hpc.zip",method="curl")
unzip("./hpc.zip")
file.remove ("./hpc.zip")

#read in table
hpc <- read.table("./household_power_consumption.txt"
                  , header = TRUE, sep = ";", na.strings = "?")
#turn dates and times into... well, dates and times
hpc <- mutate(hpc,
  newdate = as.Date(Date,"%d/%m/%Y")
  ,datetime = as.POSIXct(paste(hpc$Date,hpc$Time,sep=" ")
                         ,format = "%d/%m/%Y %H:%M:%S")
  ,Date = NULL
  ,Time = NULL
)
#grab only those dates needed, overwrite previous hpc to save space
date1 <- as.Date(c("2007-02-01"))
date2 <- as.Date(c("2007-02-02"))
hpc1 <- hpc[which(hpc$newdate == date1),]
hpc2 <- hpc[which(hpc$newdate == date2),]
hpc <- rbind(hpc1,hpc2)

#axis variables, i.e. weekdays
daysvec <- seq(min(hpc$datetime),max(hpc$datetime)+86400,86400)
weekdaysvec <- weekdays(daysvec)
no_weekdays <- NROW(weekdaysvec)
tickmarksvec <- seq(1,no_weekdays)

#Plot 1
plot1 <- with(hpc,hist(Global_active_power,breaks=12,freq=TRUE
              ,col="red",border="black"
              ,main="Global Active Power"
              ,xlab="Global Active Power (kilowatts)"
              ,ylab="Frequency"
              ,ylim=c(0,1200)))
plot1 #Let's have a look
dev.copy(png,"./ExData_Plotting1/plot1.png")
dev.off()