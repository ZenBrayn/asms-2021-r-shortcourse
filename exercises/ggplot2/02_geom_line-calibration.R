# ASMS Short Course R::ggplot2
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in data
d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
    read_rds() %>%
    filter(Replicate != "FOXN1-GST")

# generate a linear model
model_lm <- lm(d_cal$Quant_Value ~ d_cal$Ratio_To_Standard)

# extract modeling parameters
model_lm_summary <- model_lm %>% summary()
model_slope <- model_lm_summary$coefficients[2]
model_intercept <- model_lm_summary$coefficients[1]
model_fit_r2 <- model_lm_summary$r.squared

# Objectives
# plot  Quant_Value ~ Ratio_To_Standard 
# - points
# - add a regression line (use cheatsheet)
# - add an annotation (use cheatsheet)

# Challenge
# - add a title (use cheatsheet, or web)
# - store plot as a variable
# - save the plot
