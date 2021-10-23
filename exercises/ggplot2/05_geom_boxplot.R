# ASMS Short Course R::ggplots
# Jeff Jones
# 2020-04-21

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() 


# Objectives
# - create a box-plot .. TotalArea ~ FragmentIon 
# - color by IsotopeLabelType
# - dplyr mutate IsotopeLabelType fct_reorder::desc
# - modify the color palette
# - modify the y-axis to log10 scale  (two ways to do this)
# - add a title
# - store plot as a variable
# - save the plot

# Challenge
# - facet each FragmentIon
# - modify facets such that each has an independent x,y axis

