# astsa is preloaded

# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an ARMA(2,1) to the data and examine the t-table
sarima(x, p = 2, d = 0, q = 1)
