#
# Exercise: separating data
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



# Step #2: Review the input data
# Which (single) column in the data appears to have multiple pieces of data in it?
#   Hint -- it's one of the first columns
# A: the file_name column contains two pieces of data
# What are these pieces?
# A: A sample ID and a replicate number
# How are those pieces separated?  What's the character used?
# A: the underscore character, _.  We will use this in the separate command next.
unique(dat$file_name)




# Step #3: Separate the data into multiple columns
#  Hint -- look at the examples in tidy_data_example.R 
dat_sep <- dat %>%
  separate(file_name, into = c("sample_id", "replicate"), sep = "_")




# Step #4: By default, the original column is not kept after separating. How to keep?
#  Hint -- look at the help file for separate
#  Hint Hint -- ?separate
?separate

dat_sep_2 <- dat %>%
  separate(file_name, into = c("sample_id", "replicate"), sep = "_", remove = FALSE)



