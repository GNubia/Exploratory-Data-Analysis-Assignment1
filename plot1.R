

FileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(FileURL, destfile = "./exdata%2Fdata%2Fhousehold_power_consumption.zip" )

power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

head(power_consumption)

selDatePower_Consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

head(selDatePower_Consumption)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

hist(selDatePower_Consumption$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()
