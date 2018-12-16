library(Quandl)
library(quantmod)

setDefaults(getSymbols.yahoo, from = "2016-01-01", to = "2016-12-31")

setDefaults(getSymbols.av, api.key = "2W7RF4LLXP5CGY6E")

Quandl.api_key("5qmM13nNYrWsCxwsKRn_")

# Set the default to pull data from Alpha Vantage
setDefaults(getSymbols, src = "av")

# Get GOOG data
getSymbols(Symbol = 'GOOG', auto.assign = TRUE, api.key = "2W7RF4LLXP5CGY6E")

# Verify the data was actually pulled from Alpha Vantage
str(GOOG)

# Look at getSymbols.yahoo arguments
args(getSymbols.yahoo)

# Set default 'from' value for getSymbols.yahoo
setDefaults(getSymbols.yahoo, from = "2000-01-01")

# Confirm defaults were set correctly
getDefaults('getSymbols.yahoo')