# Calculate each stocks mean returns
stockmu <- colMeans(returns)

# Create a grid of target values
grid <- seq(from = .01, to = max(stockmu), length.out = 50)

# Create empty vectors to store means and deviations
vpm <- vpsd <- rep(0, length(grid))

# Create an empty matrix to store weights
mweights <- matrix(NA, 50, 30)

# Create your for loop
for (i in 1:length(grid)) {
  opt <- portfolio.optim(x = returns, pm = grid[i])
  vpm[i] <- opt$pm
  vpsd[i] <- opt$ps
  mweights[i,] <- opt$pw
}

# Create weights_minvar as the portfolio with the least risk
weights_minvar <- mweights[vpsd == min(vpsd),]

# Calculate the Sharpe ratio
vsr <- (vpm - 0.0075) / vpsd

# Create weights_max_sr as the portfolio with the maximum Sharpe ratio
weights_max_sr <- mweights[vsr == max(vsr),]

# Create barplot of weights_minvar and weights_max_sr
par(mfrow = c(2, 1), mar = c(3, 2, 2, 1))
barplot(weights_minvar[weights_minvar > 0.01])
barplot(weights_max_sr[weights_max_sr > 0.01])

