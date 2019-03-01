# Create returns_estim 
returns_estim <- window(returns, start = "1991-01-01", end = "2003-12-31")

# Create returns_eval
returns_eval <- window(returns, start = "2004-01-01", end = "2015-12-31")

# Create vector of max weights
max_weights <- rep(.1, ncol(returns))

# Create portfolio with estimation sample 
pf_estim <- portfolio.optim(returns_estim, reshigh = max_weights)

# Create portfolio with evaluation sample
pf_eval <- portfolio.optim(returns_eval, reshigh = max_weights)

# Create a scatter plot with evaluation portfolio weights on the vertical axis
plot(pf_estim$pw, pf_eval$pw)
abline(a = 0, b = 1, lty = 3)

# Create returns_pf_estim
returns_pf_estim <- Return.portfolio(returns_estim, pf_estim$pw, rebalance_on = "months")

# Create returns_pf_eval
returns_pf_eval <- Return.portfolio(returns_eval, pf_estim$pw, rebalance_on = "months")

# Print a table for your estimation portfolio
table.AnnualizedReturns(returns_pf_estim)

# Print a table for your evaluation portfolio
table.AnnualizedReturns(returns_pf_eval)