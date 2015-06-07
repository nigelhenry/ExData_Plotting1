power_consumption <- read.csv(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
                              sep=";", na.strings=c("?"))
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
ourdata <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"), Date:Sub_metering_3)
with(ourdata, hist(Global_active_power,
                  xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))
dev.copy(png, file="plot1.png")
dev.off()