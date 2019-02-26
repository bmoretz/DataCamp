# Generate 100 observations from the AR(1) model
x <- arima.sim(model = list(order = c(1, 0, 0), ar = .9), n = 100)

# Plot the generated data 
plot(x)

# Plot the sample P/ACF pair
acf2(x)

# Fit an AR(1) to the data and examine the t-table
sarima(x, p = 1, d = 0, q = 0)
