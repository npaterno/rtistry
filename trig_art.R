library(ggplot2)
library(dplyr)
library(ggdark)

seq(-10, 10, by = 0.05) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot()+
  geom_point(aes(x = x^2+x*y^2-1,
                 y = -y+x/4-cos(x),
                 color = x),
             shape = 20, 
             alpha = 0.05,
             size = 1,
             na.rm = TRUE)+
  dark_theme_void()+
  scale_color_viridis_c(option = "turbo")+
  guides(color = "none")

ggsave(here::here("images/random_1.png"))
