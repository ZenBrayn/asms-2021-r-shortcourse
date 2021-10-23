
# This script goes through the dplyr data example
# shown in "Data Manipulation & Pipelines with dplyr" slide deck
#
#

# Load the tidyverse core packages ====
# These examples use the tidyverse set of packages
library(tidyverse)


# Below is a recap of what we did to get to the
# long form of the student exam data
# This time, we'll use %>% throughout

# Load the data table ====
#
# We use the function read_csv which is from the
# readr package in the tidyverse.  This is preferred
# compared to the base package function read.csv,
# though both do very similar things (i.e. read the data)
dat <- read_csv("data/ex1_tbl.csv")
dat

# Pivot the data longer ====
# Pull all the exams, currently in many columns, into a single column
dat_long <- dat %>% 
  pivot_longer(cols = 2:7,  names_to = "exam", values_to = "score")

dat_long


# Separate the scores ====
# need to use the long form data
dat_tidy <- dat_long %>%
  separate(score, into = c("points", "total"), sep = " / ", convert = TRUE)

dat_tidy

# Compute percentage correct ====
dat_pct <- dat_tidy %>%
  mutate(pct_correct = points / total)

dat_pct

# Combine all of the steps above into a single pipeline ====
dat_pct_v2 <- dat %>% 
  pivot_longer(cols = 2:7,  names_to = "exam", values_to = "score") %>%
  separate(score, into = c("points", "total"), sep = " / ", convert = TRUE) %>%
  mutate(pct_correct = points / total)


# Pipeline example 1 ====
# 1. compute percent correct
# 2. get only the scores with percent correct > 90%
# 3. sort the results by percent correct
dat_pipeline_1 <- dat_tidy %>%
  mutate(pct_correct = points / total) %>%
  filter(pct_correct > 0.9) %>%
  arrange(pct_correct)

dat_pipeline_1


# Pipeline example 2 ====
# 1. compute percent correct
# 2. for each student...
# 3. compute min, max, mean percent correct
dat_pipeline_2 <- dat_tidy %>%
  mutate(pct_correct = points / total) %>%
  group_by(Name) %>%
  summarize(min_score = min(pct_correct),
            max_score = max(pct_correct),
            mean_score = mean(pct_correct))

dat_pipeline_2
