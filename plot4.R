FileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(FileURL, destfile = "./exdata%2Fdata%2Fhousehold_power_consumption.zip" )

power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

head(power_consumption)

selDatePowerC <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

Date_Time <- strptime(paste(selDatePowerC$Date, selDatePowerC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(selDatePowerC$Sub_metering_1)

subMetering2 <- as.numeric(selDatePowerC$Sub_metering_2)

subMetering3 <- as.numeric(selDatePowerC$Sub_metering_3)


png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

par(mfrow = c(2, 2)) 

plot(Date_Time, as.numeric(selDatePowerC$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Date_Time, as.numeric(selDatePowerC$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(Date_Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_Time, subMetering2, type="l", col="red")
lines(Date_Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Date_Time, as.numeric(selDatePowerC$ Global_reactive_power), type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()


