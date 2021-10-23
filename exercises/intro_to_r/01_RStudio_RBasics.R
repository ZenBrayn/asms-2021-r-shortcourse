# Learning the RStudio layout

# Running lines of code from the script editor to the console

print('Hello world from the editor!')
print('This is my first line to print')
print('This is my second line to print')


# working directory
getwd()
# create new directory in RStudio and change to it
setwd('/cloud/project/subdir')

getwd()

# windows path example:
# setwd("C:\data\")
# this would not work! because "\" is a string escape
setwd("C:\\data\\") #would work



 
## The editor's formatting can clue you in
# this is a comment

"R formatted text"

# a number
2

# TRUE/FALSE
TRUE
FALSE


## R as a calculator (mathematical operators)
# Addition
10 + 2

# Subtraction
10 - 2

# Mulitplication
10 * 2

# Division
10 / 2

#Exponential
10 ^ 2


# storing a variable with some information, in this case a character string
# requires use of the <- or = operator which defines the variable
# as the name to the left of the data
# below hw_text is the created data object and 
# "Hello world stored in a variable!" is the data that is stored
hw_text <- "Hello world stored in a variable!"
# print the line
hw_text

### useful tips
## make a plot and save it to EXACT specifications
# make a normal distribution with mean of 0 and std dev of 1
normaldist <- rnorm(1000,0,1)
# plot a histogram of this distribution
hist(normaldist)


# demonstrate stop button by putting R 'to sleep' for 1000 ms
# we can interrupt this function using the "stop" button at the console
Sys.sleep(1000)

# demonstrate saving a workspace


