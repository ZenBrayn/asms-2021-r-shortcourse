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

d_trc_cal <- d_trcs %>%
    group_by(Replicate, FragmentIon, IsotopeLabelType, Quant_Value) %>%
    summarise(max_intensities = max(intensities)) %>%
    ungroup() %>%
    spread(IsotopeLabelType, max_intensities) %>%
    mutate(Ratio_To_Standard = light/heavy)

model_trc <- function(data){
    # generate a linear model
    model_lm <- lm(data$Quant_Value ~ data$Ratio_To_Standard)
    
    # examine the model
    model_lm_summary <- model_lm %>% summary()
    
    tibble(
        intercept = model_lm_summary$coefficients[1],
        slope = model_lm_summary$coefficients[2],
        r.squared = model_lm_summary$r.squared,
        adj.r.squared = model_lm_summary$adj.r.squared
    )
}

library(broom)

d_trc_cal_mdl <- d_trc_cal %>%
    group_by(FragmentIon) %>%
    nest(data = -FragmentIon) %>%
    mutate(model_lm = map(data, model_trc)
    ) %>%
    ungroup() %>%
    unnest(model_lm)


# plot the data with the linear regression model
p_trc_cal <- d_trc_cal %>% 
    ggplot(aes(Ratio_To_Standard, Quant_Value)) + 
    geom_point() +
    geom_abline(
        data = d_trc_cal_mdl,
        aes(slope = slope,
            intercept = intercept),
        color='red') +
    # add a title
    ggtitle("IEAIPQIDK GST-tag", "Calibration Curve") +
    # add regression stats
    geom_text(data = d_trc_cal_mdl,
              x = -Inf, y = Inf,
              hjust = -0.1, vjust = 1.1,
              aes(label = paste0("R^2: ", signif(r.squared, 3), "\n",
                                 "R^2 adj: ", signif(adj.r.squared, 3)))) +
    facet_wrap(~FragmentIon, nrow=3)


# save the plots
ggsave("./plots/08_cal_curves.pdf", p_trc_cal, 
       width = 8, height = 8)
