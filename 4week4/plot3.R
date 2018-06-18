library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<- subset(NEI, fips=="24510")
aggregatevalue<-aggregate(Emissions~year+type,baltimore,sum)

png("plot3.png")
plot <- ggplot(aggregatevalue, aes(x=year, y=Emissions, color = type))
  plot + geom_line() +
  xlab("year") +
  ylab(expression('Total Emissions')) +
  ggtitle('Total Emissions in Baltimore by year and type of emission')

dev.off()