# View a summary of your unemployment data
summary(unemployment)

# Use na.approx to remove missing values in unemployment data
unemployment <- na.approx(unemployment)

# Plot new unemployment data
plot.zoo(unemployment, plot.type = "single", lty = lty)
legend("topright", lty = lty, legend = labels, bg = "white")

# Create a one month lag of US unemployment
us_monthlag <- lag(unemployment$us, k = 1)

# Create a one year lag of US unemployment
us_yearlag <- lag(unemployment$us, k = 12)

# Merge your original data with your new lags 
unemployment_lags <- merge(unemployment, us_monthlag, us_yearlag)

# View the first 15 rows of unemployment_lags
head(unemployment_lags, 15)

# Generate monthly difference in unemployment
unemployment$us_monthlydiff <- diff(unemployment$us, lag = 1, differences = 1)

# Generate yearly difference in unemployment
unemployment$us_yearlydiff <- diff(unemployment$us, lag = 12, differences = 1)

# Plot US unemployment and annual difference
par(mfrow = c(2, 1))
plot.xts(unemployment$us)
plot.xts(unemployment$us_yearlydiff, type = "h")