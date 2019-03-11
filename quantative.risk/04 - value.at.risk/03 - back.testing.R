# Calculate the first loss
lossop(c(-0.1, -0.1), S = 80, sigma = 0.2)

# Calculate the second loss
lossop(c(-0.1, 0.1), S = 100, sigma = 0.2)

# Create and plot hslosses
hslosses <- lossop(returns, S = 100, sigma = 0.2)
plot(hslosses)

# Form a Q-Q plot of hslosses against normal
qqnorm(hslosses)

# Plot the sample acf of raw data and absolute values in hslosses
acf(hslosses)
acf(abs(hslosses))

# Estimate the 99.5% percentile of the distribution
quantile(hslosses, 0.995)

# Estimate the 99.5% ES
mean(hslosses[hslosses >= quantile(hslosses, 0.995)])

# Estimate the mean and standard deviation of hslosses
mu <- mean(hslosses)
sigma <- sd(hslosses)

# Compute the 99.5% quantile of a normal distribution
qnorm(0.995, mean = mu, sd = sigma)

# Compute the 99.5% ES of a normal distribution
ESnorm(0.995, mu = mu, sd = sigma)

