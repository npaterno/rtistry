library(ggplot2)
library(flametree)

plot <- flametree_grow(seed = 213, 
                       time = 6, 
                       scale = c(0.25, 0.50, 0.75, 1.0, 1.5),
                       angle = c(-30, -15, 10, 20),
                       split = 3,
                       trees = 4,
                       shift_x = spark_linear(tree = 4),
                       shift_y = spark_linear(tree = 3)
) %>% 
  flametree_plot(
    palette = c("cadetblue",
                "blue",
                "cyan",
                "darkslateblue")
  )

plot+coord_polar()

ggsave(here::here("images/polar_1.png"))

# round 2
plot <- flametree_grow(seed = 808, 
                       time = 8, 
                       scale = c(0.25, 0.50, 0.75, 1.0, 1.5),
                       angle = c(-30, -15, 10, 20),
                       split = 4,
                       trees = 3,
                       shift_x = spark_random(constant = 1),
                       shift_y = spark_random(constant = 2)
) %>% 
  flametree_plot(
    palette = c("snow1",
                "snow2",
                "snow3",
                "snow4")
  )

plot+coord_polar()

