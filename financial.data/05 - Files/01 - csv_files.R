library(Quandl)
library(quantmod)

# Data Path
data.path <- "financial.data\\05 - Files\\data\\"

# List Contents of data path
dir(path = data.path)

# set wd to data path.
setwd(data.path)

getSymbols("AMZN", src = 'csv')

str(AMZN)

# Import AMZN.csv using read.zoo
amzn_zoo <- read.zoo("AMZN.csv", sep = ',', header = T)

# Convert to xts
amzn_xts = as.xts(amzn_zoo)

# Look at the first few rows of amzn_xts
head(amzn_xts)

# Read data with read.csv
une_data <- read.csv("UNE.csv", nrows = 5)

# Look at the structure of une_data
str(une_data)

# Read data with read.zoo, specifying index columns
une_zoo <- read.zoo("UNE.csv", index.column = c("Date", "Time"), sep = ",", header = T)

# Look at first few rows of data
head(une_zoo)

# Read data with read.csv
two_symbols_data <- read.csv("two_symbols.csv", nrows = 5)

# Look at the structure of two_symbols_data
str(two_symbols_data)

# Read data with read.zoo, specifying index columns
two_symbols_zoo <- read.zoo("two_symbols.csv", split = c("Symbol", "Type"), sep = ",", header = T)

# Look at first few rows of data
head(two_symbols_zoo)