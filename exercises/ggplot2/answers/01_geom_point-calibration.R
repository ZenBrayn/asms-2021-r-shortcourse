# ASMS Short Course R::ggplots
# Jeff Jones
# 2020-04-21

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
# https://ggplot2.tidyverse.org/reference/ggtheme.html
theme_set(theme_bw())

# read in data
d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
    read_rds()

# plot x axis is a character 
p_cal <- d_cal %>% 
    filter(Replicate != "FOXN1-GST") %>% 
    mutate(Replicate = as.numeric(Replicate)) %>%
    ggplot(aes(Replicate, Quant_Value)) + 
    geom_line(color='blue') +
    geom_point(color='red', size=5, alpha=.8) +
    ggtitle("Calibration Data", "points and lines")

plot(p_cal)

ggsave('./plots/01_points-lines.pdf', plot = p_cal, width=5, height=4)
