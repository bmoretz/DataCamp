# Generate MA model with slope 0.5
x <- arima.sim(model = list(ma = 0.5), n = 100)

# Generate MA model with slope 0.9
y <- arima.sim(model = list(ma = 0.9), n = 100)

# Generate MA model with slope -0.5
z <- arima.sim(model = list(ma = -0.5), n = 100)

# Plot all three models together
plot.ts(cbind(x, y, z))

# Calculate ACF for x
acf(x)

# Calculate ACF for y
acf(y)

# Calculate ACF for z
acf(z)

# Fit the MA model to x
arima(x, order = c(0, 0, 1))

# Paste the slope (ma1) estimate below
0.7928

# Paste the slope mean (intercept) estimate below
0.1589

# Paste the innovation variance (sigma^2) estimate below
0.9576

# Fit the MA model to Nile
MA <- arima(Nile, order = c(0, 0, 1))
print(MA)

# Plot Nile and MA_fit 
ts.plot(Nile)
MA_fit <- Nile - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)

# Fit the MA model to x
arima(x, order = c(0, 0, 1))

# Paste the slope (ma1) estimate below
0.7928

# Paste the slope mean (intercept) estimate below
0.1589

# Paste the innovation variance (sigma^2) estimate below
0.9576

# Fit the MA model to Nile
MA <- arima(Nile, order = c(0, 0, 1))
print(MA)

# Plot Nile and MA_fit 
ts.plot(Nile)
MA_fit <- Nile - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)

