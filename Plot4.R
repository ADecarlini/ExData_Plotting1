setwd("F:/Data Science/Curso/Exploratory_analysis/Tarea1")
file = "./exdata-data-household_power_consumption/household_power_consumption.txt"


## Load file, filtering date in 2007-02-01 and 2007-02-02
info = read.table( file = file,
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = "?")
temp = subset(info, info$Date == "2/2/2007" | info$Date == "1/2/2007")
rm(info)

## plot 
temp$asdate <- strptime(paste(temp$Date,temp$Time),"%e/%m/%Y %H:%M:%S")

par(mfrow= c(2,2), mar= C(4,4,2,1))

## plot 1
plot(x = temp$asdate,
     y = temp$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l"
)

## plot 2
plot(x = temp$asdate,
     y = temp$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l"
)

## plot 3
plot(x = temp$asdate,
     y = temp$Sub_metering_1,
     xlab = "",
     ylab = "Energy Sub Metering",
     type = "l")

points(x = temp$asdate,
       y = temp$Sub_metering_2,
       type = "l",
       col = "red")

points(x = temp$asdate,
       y = temp$Sub_metering_3,
       type = "l",
       col = "blue")

legend("topright", 
       ##  pch = 21,
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1
)

## plot 4

plot(x = temp$asdate,
     y = temp$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l"
)

## save into Plot4.PNG

dev.copy(png, file ="./ExData_Plotting1/Plot4.png")
dev.off()