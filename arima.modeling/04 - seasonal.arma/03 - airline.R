# Plot sample P/ACF pair to lag 60 and compare to actual
acf2(x, max.lag = 60)

# Fit the seasonal model to x
sarima(x, p = 0, d = 0, q = 1, P = 0, D = 0, Q = 1, S = 12)