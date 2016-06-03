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

plot(x = temp$asdate,
     y = temp$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l"
     )
  


## save into Plot2.PNG

dev.copy(png, file ="./ExData_Plotting1/Plot2.png")
dev.off()
