# ASMS Short Course R::ggplot2
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

d_trcs <- d_trc %>% unnest(mrm_trace)


# Objectives 
# - plot the calibration curves for each FragmentIon

# Hints
# - filter to max intensity per Replicate, FragmentIon, IsotopeLabelType, Quant_Value
# - create a function 
# --  takes an input tibble
# --  outputs a tibble of regression data (will be a 1 row table)
# - employ the broom library
# --  nest the data and map our function 
# - utilize geom_text and model data to add regression stats

# Challenge
# - re-plot and model using log10 Quant_Value
# - note y4 and y6 fail the regression here yet passed in the previous example  