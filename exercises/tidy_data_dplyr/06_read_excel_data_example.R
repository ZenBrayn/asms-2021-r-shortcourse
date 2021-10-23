
# Need to install the package called readxl (you only need to do this once)
install.packages("readxl")

# Load the package
library(readxl)

# The example Excel file is located at: data/example_messy_data.xlsx
# Read the file with a function from the readxl package
dat <- read_excel("data/example_messy_data.xlsx", sheet = 1, range = "B8:H18")
dat
