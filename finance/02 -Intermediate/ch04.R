# Percent to decimal function
percent_to_decimal <- function(percent, digits = 2) {
	decimal <- percent / 100

	round(decimal, digits)
}

# Present value function
pv <- function(cash_flow, i, year) {

	# Discount multiplier
	mult <- 1 + percent_to_decimal(i)

	# Present value calculation
	cash_flow * mult ^ ( -year)
}

# Calculate a present value
pv(1200, 7, 3)


# Library tidquant
library(tidyquant)

# Pull Apple stock data
apple <- tq_get("AAPL", get = "stock.prices")

# Take a look at what it returned
head(apple)

# Plot the stock price over time
plot(apple$date, apple$adjusted, type = "l")

# Calculate daily stock returns for the adjusted price
apple <- tq_mutate(data = apple,
				   ohlc_fun = Ad,
				   mutate_fun = dailyReturn)

# Sort the returns from least to greatest
sorted_returns <- sort(apple$daily.returns)

# Plot them
plot(sorted_returns)
