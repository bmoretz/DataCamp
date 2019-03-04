# Create the weights
eq_weights <- c(.5, .5)

# Create a portfolio using buy and hold
pf_bh <- Return.portfolio(returns, weights = eq_weights, verbose = TRUE)

# Create a portfolio that rebalances monthly
pf_rebal <- Return.portfolio(returns, weights = eq_weights, rebalance_on = "months", verbose = TRUE)

# Create eop_weight_bh
eop_weight_bh <- pf_bh$EOP.Weight

# Create eop_weight_rebal
eop_weight_rebal <- pf_rebal$EOP.Weight

# Plot end of period weights
par(mfrow = c(2, 1), mar = c(2, 4, 2, 2))
plot.zoo(eop_weight_bh$AAPL)
plot.zoo(eop_weight_rebal$AAPL)