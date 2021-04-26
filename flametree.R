library(flametree)

flametree_grow(seed = 213, 
               time = 10, 
               scale = c(0.5, 1.5),
               angle = c(-30, 10),
               split = 2,
) %>% 
  flametree_plot(
    palette = c("cadetblue",
                "blue",
                "cyan",
                "darkslateblue")
) %>% 
  flametree_save(filename = "ice_trees.png")

#Try below on desktop with time =12 and split = 4
flametree_grow(
  seed = 2021,
  time = 10,
  scale = c( 0.6, 0.8, 2),
  angle = c(-30, 60),
  split = 2,
  trees = 3,
  shift_x = spark_decay(),
  shift_y = spark_linear()
) %>% 
  flametree_plot(
    palette = c("cyan"),
    style = "plain"
  ) %>% 
  flametree_save(filename = "test.png")

flametree_grow(
  time = 8,
  trees = 6,
  split = 2,
  shift_x = spark_random(multiplier = 5),
  seg_col = spark_linear(tree =2, time = 1)
  ) %>% 
  flametree_plot(
    palette = c("#801100", "#B62203", "#D73502", "#FC6400", "#FF7500", "#FAC000")  
    ) %>% 
  flametree_save(filename = "burn.png")
