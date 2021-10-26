# ASMS Short Course R::ggplot
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in calibration data (use for labeling)
d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
  read_rds()

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds()

# unnest the MRM trace data
d_trcs <- d_trc %>% unnest(mrm_trace)


# Objectives
# - create a plot of all traces .. intensities ~ times 
# - mutate data to filter x-var data to 21 +/- 2 min
# - color by IsotopeLabelType
# - modify the color palette
# - facet Replicates horizontal & FragmentIon verticle
# - modify facets such that rows have an independent y axis
# - add a title
# - store plot as a variable
# - save the plot

# Challenge
# - create a faceted plot where each trace has an independant y axis
# -- hint, use dplyr to create a new character varaiable
