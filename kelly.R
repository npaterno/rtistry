# Load packages
library(ggplot2)
library(dplyr)

# Generate random data frame
df <- data.frame(expand.grid(0:39, 0:39))

# Generate colors
clrs = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
plot_clrs = sample(clrs, 18)


# Test plot
kelly <- function(first, second){
  ggplot(df)+   
  geom_rect(aes(xmin = first, xmax = first+1, ymin = second, ymax = second+1), fill = plot_clrs[runif(1, min=1, max=18)])
}

purrr::pwalk(expand.grid(1:2,1:2),~kelly(.x, .y))

