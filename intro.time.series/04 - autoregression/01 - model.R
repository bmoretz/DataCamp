# Simulate an AR model with 0.5 slope
x <- arima.sim(model = list(ar = .5), n = 100)

# Simulate an AR model with 0.9 slope
y <- arima.sim(model = list(ar = .9), n = 100)

# Simulate an AR model with -0.75 slope
z <- arima.sim(model = list(ar = -.75), n = 100)

# Plot your simulated data
plot.ts(cbind(x, y, z))

