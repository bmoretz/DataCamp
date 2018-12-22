# Plot eu_stocks
plot(eu_stocks)

# Use this code to convert prices to returns
returns <- eu_stocks[-1,] / eu_stocks[-1860,] - 1

# Convert returns to ts
returns <- ts(returns, start = c(1991, 130), frequency = 260)

# Plot returns
plot(returns)

# Use this code to convert prices to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Generate means from eu_percentreturns
colMeans(eu_percentreturns)

# Use apply to calculate sample variance from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = var)

# Use apply to calculate standard deviation from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = sd)

# Display a histogram of percent returns for each index
par(mfrow = c(2, 2))
apply(eu_percentreturns, MARGIN = 2, FUN = hist, main = "", xlab = "Percentage Return")

# Display normal quantile plots of percent returns for each index
par(mfrow = c(2, 2))
apply(eu_percentreturns, MARGIN = 2, FUN = qqnorm, main = "")
qqline(eu_percentreturns)

# Make a scatterplot of DAX and FTSE
plot(DAX, FTSE)

# Make a scatterplot matrix of eu_stocks
pairs(eu_stocks)

# Convert eu_stocks to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Make a scatterplot matrix of logreturns
pairs(logreturns)
