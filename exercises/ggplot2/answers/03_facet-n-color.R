# ASMS Short Course R::ggplot2
# Jeff Jones

library(tidyverse)
library(ggplot2)


# set the theme to black-white (remove grey plot area)
theme_set(theme_bw())

# read in data
d_trc <- "./data/rds/samples_1-8_heavy-light_traces.rds" %>% 
    read_rds() 

# Final plot
p_trc <- 
    d_trc %>% 
    # color by isotope-label
    ggplot(aes(Replicate, TotalArea, color=IsotopeLabelType)) + 
    geom_point() + 
    geom_line() +
    
    # facet by transition
    facet_wrap(~FragmentIon, nrow=1) +
    
    # scale by log10
    scale_y_log10() +
    
    # use bolder colors
    scale_color_brewer(palette="Set1") +
    
    # ggplot like to be efficent, lets add back all rep labels
    scale_x_continuous(breaks=1:8) +
    ggtitle("IEAIPQIDK GST-tag", "Response Curves per Transition")

plot(p_trc)

# save plot
ggsave("./plots/03_response-curves.pdf", p_trc, 
       width = 10, height = 4)
