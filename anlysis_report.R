# report making 
#misk class
# 04.10.2020

library(tidyverse)

data(chickwts)


chickwts %>% 
  group_by(feed) %>% 
  summarise(n = n(),
           avrage = mean(weight),
           SD = sd(weight))


chickwts %>% 
  ggplot( aes ( x=feed , y=weight) ) + geom_boxplot()

chickwts %>% 
  ggplot( aes ( x=feed , y=weight)) +
  geom_jitter() +
  stat_summary(fun.data = mean_sdl, # add the mean and the Std. Dev.
               fun.args = list(mult = 1),  # Add onlye 1 std. Dev.
               col = "red") 
#  geom_point(position = position_jitter(seed = 136)) +

chick_lm <- lm( weight ~ feed , data = chickwts)


chick_lm %>% 
  anova()

TukeyHSD(aov( weight ~ feed , data = chickwts))

