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

p_trc <- d_trc %>% 
    group_by(Replicate, IsotopeLabelType) %>%
    # sum up the peak-areas for each transition
    summarize(PeakAreaSum = sum(TotalArea)) %>%
    ungroup() %>%
    mutate(IsotopeLabelType = fct_reorder(IsotopeLabelType, desc(IsotopeLabelType))) %>%
    # 
    ggplot(aes(Replicate, PeakAreaSum, fill=IsotopeLabelType)) + 
    # set the statistic to identity and position to dodge
    geom_bar(stat='identity', position='dodge') + 
    # pretty up the graph and add a title
    scale_fill_brewer(palette="Set1") +
    scale_x_continuous(breaks=1:8) +
    ggtitle("IEAIPQIDK GST-tag", 
            "Peak Areas - Replicate Comparison")

plot(p_trc)

# save plot
ggsave("./plots/04_replicate-comparison.pdf", p_trc, 
       width = 5, height = 4)
