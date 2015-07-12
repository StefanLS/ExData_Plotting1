## Creates a PNG-file in the working dirctory 
## with a histogram of the 'Global Active Power'.
## 
## Output filename: "plot1.png"

## Read the data, the extracted data file is assumed to be in the working directory
## and seclect the subset, which is relevant for the plot
hpc <- read.table("household_power_consumption.txt",
                header=TRUE, na.strings="?", sep=";",
                colClasses=c("character","character","numeric","numeric",
                             "numeric","numeric","numeric","numeric","numeric"))

hpcPlotData <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

## Open device, 
## create histogram and
## close device
png("plot1.png")

hist(hpcPlotData$Global_active_power, 
     col="red", cex.lab=0.9,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
