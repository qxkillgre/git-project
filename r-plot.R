r <- rnorm(1000)
r<-hist(r, col = "red")

library(ggplot2)
ggsave("r.png", width = 7, height =5)