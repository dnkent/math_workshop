# R figure for limits
library(ggplot2)

limit <- ggplot(data.frame(x = c(-5, 5)), aes(x)) + 
    stat_function(fun = ~ (.x + 10)/.x) + 
    hrbrthemes::theme_ipsum_rc(
        axis_title_size = 16,
        base_size = 14
    ) 

ggsave("limit.pdf", limit, device = cairo_pdf)