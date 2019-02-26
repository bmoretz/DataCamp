# Plot P/ACF pair of fully differenced data to lag 60
dd_unemp <- diff(diff(unemp), lag = 12)
acf2(dd_unemp, max.lag = 60)

# Fit an appropriate model
sarima(unemp, 2, 1, 0, 0, 1, 1, 12)