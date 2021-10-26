# ASMS Short Course R::ggplot
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
  read_rds()

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() 


# Objectives
# - create a histogram plot .. TotalArea 
# - adjust the binwidth to a suitable value
# - fill by IsotopeLabelType
# - add a title
# - store plot as a variable
# - save the plot


# Objectives
# - create a density estimation plot .. TotalArea 
# - fill by FragmentIon
# - facet by IsotopeLabelType
# - modify facets such that each has an independent x,y axis
# - alpha blend densities to show overlap
# - add a title
# - store plot as a variable
# - save the plot
