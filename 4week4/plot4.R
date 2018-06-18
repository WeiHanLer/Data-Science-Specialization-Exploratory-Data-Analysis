library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Merge<-merge(NEI,SCC,by.x="SCC", by.y="SCC")

subsetcoal<- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
countrycoal<-Merge[subsetcoal,]
  
png("plot4.png")
plot <- ggplot(countrycoal, aes(factor(year), Emissions))
        plot + geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression('Total Emissions')) +
        ggtitle('Total Emissions from coal sources by year')

dev.off()