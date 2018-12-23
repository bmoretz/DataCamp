# Simulate an AR model with 0.5 slope
x <- arima.sim(model = list(ar = .5), n = 100)

# Simulate an AR model with 0.9 slope
y <- arima.sim(model = list(ar = .9), n = 100)

# Simulate an AR model with -0.75 slope
z <- arima.sim(model = list(ar = -.75), n = 100)

# Plot your simulated data
plot.ts(cbind(x, y, z))

# Calculate the ACF for x
acf(x)

# Calculate the ACF for y
acf(y)

# Calculate the ACF for z
acf(z)

# Simulate and plot AR model with slope 0.9 
x <- arima.sim(model = list(ar = .9), n = 200)
ts.plot(x)
acf(x)

# Simulate and plot AR model with slope 0.98
y <- arima.sim(model = list(ar = .98), n = 200)
ts.plot(y)
acf(y)

# Simulate and plot RW model
z <- arima.sim(model = list(order = c(0, 1, 0)), n = 200)
ts.plot(z)
acf(z)
