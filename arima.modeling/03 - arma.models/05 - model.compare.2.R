# Fit ARIMA(0,1,2) to globtemp and check diagnostics  
sarima(xdata = globtemp, p = 0, d = 1, q = 2)

# Fit ARIMA(1,1,1) to globtemp and check diagnostics
sarima(xdata = globtemp, p = 1, d = 1, q = 1)

# Which is the better model?
"ARIMA(0,1,2)"
