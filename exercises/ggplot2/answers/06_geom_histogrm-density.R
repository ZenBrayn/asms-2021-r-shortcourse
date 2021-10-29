# ASMS Short Course R::ggplot2
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% readRDS()

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() %>%
    separate(FileName, sep = "[\\.|\\_]", into=c('STD','Replicate','Raw')) %>%
    select(-c('STD','Raw')) %>%
    inner_join(d_cal, by='Replicate') %>%
    mutate(Replicate = as.numeric(Replicate))


p_hist <- d_trc %>%
    ggplot(aes(TotalArea)) +
    geom_histogram(binwidth = .2) +
    scale_x_log10() +
    scale_fill_brewer(palette="Set1") +
    ggtitle("IEAIPQIDK GST-tag", "Distribution of TotalArea")

plot(p_hist)

p_dens <- d_trc %>%
    ggplot(aes(TotalArea, fill=FragmentIon)) +
    geom_density(alpha=.5) +
    scale_x_log10() +
    facet_wrap(~IsotopeLabelType, scales='free_y') +
    scale_fill_brewer(palette="Set1") +
    ggtitle("IEAIPQIDK GST-tag", "Response Curves per Transition")

plot(p_dens)

# save plots
ggsave("./plots/06_geom_histogram.pdf", p_hist, 
       width = 5, height = 4)

ggsave("./plots/06_geom_denisty.pdf", p_dens, 
       width = 10, height = 4)
