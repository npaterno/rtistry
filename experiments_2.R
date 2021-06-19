library(ggplot2)
library(dplyr)
library(ggdark)

seq(-10,10,0.05) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot() +
  geom_point(aes(x = x^2+y^2+x+y, y = x*sin(y), color = sin(x)-cos(y)),
             alpha = 0.1, shape = 20, size = 0) +
  scale_color_viridis_c(option = "turbo") +
  dark_theme_void() + 
  guides(color = FALSE)

ggsave(here::here("images/conic_wave_twitter.png"))
