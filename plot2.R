## Creates a PNG-file in the working dirctory 
## with a plot of the 'Global Active Power'.
## 
## Output filename: "plot2.png"

## Read the data, the extracted data file is assumed to be in the working directory
## and seclect the subset, which is relevant for the plot
hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, na.strings="?", sep=";",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric","numeric"))

hpcPlotData <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

## Open device, 
## create plot and
## close device
png("plot2.png")

plot(hpcPlotData$Global_active_power, 
     main="", xlab="", xaxt="n", type="l", cex.lab=0.9,
     ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"))

dev.off()
