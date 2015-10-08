#removing stuff > rm(list=setdiff(ls(), "dd"))

library(ggplot2)
library(limma)
library(reshape)
#setwd("C://Users//jimc//Desktop//ShinyLimmaWorkspace//data_shinyLimma")
#x <- read.ilmn(files = "LRawReport.txt", ctrlfiles = "ControlProbelimma.txt" )
#newData = normalizeBetweenArrays(x, method = "cyclicloess", cyclic.method = "fast")

#y <- (melt(x$E))

#Create a boxplot that includes outliers
#p0 <- ggplot(y, aes(x = (X2), y = value)) + geom_boxplot(aes(fill = X2))

#Compute upper and lower whiskers
#ylim = boxplot.stats(y$value)$stats[c(1,5)]

#Don't let GGplot compute it's own statistics.
#p1= p0 + coord_cartesian(ylim = ylim*1.05)

#ggsave(filename = "Hopefully2.png")

########DENSITY PLOT VERSION##########
###Rough draft? 

densityPlotter <- function(rawLimma){
  y <- melt(rawLimma$E)
  p2 <- ggplot(y, aes(x = value)) + geom_density( aes(group = X2, colour = X2), adjust=10) + xlim(0, 300)
  p2 <- p2 + labs(title = "Density of Probe Values")
  p2 <- p2 + labs(x = "Probes", y = "Density")
  p2 <- p2 + theme(legend.position= "none") + theme(plot.title = element_text(size = rel(1.3)))
  return (p2)
}

#p2 <- ggplot(y, aes(x = value)) + geom_density( aes(group = X2, colour = X2), adjust=10) + xlim(0, 500)
#p2
#ggsave(filename = "scientificSpaghetti.png")
#Got warnings when colors were added. Huh.
#Looks exactly like the base-R version looked tho.