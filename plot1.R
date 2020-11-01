
data <- read.table("/Users/mcheng/Desktop/JHUPH Data Science Course/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")
str(data)

#transform the data into correct class#
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- format(data$Time, format = "%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

#subset the data#
df <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#plot#
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
