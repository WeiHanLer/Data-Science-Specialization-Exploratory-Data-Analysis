library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

twocities<-subset(NEI,(fips=="24510"|fips=="06037") & type=="ON-ROAD")
aggregatevalue<-aggregate(Emissions~year+fips,twocities,sum)

png("plot6.png")
plot <- ggplot(aggregatevalue, aes(factor(year), Emissions))
plot <- plot + facet_grid(.~fips)
        plot + geom_bar(stat="identity")  +
        xlab("Year") +
       ylab(expression('Total Emissions')) +
       ggtitle('Total Emissions from motor vehicle in Baltimore vs Los Angeles over the years')

dev.off()