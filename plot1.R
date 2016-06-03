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
hist(temp$Global_active_power,
     col= "red",
     xlab = "Global Active Power (KiloWatts)",
     main = "Global Active Power")

## save into Plot1.PNG

dev.copy(png, file ="./ExData_Plotting1/Plot1.png")
dev.off()
