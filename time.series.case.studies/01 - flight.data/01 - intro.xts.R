#View the structure of the flights data
str(flights)

#Examine the first five rows of the flights data
head(flights, n = 5)

#Identify class of the column containing date information
class(flights$date)

# Load the xts package
library(xts)

# Convert date column to a time-based class
flights$date <- as.Date(flights$date)

# Convert flights to an xts object using as.xts
flights_xts <- as.xts(flights[, -5], order.by = flights$date)

# Check the class of flights_xts
class(flights_xts)

# Examine the first five lines of flights_xts
head(flights_xts, 5)