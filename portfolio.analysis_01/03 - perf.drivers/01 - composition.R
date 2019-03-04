# Create a grid
grid <- seq(from = 0, to = 1, by = 0.01)

# Initialize an empty vector for sharpe ratios
vsharpe <- rep(NA, times = length(grid))

# Create a for loop to calculate Sharpe ratios
for (i in 1:length(grid)) {
  weight <- grid[i]
  preturns <- weight * returns_equities + (1 - weight) * returns_bonds
  vsharpe[i] <- SharpeRatio.annualized(preturns)
}

# Plot weights and Sharpe ratio
plot(grid, vsharpe, xlab = "Weights", ylab = "Ann. Sharpe ratio")
abline(v = grid[vsharpe == max(vsharpe)], lty = 3)

# Create a scatter plot
chart.Scatter(returns_bonds, returns_equities, xlab = "bond returns", ylab = "equity returns", main = "bond-equity returns")

# Find the correlation
cor(returns_bonds, returns_equities)

# Merge returns_bonds and returns_equities 
returns <- merge(returns_bonds, returns_equities)

# Find and visualize the correlation using chart.Correlation
chart.Correlation(returns)

# Visualize the rolling estimates using chart.RollingCorrelation
chart.RollingCorrelation(returns_bonds, returns_equities, width = 24)