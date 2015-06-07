power_consumption <- read.csv(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
                              sep=";", na.strings=c("?"))
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
ourdata <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"), Date:Sub_metering_3)
ourdata$datetime <- (as.POSIXct(paste(ourdata$Date, ourdata$Time, sep=" ")))
with(ourdata, plot(datetime, Global_active_power,
                   xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.copy(png, file="plot2.png")
dev.off()