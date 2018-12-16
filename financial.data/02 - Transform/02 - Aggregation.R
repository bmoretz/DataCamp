data_env <- new.env()

getSymbols(c("SPY", "QQQ"), env = data_env, auto.assign = TRUE)

head(data_env$SPY)

adjusted_list <- lapply(data_env, Ad)

adjusted <- do.call(merge, adjusted_list)

head(adjusted)

# Download quarterly CL and BZ prices
qtr_price <- Quandl(code = c("CME/CLH2016", "CME/BZH2016"), type = "xts", collapse = "quarterly")

# View the high prices for both series
Hi(qtr_price)

# Download quarterly CL and BZ returns
qtr_return <- Quandl(code = c("CME/CLH2016", "CME/BZH2016"), type = "xts", collapse = "quarterly", transform = "rdiff")

# View the settle price returns for both series
getPrice(qtr_return, prefer = "Settle")

# Call head on each object in data_env using eapply
data_list <- eapply(data_env, head)

# Merge all the list elements into one xts object
data_merged <- do.call(merge, data_list)

# Ensure the columns are ordered: open, high, low, close
data_ohlc <- OHLC(data_merged)

# Symbols
symbols <- c("AAPL", "MSFT", "IBM")

# Create new environment
data_env <- new.env()

# Load symbols into data_env
getSymbols(symbols, env = data_env, auto.assign = TRUE)

# Extract the close column from each object and combine into one xts object
close_data <- do.call(merge, eapply(data_env, Cl))

# View the head of close_data
head( close_data )