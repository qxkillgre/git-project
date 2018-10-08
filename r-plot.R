r <- rnorm(1000)
r<-hist(r, col = "red", main = "Histogram")

library(ggplot2)
ggsave("r-red.png", width = 7, height =5)