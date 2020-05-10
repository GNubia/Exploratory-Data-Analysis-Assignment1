FileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(FileURL, destfile = "./exdata%2Fdata%2Fhousehold_power_consumption.zip" )

power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

head(power_consumption)

selDatePowerC <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)


Date_Time <- strptime(paste(selDatePowerC$Date, selDatePowerC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(Date_Time, as.numeric(selDatePowerC$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()



