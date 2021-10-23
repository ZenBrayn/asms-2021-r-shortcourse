
# This script goes through the tidy data example
# shown in "Tidy Data & the Tidyverse" slide deck
#
#

# Load the tidyverse core packages ====
# These examples use the tidyverse set of packages
library(tidyverse)


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
dat_long <- pivot_longer(dat, cols = 2:7,  names_to = "exam", values_to = "score")
dat_long


# The above, but in reverse: Pivot the data back ====
# spread the individual tests back into separate columns
dat_wide <- pivot_wider(dat_long, names_from = exam, values_from = score)
dat_wide


# Separate the scores
# need to use the long form data
dat_tidy <- separate(dat_long, score, into = c("points", "total"), sep = " / ", convert = TRUE)

