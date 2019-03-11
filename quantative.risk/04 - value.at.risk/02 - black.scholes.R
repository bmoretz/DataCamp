# Set the interest rate r to be 0.01, the volatility sigma to be 0.2 and the strike K to be 100
r <- 0.01
sigma <- 0.2
K <- 100

# Look at the arguments of the Black_Scholes function
args(Black_Scholes)

# Price a European call option that matures in one year if the current stock price is 80
Black_Scholes(0, 80, r, sigma, K, 1, "call")

# Price a European call option that matures in one year if the current stock price is 120
Black_Scholes(0, 120, r, sigma, K, 1, "call")

# Price a European put option that matures in one year if the current stock price is 80
Black_Scholes(0, 80, r, sigma, K, 1, "put")

# Price a European put option that matures in one year if the current stock price is 120
Black_Scholes(0, 120, r, sigma, K, 1, "put")

# Plot the risk factors and the log-returns
plot.zoo(riskfactors)
plot.zoo(returns)

# Make a scatterplot of the two return series
plot(as.matrix(returns))

# Apply the Jarque-Bera test to the returns and make a Q-Q plot of the volatility log-returns
apply(returns, FUN = jarque.test, MARGIN = 2)
qqnorm(returns[, "X.VIX"])

# Create the sample acf of the returns and absolute returns
acf(returns)
acf(abs(returns))

# Calculate the correlation between the log-returns
cor(returns)