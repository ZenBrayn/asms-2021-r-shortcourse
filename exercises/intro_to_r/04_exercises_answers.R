### this exercise section will incorporate most of the things we have seen to in this course using an example weather dataset

# Step 0: Read in the dataset .csv
# this csv contains climate data for Denver, Colorado between 2016-2019
clim_df <- read.csv("data/denver_climate.csv")

# examine the structure of the data.frame to learn about variable names
head(clim_df)
colnames(clim_df)
str(clim_df)
View(clim_df)
nrow(clim_df)
ncol(clim_df)

# Exercise 1: Find the month and year with the highest snowfall
max_snowfall_idx <- clim_df$snowfall == max(clim_df$snowfall)
clim_df[max_snowfall_idx,]

# April 2016 saw big snowfall (google it for details!)
# a nice drop in function for this...
which.max(clim_df$snowfall)
# used like this can be a simpler syntax
clim_df[which.max(clim_df$snowfall),]

# Exercise 2: Find months where there was no snowfall
zero_snow_idx <- clim_df$snowfall == 0
clim_df[zero_snow_idx,]

# Exercise 3: Find average precipitation per year
table(clim_df$year)

# we have 2016,2017,2018,2019
# another handy function...
unique(clim_df$year)

avg_precip_2016 <- mean(clim_df$precipitation[clim_df$year == 2016])
avg_precip_2017 <- mean(clim_df$precipitation[clim_df$year == 2017])
avg_precip_2018 <- mean(clim_df$precipitation[clim_df$year == 2018])
avg_precip_2019 <- mean(clim_df$precipitation[clim_df$year == 2019])

# 2018 was the lowest of these years

# the tidyverse makes this sort of operation extremely easy and possible in 2 lines of code...
# preview:
library(dplyr)
clim_df %>%
  group_by(year) %>%
  summarize(avg_precip = mean(precipitation))

# this also returns a tibble (tidyverse data.frame) that allows further operation..

# you can further do similar calculations accross all variables
clim_df %>%
  group_by(year) %>%
  summarize(mean_precip = mean(precipitation),
            mean_snowfall = mean(snowfall))

# Exercise 4: Convert temperatures to Celcius and add new columns with these to data.frame

# F to C conversion -> (F - 32) * (5/9)
# order of operations is important!
clim_df$max_temp_C <- (clim_df$max_temp - 32) * 5/9
clim_df$min_temp_C <- (clim_df$min_temp - 32) * 5/9

# we may wish to round these to sig. fig.
clim_df$max_temp_C <- round((clim_df$max_temp - 32) * 5/9,1)
clim_df$min_temp_C <- round((clim_df$min_temp - 32) * 5/9,1)

# Exercise 5: Find the month with the greatest difference between max and min temperature

max_min_diff <- clim_df$max_temp - clim_df$min_temp
clim_df[max_min_diff == max(max_min_diff),]

# Exercise 6: write updated .csv of the data.frame with C data

write.csv(clim_df, "data/denver_climate_withC.csv")