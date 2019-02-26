# Fit an ARIMA(0,1,2) to globtemp and check the fit
sarima(xdata = globtemp, p = 0, d = 1, q = 2)

# Forecast data 35 years into the future
sarima.for(globtemp, n.ahead = 35, p = 0, d = 1, q = 2)
