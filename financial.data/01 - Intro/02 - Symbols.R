# Load the Quandl package
library(Quandl)

# Import GDP data from FRED
gdp <- Quandl(code = 'FRED/GDP')

# Look at the structure of the object returned by Quandl
str(gdp)

# Import GDP data from FRED as xts
gdp_xts = Quandl(code = "FRED/GDP", type = "xts")

# Look at the structure of gdp_xts
str(gdp_xts)

# Import GDP data from FRED as zoo
gdp_zoo = Quandl(code = "FRED/GDP", type = "zoo")

# Look at the structure of gdp_zoo
str(gdp_zoo)

# Create an object containing the Pfizer ticker symbol
symbol <- "PFE"

# Use getSymbols to import the data
getSymbols(Symbols = symbol, src = "yahoo")

# Look at the first few rows of data
head(PFE)

# Create a currency_pair object
currency_pair <- "GBP/CAD"

# Load British Pound to Canadian Dollar exchange rate data
getSymbols(Symbols = currency_pair, src = 'oanda')

# Examine object using str()
str(GBPCAD)

# Try to load data from 190 days ago
getSymbols(currency_pair, from = Sys.Date() - 190, to = Sys.Date(), src = "oanda")

# Create a series_name object
series_name <- 'UNRATE'

# Load the data using getSymbols
getSymbols(Symbols = series_name, src = 'FRED')

# Create a quandl_code object
quandl_code <- 'FRED/UNRATE'

# Load the data using Quandl
unemploy_rate <- Quandl(code = quandl_code)