# 2.1.5 tidyverse - Tidy data
# Misk Academy Data Science Immersive, 2020

# Get a play data set:
PlayData <- read_tsv("data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation across height & width


 PlayData$height / PlayData$width

PlayData %>%
  mutate(Ratio1 = height / width)

#mean across rows, poddible but nor clear

PlayData %>%
  pivot_longer(-c(type,time), names_to = "key" , values_to = " value")

# For the other scenarios, tidy data would be a 
# better starting point: 
# Specify the ID variables (i.e. Exclude them)
playData %>%
  pivot_longer(-c(type,time), names_to = "key" , values_to = "value")


# Now try the same thing but specify the MEASURE variables (i.e. Include them)
 PlayData_t <-  PlayData %>%
  pivot_longer(c(height,width), names_to = "key" , values_to = "value")


# Scenario 2: Transformation across time 1 & 2 (group by type & key)
# Difference from time 1 to time 2 for each type and key (time2 - time1)
# we only want one value as output

PlayData_t %>%
  group_by(type , key) %>%
  summarise(timediff = value[time == 2] - value [time ==1])

# As another example: standardize to time 1 i.e time2/time1

PlayData_t %>%
  group_by(type,key) %>%
  summarise( timeratio = value[time==2] / value[time==1])

# Keep all values we use mutate

PlayData_t %>%
  group_by(type,key) %>%
  mutate( timeratio = value[time==2] / value[time==1])


# Scenario 3: Transformation across type A & B
# Ratio of A/B for each time and key

PlayData_t %>% 
  group_by(key,time) %>% 
  summarise( keyratio = value[type=="A"]/value[type=="B"]) 
  
