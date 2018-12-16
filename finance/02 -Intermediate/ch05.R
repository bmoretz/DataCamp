
# Percent to decimal function
percent_to_decimal <- function(percent, digits = 2) {
	decimal <- percent / 100

	round(decimal, digits)
}

# list version

stock_return <- list(apple = runif(10, -2, 2), ibm = runif(10, -2, 2), micr = runif(10, -2, 2))

# Print stock_return
print(stock_return)

# lapply to change percents to decimal
lapply(stock_return, FUN = percent_to_decimal)

# dataframe version
stock_return <- data.frame(apple = runif(10, -2, 2), ibm = runif(10, -2, 2), micr = runif(10, -2, 2))

# Print stock_return
print(stock_return)

# lapply to get the average returns
lapply(stock_return, mean)

# Sharpe ratio
sharpe <- function(returns) {
	( mean(returns) - 0.0003 ) / sd(returns)
}

# lapply to get the sharpe ratio

lapply(stock_return, sharpe)

# sharpe
sharpe <- function(returns, rf = .0003) {
	(mean(returns) - rf) / sd(returns)
}
# First lapply()
lapply(stock_return, FUN = sharpe, rf = .0004)

# Second lapply()
lapply(stock_return, FUN = sharpe, rf = .0009)

# lapply() on stock_return
lapply(stock_return, sharpe)

# sapply() on stock_return
sapply(stock_return, sharpe)

# sapply() on stock_return with optional arguments
sapply(stock_return, sharpe, simplify = FALSE, USE.NAMES = FALSE)

# Market crash with as.POSIXct()
market_crash2 <- list(dow_jones_drop = 777.68,
					  date = as.POSIXct("2008-09-28"))

# Find the classes with sapply()
sapply(market_crash2, class)

# Find the classes with vapply()
vapply(market_crash2, FUN = class, FUN.VALUE = character(1))


# Sharpe ratio for all stocks
vapply(stock_return, FUN = sharpe, FUN.VALUE = numeric(1))

# Summarize Apple
summary(stock_return$apple)

# Summarize all stocks
vapply(stock_return, FUN = summary, FUN.VALUE = numeric(6))

# Max and min
vapply(stock_return,
	   FUN = function(x) { c(max(x), min(x)) },
	   FUN.VALUE = numeric(2))
