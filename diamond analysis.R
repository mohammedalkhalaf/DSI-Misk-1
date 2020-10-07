# Diamond Analysis
# Rick Scavetta
# 29.09.2020
# A small case study for EDA and stats

# load packages
library(tidyverse)

# Read in the data (csv format):
# Newer methods from tidyr package
jems <- read_csv("data/diamonds.csv")

# super convenient way
# library(rio) # R i/o
# jems2 <- import("data/diamonds.csv")

# Get familiar with our data:
summary(jems)
names(jems)
glimpse(jems)

# more detail:
#attributes(jems)
#typeof(jems)
#names(jems$cut>=1)


#clarity_if <- nrow(jems %>%
 #         filter(clarity== "IF"))
#clarity_if

#clarity_notif <- nrow(jems %>%
 #                       filter(clarity != "IF"))
#clarity_notif

#clarity_per <- (clarity_if/(clarity_notif + clarity_if))*100
#clarity_per



clarity_if <- jems %>%
  filter(clarity== "IF") %>%
  nrow()

# [0,1]
clarity_if/nrow(jems)

total <- jems %>%
  nrow(clarity)
total

jems %>%
  count(clarity)

jems %>%
  group_by(clarity) %>%
  count() %>%
  mutate(prop = n/nrow(jems))

range(jems$price)

mean(jems$price)

hellomohammed <- jems%>%
  group_by(cut,color) %>%
  summarise(avg=mean(price))

ggplot(jems, aes(x=jems$carat , y=jems$price)) + geom_line()

ggplot(jems, aes(x=carat_log10, y=price_log10)) + geom_jitter()

jems <- jems %>%
  mutate(carat_log10 = log10(carat),
         price_log10 = log10(price))

jems_lm <- lm(price_log10 ~ carat_log10, data = jems)
jems_lm

ggplot(jems, aes( x = carat_log10, y = price_log10)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE ,colour = "pink")

