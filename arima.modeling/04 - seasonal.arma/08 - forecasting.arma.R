# Fit your previous model to unemp and check the diagnostics
sarima(xdata = unemp, p = 2, d = 1, q = 0, P = 0, D = 1, Q = 1, S = 12)

# Forecast the data 3 years into the future
sarima.for(unemp, n.ahead = 36, p = 2, d = 1, q = 0, P = 0, D = 1, Q = 1, S = 12)