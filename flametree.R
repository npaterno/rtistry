library(flametree)

#First Plots 4/25/21
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

#Day two 4/26/21
flametree_grow(scale = c(0.25, 0.5, 0.75, 1),
               angle = c(-20, -10, 10, 20),
               trees = 7,
               shift_x = spark_random(multiplier = 4, constant = 3)) %>% 
  flametree_plot(
    palette = viridisLite::inferno(n = 10)
  ) %>% 
  flametree_save(filename = here::here("images/quarters_to_one.png"))

flametree_grow(scale = c(2, 4, 6, 8, 10),
               angle = c(-20, -10, 10, 20),
               trees = 7) %>% 
  flametree_plot(
    palette = viridisLite::inferno(n = 10)
  ) %>% 
  flametree_save(filename = here::here("images/twos_to_ten.png"))
