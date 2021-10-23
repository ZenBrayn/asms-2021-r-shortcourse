

# correlation function example
# here we create two vectors and want to find their correlation
x <- c(1,2,3,4)
y <- c(2,4,6,10)

# cor is the function that takes x and y as input
# and returns a calculation of their correlation
xy_cor <- cor(x,y)

# get docs on cor() function
?cor

# search for functions and package info about t-testing
??ttest


## constructing vectors
# functions to construct vectors
# use of c combines multiple elements into a vector or list
# this is one of the most commonly used R functions
char_vec <- c('x','y','z','a','b','c')

# numerical sequencing
# sometimes you may want to test different conditions along a sequence...
# here we create a sequence from 1 to 100 with steps of 10
every10th <- seq(1,100,10)

# repeat a value (1) multiple times
rep_val <- rep(1, 10)

# remember these vectors can be rolled into data.frames for advanced processing

# control variable type
# occasionally in data that we download or process from other sources, variables will be recognized as the incorrect type
# we need to coerce them to the correct type for R to perform the correct analysis
# some R functions expect variables to be a certain type
mixed_vec <- c("X100200","X100300","X100400","X100500")

# this will error! Even though we see these values as numeric
# R sees them as character becasue there is a "X" character in values
mixed_vec / 100

# here we use a string replacement function to replace all the "X"s by nothing
# gsub(character string to replace, what to replace it with, in what data)
numerical_vec <- gsub("X","",mixed_vec)

# get the vector's type
class(numerical_vec)

# coerce to a more appropriate type
numerical_vec <-as.numeric(numerical_vec)


# check the vector type again using class AFTER coercion
class(as.numeric(numerical_vec))

# now we can peform numerical operations on this vector...
numerical_vec / 100



# functions to get the shape of a dataset
# with vectors, there is only one shape property, that is the length
length(ms_mz) 

# with data.frames, there is much more information to obtain about the shape
# the basics

nrow(protein_id_df)
ncol(protein_id_df)
dim(protein_id_df)

# general information
str(protein_id_df)


# get count information for values in a data.frame vector
table(protein_id_df$in_ds2)

# get sumary statistics
summary(protein_id_df$sum_ms1_intensities)


# find files, write files
# list files can find files in a specific directory
# by default it searches the current working directory
list.files(pattern="*.R")

# other arguments can pull more specific information like the full path
# or search recursively (within subfolders)
# if we don't use pattern it will find ALL files in the directory
list.files('directory', pattern=".csv", recursive=T, full.names=T)

# directory counter part
list.dirs()

# csvs are a common storage format for many data analysis
# they are highly portable and human readable
# they store every value with a "," separating the values
# csv = comma separate value output
read.csv("path_to_csv.csv", header=T)

# writing a csv from a data.frame is very easy!
write.csv(protein_id_df, 'protein_id_df.csv')


# randomization and sampling
# since reprodubility in data analysis is one of the KEY reasons to use
set.seed(0)

num_vec <- c(1:100)

# select 10 values from 1 through 100 randomly
random_sample <- sample(num_vec, 10)

# random sample from a normal distribution
rnorm(10, mean = 10, sd=2)

## student's t-test example 
# t.test

# make fake data using rnorm for demonstartion purposes
ttest_df <- data.frame(condition = c(rep('sample01',3),rep('sample02',3)),
                       variable=c(rnorm(3, mean = 10, sd=2),
                                  rnorm(3, mean = 24, sd=5)))

t.test(variable~condition, data=ttest_df)

