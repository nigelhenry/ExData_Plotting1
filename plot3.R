power_consumption <- read.csv(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
                              sep=";", na.strings=c("?"))
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
ourdata <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"), Date:Sub_metering_3)
ourdata$datetime <- (as.POSIXct(paste(ourdata$Date, ourdata$Time, sep=" ")))
with(ourdata,{
  plot(datetime, Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", legend = names(ourdata)[grep("Sub_metering", names(ourdata))],
         col=c("black","red","blue"), lty=1
         )
})
dev.copy(png, file="plot3.png")
dev.off()