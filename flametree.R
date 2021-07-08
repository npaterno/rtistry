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
  flametree_save(filename = here::here("images/ice_trees.png"))

flametree_grow(
  seed = 87,
  time = 4,
  scale = c( 0.6, 0.8, 1.2),
  angle = c(-30, -15, 45, 60),
  split = 4,
  trees = 4,
  shift_x = spark_decay()
) %>% 
  flametree_plot(
    palette = c("pink", "firebrick", "purple")
  ) %>% 
  flametree_save(filename = here::here("images/dr_seuss.png"))

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
  flametree_save(filename = here::here("images/burn.png"))
