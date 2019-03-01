# Load package PerformanceAnalytics 
library(PerformanceAnalytics)

# Print the first six rows and last six rows of prices
head(prices, 6)
tail(prices, 6)

# Create the variable returns using Return.calculate()  
returns <- Return.calculate(prices)

# Print the first six rows of returns. Note that the first observation is NA, because there is no prior price.
head(returns, 6)

# Remove the first row of returns
returns <- returns[-1,]

# Create the weights
eq_weights <- c(.5, .5)

# Create a portfolio using buy and hold
pf_bh <- Return.portfolio(R = returns, weights = eq_weights)

# Create a portfolio rebalancing monthly 
pf_rebal <- Return.portfolio(R = returns, weights = eq_weights, rebalance_on = "months")

# Plot the time-series
par(mfrow = c(2, 1), mar = c(2, 4, 2, 2))
plot.zoo(pf_bh)
plot.zoo(pf_rebal)

