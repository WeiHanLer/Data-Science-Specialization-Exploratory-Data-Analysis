library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<- subset(NEI, fips=="24510" & type="ON-ROAD")
aggregatevalue<-aggregate(Emissions~year+type,baltimore,sum)

png("plot5.png")
plot <- ggplot(aggregatevalue, aes(factor(year), Emissions))
        plot + geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression('Total Emissions')) +
        ggtitle('Total Emissions from motor vehicle in Baltimore by year')
 
dev.off()