# Plot P/ACF to lag 60 of differenced data
d_birth <- diff(birth)
acf2(d_birth, max.lag = 60)

# Plot P/ACF to lag 60 of seasonal differenced data
dd_birth <- diff(d_birth, lag = 12)
acf2(dd_birth, max.lag = 60)

# Fit SARIMA(0,1,1)x(0,1,1)_12. What happens?
sarima(xdata = birth, p = 0, d = 1, q = 1, P = 0, D = 1, Q = 1, S = 12)

# Add AR term and conclude
sarima(xdata = birth, p = 1, d = 1, q = 1, P = 0, D = 1, Q = 1, S = 12)
