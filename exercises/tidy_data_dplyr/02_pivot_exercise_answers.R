#
# Exercise: pivotting data
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
# What are the observations (rows)?
# A: Each row represents an MS run

# What are the variables (columns)?
# A: Each column represents something about the run: 
#      the file name, instrument, and analyte measurements

# Is this data in wide or long format?
# A: Wide format

# How many rows does it have?
# A: there are 60 rows
nrow(dat)

# Do the number of rows match what you'd expect from the summary above?
#   Hint -- how many samples, instrument, and replicates are there
# A: There are 10 samples x 2 instruments x 3 replicate = 60 rows

# How many columns does it have?
# A: 102 columns
ncol(dat)

# Do the number of columns match what you'd expect from the summary above?
#  Hint -- how many analytes are there? why do we have more columns than that?
# A: There are 100 analytes, so we have to have at least 100 columns
#    There are two more: file_name and ms_instr





# Step #3: Pivot the data from wide to long format
# What's the name of the function we should use?
#   Hint -- look at the examples in tidy_data_example.R 
dat_long <- pivot_longer(dat, cols = 3:102, names_to = "analyte", values_to = "intensity")

dat_long





# Step #4: Review the results
# How many rows are in the long format data?
# A: 6000 rows
nrow(dat_long)

# Do the number of rows match your expectation?
#   Hint - how many MS runs total are there? how many analytes are there?
# A: 60 total runs x 100 analytes = 6000


