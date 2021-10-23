# ASMS Short Course R::ggplots
# Jeff Jones
# 2020-04-21

library(tidyverse)


# CALIBRATION DATA #####################
# read in data
d_cal <- "./data/raw/samples_1-8_heavy-light_calibration.csv" %>%
    read_csv()

# replace spaces in the column names
names(d_cal) <- str_replace_all(names(d_cal), " ", "_")

# extract normalized area
d_cal <- d_cal %>%
    separate(Quantification, into=c("Quant_Label", "Quant_Value"), 
             sep=": ", convert = TRUE)

saveRDS(d_cal, "./data/rds/samples_1-8_heavy-light_calibration.rds")


# TRACES DATA ##########################
d_trc <- "./data/raw/samples_1-8_heavy-light_traces.tsv" %>%
    read_tsv()

# tidy the data 
d_trc <- d_trc %>%
    separate(FileName, sep = "[\\.|\\_]", into=c('STD','Replicate','Raw'), remove = FALSE) %>%
    select(-c('STD','Raw')) %>%
    mutate(Replicate = as.numeric(Replicate)) %>%
    separate_rows(Times, Intensities, sep = ",", convert = TRUE) %>%
    rename(times = Times,
           intensities = Intensities) %>%
    nest(data = c(times, intensities)) %>%
    rename(mrm_trace = data)

saveRDS(d_trc, "./data/rds/samples_1-8_heavy-light_traces.rds")
