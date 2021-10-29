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

# plot the data with the linear regression model
p_cal <- d_cal %>%
    ggplot(aes(Ratio_To_Standard, Quant_Value)) + 
    geom_point(size=3) +
    
    # draw the linear regression
    # geom_smooth(method="lm", fill=NA, color="black", size=1) +
    geom_abline(slope = model_slope,
                intercept = model_intercept,
                color='red') +
    
    # add a title
    ggtitle("IEAIPQIDK GST-tag", 
            "Calibration Curve") +
    
    # add regression stats
    annotate("label", x=-Inf, y=Inf,
             hjust=0, vjust=1,
             label = paste0("r.squared: ", 
                            signif(model_fit_r2, 3)) )

plot(p_cal)

ggsave('./plots/02_calibration.pdf', p_cal, width=5, height=4)
