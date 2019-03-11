# Make a sequence of 100 x-values going from -4*sigma to 4*sigma
xvals <- seq(from = -4 * sigma, to = 4 * sigma, length.out = 100)

# Compute the density of a N(mu, sigma^2) distribution at xvals
ndens <- dnorm(xvals, mean = mu, sd = sigma)

# Plot ndens against xvals
plot(xvals, ndens, type = "l")

# Compute the 99% VaR and 99% ES of a N(mu, sigma^2) distribution
VaR99 <- qnorm(.99, mean = mu, sd = sigma)
ES99 <- ESnorm(.99, mu = mu, sd = sigma)

# Draw vertical lines at VaR99 and ES99 in red and green
abline(v = VaR99, col = "red")
abline(v = ES99, col = "green")

# Plot the risk-factor data
plot.zoo(riskfactors)

# Calculate the log-returns, assign to returns, and plot
returns <- diff(log(riskfactors))[-1,]
plot.zoo(returns)

# Use apply() to carry out the Jarque-Bera test for all 5 series
apply(returns, FUN = jarque.test, MARGIN = 2)

# Make a Q-Q plot against normal for the 5th return series and add a reference line
qqnorm(returns[, 5])
qqline(returns[, 5])

# Make a picture of the sample acfs for returns and their absolute values
acf(returns)
acf(abs(returns))

# Calculate the loss from a log-return of -0.1 for all risk factors
lossop(rep(-0.1, 5))

# Apply lossop() to returns and plot hslosses
hslosses <- lossop(returns)
plot(hslosses)

# Form a Q-Q plot of hslosses against normal
qqnorm(hslosses)

# Plot the sample acf of hslosses and their absolute values
acf(hslosses)
acf(abs(hslosses))


