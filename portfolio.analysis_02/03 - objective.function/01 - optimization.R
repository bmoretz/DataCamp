# Add a return objective with "mean" as the objective name
port_spec <- add.objective(portfolio = port_spec, type = "return", name = "mean")

# Calculate the sample moments
moments <- set.portfolio.moments(R = asset_returns, portfolio = port_spec)

# Check if moments$mu is equal to the sample estimate of mean returns
moments$mu == colMeans(asset_returns)

# Add a risk objective with "StdDev" as the objective name
port_spec <- add.objective(portfolio = port_spec, type = "risk", name = "StdDev")

# Calculate the sample moments using set.portfolio.moments. Assign to a variable named moments.
moments <- set.portfolio.moments(R = asset_returns, portfolio = port_spec)

# Check if moments$sigma is equal to the sample estimate of the variance-covariance matrix
moments$sigma == cov(asset_returns)

# Print the portfolio specification object
print(port_spec)

# Fit a statistical factor model to the asset returns
fit <- statistical.factor.model(R = asset_returns, k = 3)

# Estimate the portfolio moments using the "boudt" method with 3 factors
moments_boudt <- set.portfolio.moments(R = asset_returns, portfolio = port_spec, method = "boudt", k = 3)

# Check if the covariance matrix extracted from the model fit is equal to the estimate in `moments_boudt`
moments_boudt$sigma == extractCovariance(fit)


# Define custom moment function
moments_robust <- function(R, portfolio) {
  out <- list()
  out$sigma <- cov.rob(R, method = "mcd")$cov
  out
}

# Estimate the portfolio moments using the function you just defined 
moments <- moments_robust(R = asset_returns, portfolio = port_spec)

# Check the moment estimate
cov.rob(asset_returns, method = "mcd")$cov == moments$sigma

# Run the optimization with custom moment estimates
opt_custom <- optimize.portfolio(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp, momentFUN = "moments_robust")

# Print the results of the optimization with custom moment estimates
print(opt_custom)

# Run the optimization with sample moment estimates
opt_sample <- optimize.portfolio(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp)

# Print the results of the optimization with sample moment estimates
print(opt_sample)

# Custom annualized portfolio standard deviation
pasd <- function(R, weights, sigma, scale = 12) {
  sqrt(as.numeric(as.numeric(t(weights)) %*% sigma %*% weights)) * sqrt(scale)
}

# Add custom objective to portfolio specification
port_spec <- add.objective(portfolio = port_spec, type = "risk", name = "pasd")

# Print the portfolio specificaton object
print(port_spec)

# Run the optimization
opt <- optimize.portfolio(R = asset_returns, portfolio = port_spec, momentFUN = set_sigma, optimize_method = "random", rp = rp)

# Print the results of the optimization
print(opt)