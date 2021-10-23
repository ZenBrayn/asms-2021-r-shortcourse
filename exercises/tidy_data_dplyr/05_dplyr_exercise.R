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





# Step #1: Read in the data file: data/example_data.csv





# Step #2: Consider the following task (but don't do it yet):
# Compute the mean, standard deviation, and CV for each analyte across all the runs
#
# The "for each" statement above implies needing to group by analyte.
# Does a (single) column specifying all the analytes exist in the current data?
#  Hint -- is there one column that has all the analyte names as value?
# Is the data in the right form?
#  Hint -- think about pivoting





# Step #3: Make a new column called analyte using pivoting
#  Hint -- does the data table need to become wider or longer?





# Step #4: Make a dplyr pipeline to complete this task:
# Compute the mean, standard deviation and CV for each analyte across all the runs
#  Hint -- you'll need to use group_by followed by summarize
#  Hint -- other functions you'll need: mean, sd
#  Hint -- there is no CV function but you can compute it as standard deviation / mean





# Step #5 (Challenge): Compute analyte summaries within the samples, and (separately) within replicates
#   Hint -- Recall the separate exercise
#   Hint -- you can group_by more than one variable at a time







