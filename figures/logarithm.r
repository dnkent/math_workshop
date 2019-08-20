## Code for generating tikz plot logarithm with ggplot2 and tikzDevice
library(tikzDevice)
library(ggplot2)

x <- seq(0.25, 4, by = 0.001)
y <- log(x) ## natural log
dat <- data.frame(x, y)

tikz("logarithm.tex", width = 4, height = 4)
ggplot(dat, aes(x, y)) + 
    geom_line() + 
    theme_classic() +
    theme(
        axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.y = element_text(angle = 0, hjust = 0, vjust = 0.5),
        axis.title.x = element_text(hjust = 0.35)
        ) +
    scale_x_continuous(limits = c(-2, max(dat$x))) + 
    scale_y_continuous(limits = c(min(dat$y), 1.5)) +
    geom_segment(aes(x = -2, y = 0, xend = 4, yend = 0)) +
    geom_segment(aes(x = 0, y = min(dat$y), xend = 0, yend = max(dat$y))) +
    geom_segment(aes(x = 1, y = 0.05, xend = 1, yend = -0.05)) + 
    annotate("text", x = 1.75, y = -0.1, label = "$\text{log}_e1=0$") + 
    annotate("text", x = 3.5, y = 1.5, label = "$\text{log}_e=x$")
dev.off()