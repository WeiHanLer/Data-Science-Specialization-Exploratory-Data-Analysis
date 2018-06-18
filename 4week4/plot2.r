library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<- subset(NEI, fips=="24510")
aggregatevalue<-aggregate(Emissions~year,baltimore,sum)

png('plot2.png')
barplot(height=aggregatevalue$Emissions, names.arg=aggregatevalue$year, xlab="Years",
        ylab=expression('Total Emissions'),
        main=expression('Total Emissions in Baltimore by Years'))
dev.off()