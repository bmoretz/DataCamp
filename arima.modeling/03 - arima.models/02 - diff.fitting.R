# Plot sample P/ACF of differenced data and determine model
acf2(diff(x))

# Estimate parameters and examine output
sarima(xdata = x, p = 2, d = 1, q = 0)