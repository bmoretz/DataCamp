# Fit the chicken model again and check diagnostics
# Plot differenced chicken
plot(diff(chicken))

# Plot P/ACF pair of differenced data to lag 60
acf2(diff(chicken), max.lag = 60)

# Fit SARIMA(2,1,0,1,0,0,12) to chicken - that works
sarima(chicken, p = 2, d = 1, q = 0, P = 1, D = 0, Q = 0, S = 12)

# Forecast the chicken data 5 years into the future
sarima.for(xdata = chicken, n.ahead = 5 * 12, p = 2, d = 1, q = 0, P = 1, D = 0, Q = 0, S = 12)
