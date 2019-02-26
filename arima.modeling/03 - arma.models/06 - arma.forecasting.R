# Plot P/ACF pair of differenced data 
acf2(diff(x))

# Fit model - check t-table and diagnostics
sarima(xdata = x, p = 1, d = 1, q = 0)

# Forecast the data 20 time periods ahead
sarima.for(x, n.ahead = 20, p = 1, d = 1, q = 0)
lines(y)