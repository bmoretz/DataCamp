# Create a vector of returns 
means <- apply(returns, 2, "mean")

# Create a vector of standard deviation
sds <- apply(returns, 2, "sd")

# Create a scatter plot
plot(sds, means)
text(sds, means, labels = colnames(returns), cex = 0.7)
abline(h = 0, lty = 3)

# Create a matrix with variances on the diagonal
diag_cov <- diag(sds ^ 2)

# Create a covariance matrix of returns
cov_matrix <- cov(returns)

# Create a correlation matrix of returns
cor_matrix <- cor(returns)

# Verify covariances equal the product of standard deviations and correlation
all.equal(cov_matrix[1, 2], cor_matrix[1, 2] * sds[1] * sds[2])

# Create a weight matrix w
w <- as.matrix(weights)

# Create a matrix of returns
mu <- as.matrix(vmeans)

# Calculate portfolio mean monthly returns
t(w) %*% mu

# Calculate portfolio volatility
sqrt(t(w) %*% sigma %*% w)

# Create portfolio weights
weights <- c(.4, .4, .1, .1)

# Create volatility budget
vol_budget <- StdDev(returns, portfolio_method = "component", weights = weights)

# Make a table of weights and risk contribution
weights_percrisk <- cbind(weights, vol_budget$pct_contrib_StdDev)
colnames(weights_percrisk) <- c("weights", "perc vol contrib")

# Print the table
print(weights_percrisk)