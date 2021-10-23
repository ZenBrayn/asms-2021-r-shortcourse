# ASMS Short Course R::ggplots
# Jeff Jones
# 2020-04-21

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in calibration data (use for labeling)
d_cal <- "./data/rds/samples_1-8_heavy-light_calibration.rds" %>% 
    read_rds()

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() %>%
    separate(FileName, sep = "[\\.|\\_]", into=c('STD','Replicate','Raw')) %>%
    select(-c('STD','Raw')) %>%
    inner_join(d_cal, by='Replicate') %>%
    mutate(Replicate = as.numeric(Replicate))

d_trcs <- d_trc %>% unnest(mrm_trace)

p_trcs_1 <- d_trcs %>% 
    filter(abs(times - 21) < 2) %>%
    #
    ggplot(aes(times, intensities)) +
    geom_line(aes(color=IsotopeLabelType)) +
    scale_color_brewer(palette="Set1") +
    facet_grid(Replicate~FragmentIon, scales = 'free') +
    ggtitle("IEAIPQIDK GST-tag", "Elution Traces")

p_trcs_2 <- d_trcs %>% 
    filter(abs(times - 21) < 2) %>%
    mutate(frag_rep = paste('rep', Replicate, ' ', FragmentIon)) %>%
    #
    ggplot(aes(times, intensities)) +
    geom_line(aes(color=IsotopeLabelType)) +
    scale_color_brewer(palette="Set1") +
    facet_wrap(~frag_rep, scales = 'free', ncol=5) +
    ggtitle("IEAIPQIDK GST-tag", "Elution Traces") 

# save plots
ggsave("./plots/07_traces_1.pdf", p_trcs_1, 
       width = 10, height = 8)


ggsave("./plots/07_traces_2.pdf", p_trcs_2, 
       width = 14, height = 10)
