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

p_box <- d_trc %>%
    # reorder the isotope-label, same as before
    mutate(IsotopeLabelType = fct_reorder(IsotopeLabelType, desc(IsotopeLabelType))) %>%
    ggplot(aes(FragmentIon, TotalArea)) + 
    geom_boxplot(aes(fill = IsotopeLabelType)) + 
    scale_y_log10() +
    scale_fill_brewer(palette="Set1") +
    ggtitle("IEAIPQIDK GST-tag", 
            "Replicate Comparison") 

plot(p_box)

# save plot
ggsave("./plots/05_geom_boxplot.pdf", p_box, 
       width = 10, height = 4)
