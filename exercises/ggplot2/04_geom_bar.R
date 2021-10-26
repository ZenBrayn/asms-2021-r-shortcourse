# ASMS Short Course R::ggplot
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() 


# Objectives
# - create a bar plot .. PeakAreaSum ~ Replicate
# - color by IsotopeLabelType
# - modify the color palette
# - dplyr create PeakAreaSum from TotalArea (need group_by)
# - dplyr mutate IsotopeLabelType fct_reorder::desc
# - geom_bar modify stat and position
# - add a title
# - store plot as a variable
# - save the plot

# Challenge
# - modify x axis to label each Replicate (2 ways to do this)
# - move the ledgend inside the plot area (use web)
# - remove the axis lines in plot area (ie. theme)
