# Fit the AR model to x
arima(x, order = c(1, 0, 0))

# Copy and paste the slope (ar1) estimate
0.8575

# Copy and paste the slope mean (intercept) estimate
- 0.0948

# Copy and paste the innovation variance (sigma^2) estimate
1.022

# Fit the AR model to AirPassengers
AR <- arima(AirPassengers, order = c(1, 0, 0))
print(AR)

# Run the following commands to plot the series and fitted values
ts.plot(AirPassengers)
AR_fitted <- AirPassengers - residuals(AR)
points(AR_fitted, type = "l", col = 2, lty = 2)

# Fit an AR model to Nile
AR_fit <- arima(Nile, order = c(1, 0, 0))
print(AR_fit)

# Use predict() to make a 1-step forecast
predict_AR <- predict(AR_fit)

# Obtain the 1-step forecast using $pred[1]
predict_AR$pred[1]

# Use predict to make 1-step through 10-step forecasts
predict(AR_fit, n.ahead = 10)

# Run to plot the Nile series plus the forecast and 95% prediction intervals
ts.plot(Nile, xlim = c(1871, 1980))
AR_forecast <- predict(AR_fit, n.ahead = 10)$pred
AR_forecast_se <- predict(AR_fit, n.ahead = 10)$se
points(AR_forecast, type = "l", col = 2)
points(AR_forecast - 2 * AR_forecast_se, type = "l", col = 2, lty = 2)
points(AR_forecast + 2 * AR_forecast_se, type = "l", col = 2, lty = 2)
