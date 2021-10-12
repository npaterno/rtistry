# Load packages
library(dplyr)
library(ggplot2)
library(ggdark)

# define functions
f_1 <- function(x, y){
  x <- 0.4*x+0.2*y+0
  y <- -0.2*x+0.4*y+0
  return(c(x,y))
}

f_2 <- function(x, y){
  x <- 0.4*x+0.2*y+0
  y <- -0.2*x+0.4*y+1
  return(c(x,y))
}

f_3 <- function(x, y){
  x <- 0.4*x+0.2*y-1
  y <- -0.2*x+0.4*y+0
  return(c(x,y))
}

f_4 <- function(x, y){
  x <- 0.4*x+0.2*y+1
  y <- -0.2*x+0.4*y+0
  return(c(x,y))
}

f_5 <- function(x, y){
  x <- 0.4*x+0.2*y+0
  y <- -0.2*x+0.4*y-1
  return(c(x,y))
}

random_df <- function(x, y, n){
  # plot data frame
  df <- data.frame(x = rep(x,5*n+5), y = rep(y,5*n+5))
  # eval data frame
  eval_df <- data.frame(x = rep(x,n+2), y = rep(y,n+2))
  # loop to populate plot data frame
  for (i in 0:n){
      # eval all 5 functions and save in plot data
      df[5*i+1,] <- f_1(eval_df$x[i+1],eval_df$y[i+1])
      df[5*i+2,] <- f_2(eval_df$x[i+1],eval_df$y[i+1])
      df[5*i+3,] <- f_3(eval_df$x[i+1],eval_df$y[i+1])
      df[5*i+4,] <- f_4(eval_df$x[i+1],eval_df$y[i+1])
      df[5*i+5,] <- f_5(eval_df$x[i+1],eval_df$y[i+1])
      # randomly select one of those points
      eval_df[i+2,] <- df[sample((5*i+1):(5*i+5),1),]
  }
  # return plot data only
  return(df)
}

rdf <- random_df(0,0,499)

ggplot(rdf, aes(x = x, y = y))+
  geom_point()+
  theme_void()
