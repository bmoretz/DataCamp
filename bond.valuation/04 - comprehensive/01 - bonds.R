# Load Quandl package
library(Quandl)

# Obtain Moody's Aaa yield
aaa <- Quandl("FED/RIMLPAAAR_N_M")

# identify yield on September 30, 2016
aaa_yield <- subset(aaa, aaa$Date == "2016-09-30")

# Convert yield into decimals
aaa_yield <- as.numeric(aaa_yield$Value) / 100
aaa_yield

# Layout the bond's cash flows
cf <- c(3, 3, 3, 3, 3, 3, 3, 103)

# Convert to data.frame
cf <- data.frame(cf)

# Add time indicator
cf$t <- seq(1, 8, 1)

# Calculate PV factor
cf$pv_factor <- 1 / (1 + aaa_yield) ^ cf$t

# Calculate PV
cf$pv <- cf$cf * cf$pv_factor

# Price bond
sum(cf$pv)

# Code cash flow function
alt_cf <- function(r, p, ttm) {
  c(rep(p * r, ttm - 1), p * (1 + r))
}

# Generate cf vector
alt_cf(r = 0.03, p = 100, ttm = 8)
