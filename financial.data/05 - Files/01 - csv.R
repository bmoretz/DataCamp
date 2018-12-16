library(Quandl)
library(quantmod)

# Data Path
data.path <- "financial.data\\05 - Files\\data\\"


dir(path = data.path)

read.csv(
getSymbols(