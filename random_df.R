# Load packages
library(dplyr)
library(ggplot2)
library(ggdark)

# Random df based on two matrices
random_df <- function(x, y, n){
  df <- data.frame(x = rep(x,n),y = rep(y,n), r = rep(1, n))
  
  for (i in 2:n){
    ctrl <-  sample(c(0,1), 1, replace = TRUE)
    if (ctrl == 0){ # Rotate previous point by pi/3
      df$x[i] <- df$x[i-1]*cos(pi/3)-df$y[i-1]*sin(pi/3)
      df$y[i] <- df$x[i-1]*sin(pi/3)+df$y[i-1]*cos(pi/3)
    } else{ # Shift previous point right two down three
      df$x[i] <- df$x[i-1]+2
      df$y[i] <- df$y[i-1]-3
    }
    df$r[i] <-  ctrl
  }
  df <- df %>% 
    mutate(r = as.factor(r))
  return(df)
}

rdf <- random_df(1,1,1000)

ggplot(rdf, aes(x = x, y = y, color = r))+
  geom_point()+
  scale_color_viridis_d(option = "plasma")+
  guides(color = "none")+
  dark_theme_void()

#-------------------------------------------------------------
# Random rotation and random translation
random_df_2 <- function(x, y, n){
  df <- data.frame(x = rep(x,n),y = rep(y,n), r = rep(1, n))
  
  for (i in 2:n){
    ctrl <-  sample(c(0,1), 1)
    rand1 <- sample(1:2, 1)
    rand2 <- sample(2:10, 1)
    rand3 <- sample(c(-1,1), 1)
    rand4 <- sample(c(-1,1), 1)
    if (ctrl == 0){ # Random rotation matrix
      df$x[i] <- df$x[i-1]*cos(rand1*pi/rand2)-df$y[i-1]*sin(rand1*pi/rand2)
      df$y[i] <- df$x[i-1]*sin(rand1*pi/rand2)+df$y[i-1]*cos(rand1*pi/rand2)
    } else{ # Random translation
      df$x[i] <- df$x[i-1]+rand3*rand1
      df$y[i] <- df$y[i-1]+rand4*rand2
    }
    df$r[i] <-  ctrl
  }
  df <- df %>% 
    mutate(r = as.factor(r))
  return(df)
}

rdf_2 <- random_df_2(1,1,10000)

ggplot(rdf_2, aes(x = x, y = y, color = r))+
  geom_point(alpha = 0.25)+
  scale_color_manual(values = c("#23EDFF", "#F9FF23"))+
  guides(color = "none")+
  dark_theme_void()
