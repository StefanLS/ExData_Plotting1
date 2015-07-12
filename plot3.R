## Creates a PNG-file in the working dirctory 
## with a plot of the submeter measurements.
## 
## Output filename: "plot3.png"

## Read the data, the extracted data file is assumed to be in the working directory
## and seclect the subset, which is relevant for the plot
hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, na.strings="?", sep=";",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric","numeric"))

hpcPlotData <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

## Open device, 
## create plot with several lines and a legend and
## close device
png("plot3.png")

plot(hpcPlotData$Sub_metering_1, cex.lab=0.9,
     type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines(hpcPlotData$Sub_metering_2, 
      col="red")
lines(hpcPlotData$Sub_metering_3, 
      col="blue")
legend("topright", lwd="1",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

dev.off()
