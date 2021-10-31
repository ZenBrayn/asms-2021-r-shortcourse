#
# Exercise: dplyr pipeline
#

# Input data summary
#
# MS data were collected on 10 samples.
# These samples were measured on two different
# MS instruments with 3 replicates each.  
# Each MS run quantified 100 different analytes.
#
# Summary:
# 10 samples
# 2 MS instruments
# 3 replicate measurements
# 100 measured analytes
#


# Step 0: Load the tidyverse package
library(tidyverse)




# Step #1: Read in the data file: example_data.csv
dat <- read_csv("data/example_data.csv")




# Step #2: Consider the following task (but don't do it yet):
# Compute the mean, standard deviation, and CV for each analyte across all the runs
#
# The "for each" statement above implies needing to group by analyte.
# Does a (single) column specifying all the analytes exist in the current data?
#  Hint -- is there one column that has all the analyte names as value?
# A: No, all of the analytes are spread out across multiple columns
# Is the data in the right form?
#  Hint -- think about pivoting
# A: No, the data is in wide format, and we need to get to longer format





# Step #3: Make a new column called analyte using pivoting
#  Hint -- does the data table need to become wider or longer?
dat_long <- dat %>%
  pivot_longer(cols = 3:102, names_to = "analyte", values_to = "intensity")




# Step #4: Make a dplyr pipeline to complete this task:
# Compute the mean, standard deviation and CV for each analyte across all the runs
#  Hint -- you'll need to use group_by followed by summarize
#  Hint -- other functions you'll need: mean, sd
#  Hint -- there is no CV function but you can compute it as standard deviation / mean
dat_cv <- dat_long %>%
  group_by(analyte) %>%
  summarize(mean_intensity = mean(intensity),
            sd_intensity = sd(intensity),
            cv_intensity = sd(intensity) / mean(intensity))




# Step #5 (Challenge): 
#   Compute analyte summaries within the samples, and within samples and instruments
#   Hint -- Recall the separate exercise
#   Hint -- you can group_by more than one variable at a time

# Notes on the solutions below: 
# We can add the separate command to the pipeline and use
#   the new variables that are created in subsequent steps.
# The n() function just returns the number of rows in the group
#   and is useful to see how many values went into the summary
dat_cv_samps <- dat_long %>%
  separate(file_name, into = c("sample_id", "replicate"), sep = "_") %>%
  group_by(analyte, sample_id) %>%
  summarize(n = n(),
            mean_intensity = mean(intensity),
            sd_intensity = sd(intensity),
            cv_intensity = sd(intensity) / mean(intensity)) %>%
  ungroup()


dat_cv_samps_instr <- dat_long %>%
  separate(file_name, into = c("sample_id", "replicate"), sep = "_") %>%
  group_by(analyte, sample_id, ms_instr) %>%
  summarize(n = n(),
            mean_intensity = mean(intensity),
            sd_intensity = sd(intensity),
            cv_intensity = sd(intensity) / mean(intensity)) %>%
  ungroup()






