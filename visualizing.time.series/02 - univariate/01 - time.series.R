# Plot Apple's stock price 
plot(data$apple, main = "Apple stock price")

# Create a time series called rtn
rtn <- ROC(data$apple)

# Plot Apple daily price and daily returns 
par(mfrow = c(1, 2))
plot(data$apple)
plot(rtn)

# Create a histogram of Apple stock returns
hist(rtn, main = "Apple stock return distribution",
probability = TRUE)

# Add a density line
lines(density(rtn))

# Redraw a thicker, red density line
lines(density(rtn), col = "red", lwd = 2)