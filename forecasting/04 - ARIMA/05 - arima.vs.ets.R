# Set up forecast functions for ETS and ARIMA models
fets <- function(x, h) {
  forecast(ets(x), h = h)
}
farima <- function(x, h) {
  forecast(auto.arima(x), h = h)
}

# Compute CV errors for ETS as e1
e1 <- tsCV(austa, fets, h = 1)

# Compute CV errors for ARIMA as e2
e2 <- tsCV(austa, farima, h = 1)

# Find MSE of each model class
mean(e1 ^ 2, na.rm = TRUE)
mean(e2 ^ 2, na.rm = TRUE)

# Plot 10-year forecasts using the best model class
austa %>% farima(h = 10) %>% autoplot()