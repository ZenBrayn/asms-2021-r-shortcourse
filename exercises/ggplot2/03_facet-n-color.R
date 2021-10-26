# ASMS Short Course R::ggplot2
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() 


# Objectives
# - create a point & line plot .. TotalArea ~ Replicate
# - color by IsotopeLabelType
# - facet by FragmentIon
# - modify the y-axis to log10 scale  (two ways to do this)
# - modify the color palette
# - add a title
# - store plot as a variable
# - save the plot

# Challenge
# - place facets on a single row
# - modify x axis to label each Replicate