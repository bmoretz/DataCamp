# Load Quandl package
library(Quandl)

# Obtain Moody's Baa index data
baa <- Quandl("FED/RIMLPBAAR_N_M")

# Identify 9/30/16 yield
baa_yield <- subset(baa, baa$Date == "2016-09-30")

# Convert yield to decimals and view
baa_yield <- baa_yield$Value / 100
baa_yield
# Value bond
bondprc(p = 100, r = .05, ttm = 5, y = .0429)
