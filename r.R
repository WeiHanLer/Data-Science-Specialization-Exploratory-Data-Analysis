library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


aggregatevalue<-aggregate(Emissions~year,NEI,sum)

png('plot1.png')
barplot(height=aggregatevalue$Emissions, names.arg=aggregatevalue$year, xlab="Years",
        ylab=expression('Total Emissions'),
        main=expression('Total Emissions by Years'))
dev.off()

  