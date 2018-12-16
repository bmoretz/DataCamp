# Load the quantmod package
library(quantmod)

# Import QQQ data from Yahoo! Finance
getSymbols(Symbols = 'QQQ', src = 'yahoo', auto.asign = TRUE)

# Look at the structure of the object getSymbols created

str(QQQ)

# Look at the first few rows of QQQ
head(QQQ)

# Import QQQ data from Alpha Vantage
getSymbols(Symbols = 'QQQ', src = 'av')

# Look at the structure of QQQ
str(QQQ)

# Import GDP data from FRED
getSymbols(Symbols = 'GDP', src = 'FRED')

# Look at the structure of GDP
str(GDP)

# Assign SPY data to 'spy' using auto.assign argument
spy <- getSymbols(Symbols = 'SPY', src = 'yahoo', auto.assign = FALSE)

# Look at the structure of the 'spy' object
str(spy)

# Assign JNJ data to 'jnj' using env argument
jnj = getSymbols(Symbols = 'JNJ', src = 'yahoo', env = NULL)

# Look at the structure of the 'jnj' object
str(jnj)