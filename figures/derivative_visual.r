# R figure for derivatives
library(ggplot2)

straight_line <- ggplot(data.frame(x = c(-5, 5)), aes(x)) + 
    stat_function(fun = ~ 5*.x) + 
    hrbrthemes::theme_ipsum_rc(
        axis_title_size = 16,
        base_size = 14
    ) +
    labs(
        x = "x",
        y= "f(x)",
        title = "f(x) = 5x"
    )

straight_derivative <- ggplot(data.frame(x = c(-5, 5)), aes(x)) + 
    stat_function(fun = ~ 5, linetype = "dashed") + 
    hrbrthemes::theme_ipsum_rc(
        axis_title_size = 16,
        base_size = 14
    ) +
    labs(
        x = "x",
        y= "f'(x)",
        title = "f'(x) = 5"
    )

cubed <- ggplot(data.frame(x = c(-5, 5)), aes(x)) + 
    stat_function(fun = ~ 2*.x^4) + 
    hrbrthemes::theme_ipsum_rc(
        axis_title_size = 16,
        base_size = 14
    ) +
    labs(
        x = "x",
        y= "f(x)",
        title = "f(x) = 2x^4"
    )

cubed_derivative <- ggplot(data.frame(x = c(-5, 5)), aes(x)) + 
    stat_function(fun = ~ 8*.x^3, linetype = "dashed") + 
    hrbrthemes::theme_ipsum_rc(
        axis_title_size = 16,
        base_size = 14
    ) +
    labs(
        x = "x",
        y= "f'(x)",
        title = "f'(x) = 8x^3"
    )



deriv_grid <- cowplot::plot_grid(
    straight_line,
    straight_derivative,
    cubed,
    cubed_derivative,
    ncol = 2
    )



ggsave(
    "derivs.pdf", 
    deriv_grid, 
    device = cairo_pdf, 
    height = 10,
    width = 10,
    units = "in"
    )