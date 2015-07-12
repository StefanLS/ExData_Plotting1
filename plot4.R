# Creates a PNG-file in the working dirctory 
## with a 2x2 panel of 4 plots.
## 
## Output filename: "plot4.png"

## Read the data, the extracted data file is assumed to be in the working directory
## and seclect the subset, which is relevant for the plot
hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, na.strings="?", sep=";",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric","numeric"))

hpcPlotData <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

## Open device, create 2x2-panel
png("plot4.png")
par(mfrow=c(2,2))

## Create the 4 subplots

## 1. subplot: Global active power
plot(hpcPlotData$Global_active_power, 
     main="", xlab="", xaxt="n", type="l", cex.lab=0.9,
     ylab="Global Active Power")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

## 2. subplot: Voltage
plot(hpcPlotData$Voltage, 
     main="", xaxt="n", type="l", cex.lab=0.9,
     xlab="datetime", ylab="Voltage")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

## 3. subplot: Submeter measurements
plot(hpcPlotData$Sub_metering_1, cex.lab=0.9,
     type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines(hpcPlotData$Sub_metering_2, 
      col="red")
lines(hpcPlotData$Sub_metering_3, 
      col="blue")
legend("topright", lwd="1", bty="n", cex=0.9,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

## 4. subplot: Global reactive power
plot(hpcPlotData$Global_reactive_power, 
     main="", xaxt="n", type="l", cex.lab=0.9,
     xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1,1440,2881), labels=c("Thu","Fri","Sat"))

## Close device
dev.off()
par(mfrow=c(1,1))
