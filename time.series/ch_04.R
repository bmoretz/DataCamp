library(xts)
library(zoo)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\time.series\\data\\"))

rm(list = ls())

data(edhec, package = "PerformanceAnalytics")

edhec_4y <- edhec["1997/2001", 1]
ep <- endpoints(edhec_4y, "years")

period.apply(edhec_4y, INDEX = ep, FUN = mean)

edhec.qtrs <- split(edhec[, 1], f = "quarters")
edhec.qtrs[[3]]


AirPass <- as.xts(AirPassengers)

endpoints(AirPass, on = "years")

# Locate the weeks
endpoints(AirPass, on = "weeks")

# Locate every two weeks
endpoints(AirPass, on = "weeks", k = 2)

# Calculate the weekly endpoints
ep <- endpoints(AirPass, on = "weeks")

# Now calculate the weekly mean and display the results
period.apply(AirPass[, 1], INDEX = ep, FUN = mean)

# Split temps by week
temps_weekly <- split(temps, f = "weeks")

# Create a list of weekly means, temps_avg, and print this list
temps_avg <- lapply(X = temps_weekly, FUN = mean)
temps_avg

# Split temps by week
temps_weekly <- split(temps, f = "weeks")

# Create a list of weekly means, temps_avg, and print this list
temps_avg <- lapply(X = temps_weekly, FUN = mean)
temps_avg

# Convert usd_eur to weekly
usd_eur_weekly <- to.period(usd_eur, period = "weeks")

# Convert usd_eur_weekly to monthly
usd_eur_monthly <- to.period(usd_eur, period = "months")

# Convert usd_eur_monthly to yearly univariate
usd_eur_yearly <- to.period(usd_eur, period = "years", OHLC = FALSE)


rm(list = ls())

# *********************
# Reduce Frequency
# *********************

data(edhec, package = "PerformanceAnalytics")

eq_mkt <- edhec[, "Equity Market Neutral"]

# Convert eq_mkt to quarterly OHLC
mkt_quarterly <- to.period(eq_mkt, period = "quarters")

# Convert eq_mkt to quarterly using shortcut function
mkt_quarterly2 <- to.quarterly(eq_mkt, name = "edhec_equity", indexAt = "firstof")

# *********************
# Discrete Rolling Window
# *********************

edhecy.yrs <- split(edhec[, 1], f = "years")
edhec.yrs <- lapply(edhec.yrs, cumsum)
edhec.ytd <- do.call(rbind, edhec.yrs)

# cumulative & monthly
cbind(edhec.ytd, edhec[, 1])["2007-01/2008-12"]

# rolling 3 month mean
rollapply(edhec["200701/08", 1], 3, mean)

# Basic rolling value of series by month

# Split edhec into years
edhec_years <- split(edhec["1990/2009"], f = "years")

# Use lapply to calculate the cumsum for each year in edhec_years
edhec_ytd <- lapply(edhec_years, FUN = cumsum)

# Use do.call to rbind the results
edhec_xts <- do.call(rbind, edhec_ytd)

edhec_xts

# Use rollapply to calculate the rolling 3 period sd of eq_mkt
eq_sd <- rollapply(eq_mkt, 3, FUN = sd)

eq_sd