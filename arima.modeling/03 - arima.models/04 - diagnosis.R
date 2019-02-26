# Plot sample P/ACF pair of the differenced data
acf2(diff(x))

# Fit the first model, compare parameters, check diagnostics
sarima(xdata = x, p = 0, d = 1, q = 1)

# Fit the second model and compare fit
sarima(xdata = x, p = 0, d = 1, q = 2)