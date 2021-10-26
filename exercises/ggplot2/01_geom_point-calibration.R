# ASMS Short Course R::ggplot2
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
# https://ggplot2.tidyverse.org/reference/ggtheme.html
theme_set(theme_bw())

# read in data
d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
    read_rds()


# Objectives
# plot Quant_Value ~ Replicate
# - red points
# - blue lines
# - increase point size, layer on top, make transparent

# Challenge
# - add a title (use cheatsheet, or web)
# - store plot as a variable
# - generate the plot from the variable
# - save the plot
