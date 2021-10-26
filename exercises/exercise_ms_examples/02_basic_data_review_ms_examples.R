# ASMS 2021 R Short Course
# Basic Data Review, MS Examples
#

# BE SURE TO LOAD THE TIDYVERSE LIBRARY
library(tidyverse)

# Exercise #1 -- Reading Data
# 
# 1.1 Read the example data from a proteomics experiment
#     NOTE: file is a zipped .csv file -- R knows how to read it!
dat <- read_csv("data/Choi2017_DDA_Skyline_input.csv.zip", guess_max = 10000)

# Exercise #2 -- Reviewing Data Frames
#
# 2.1 Review some basic properties of the data frame
#     - How many rows?  How many columns?

#     - How many rows & columns (use one expression)

#     - What are the column names?

#     - What are the data types stored in each column?

#     - Use the View function to review the data in RStudio.
#       What kind of data is present?  What is the structure of the data?
#
#     - It appears that some of the data is duplicated across many rows?
#       Look at the data column by column and see if you can understand why.


# Exercise #3 -- Working with Data Frames
#
# 3.1 Retrieve the data from the column call "FileName"
#     How many values do you expect to get?  Write an
#     expression using the data you retrieved to see if
#     your guess is correct.


# 3.2 How many unique values of the data from "FileName" are there?
#     What are these values and what do they correspond to?


# 3.3 Using data frame indexing syntax, subset the data to rows
#     for the protein "sp|P33399|LHP1_YEAST"


# 3.4 How many unique peptides are present in the data for the
#     above protein?

