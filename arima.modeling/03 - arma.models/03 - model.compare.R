# Plot the sample P/ACF pair of the differenced data 
acf2(diff(globtemp))

# Fit an ARIMA(1,1,1) model to globtemp
sarima(xdata = globtemp, p = 1, d = 1, q = 1)

# Fit an ARIMA(0,1,2) model to globtemp. Which model is better?
sarima(xdata = globtemp, p = 0, d = 1, q = 2)
