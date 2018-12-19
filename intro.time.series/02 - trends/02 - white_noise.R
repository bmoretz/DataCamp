# Simulate a WN model with list(order = c(0, 0, 0))
white_noise <- arima.sim(model = list(order = c(0, 0, 0)), n = 100)

# Plot your white_noise data
ts.plot(white_noise)

# Simulate from the WN model with: mean = 100, sd = 10
white_noise_2 <- arima.sim(model = list(order = c(0, 0, 0)), n = 100, mean = 100, sd = 10)

# Plot your white_noise_2 data
ts.plot(white_noise_2)

# Fit the WN model to y using the arima command
# Simulate a WN model with list(order = c(0, 0, 0))
arima(y, order = c(0, 0, 0))

# Calculate the sample mean and sample variance of y
mean(y)
var(y)

