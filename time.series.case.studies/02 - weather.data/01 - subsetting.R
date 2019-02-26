# View the structure of each object
str(temps_1)
str(temps_2)

# View the first and last rows of temps_1
head(temps_1)
tail(temps_1)

# View the first and last rows of temps_2
head(temps_2)
tail(temps_2)

# Confirm that the date column in each object is a time-based class
class(temps_1$date)
class(temps_2$date)

# Encode your two temperature data frames as xts objects
temps_1_xts <- as.xts(temps_1[, -4], order.by = temps_1$date)
temps_2_xts <- as.xts(temps_2[, -4], order.by = temps_2$date)

# View the first few lines of each new xts object to confirm they are properly formatted
head(temps_1_xts)
head(temps_2_xts)

# Use rbind to merge your new xts objects
temps_xts <- rbind(temps_1_xts, temps_2_xts)

# View data for the first 3 days of the last month of the first year in temps_xts
first(last(first(temps_xts, "1 year"), "1 month"), "3 days")

# Identify the periodicity of temps_xts
periodicity(temps_xts)

# Generate a plot of mean Boston temperature for the duration of your data
plot.xts(temps_xts)

# Generate a plot of mean Boston temperature from November 2010 through April 2011
plot.xts(temps_xts["2010-11/2011-04"])

# Use plot.zoo to generate a single plot showing mean, max, and min temperatures during the same period 
plot.zoo(temps_xts["2010-11/2011-04"], plot.type = "single", lty = lty)