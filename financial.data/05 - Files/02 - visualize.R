
# fill NA using last observation carried forward
locf <- na.locf(DGS10)

# fill NA using linear interpolation
approx <- na.approx(DGS10)

# fill NA using spline interpolation
spline <- na.spline(DGS10)

# merge into one object
na_filled <- merge(locf, approx, spline)

# plot combined object
plot(na_filled, col = c("black", "red", "green"))

# Look at the last few rows of AAPL data
tail(AAPL)

# Plot close price
plot(AAPL$AAPL.Close)

# Plot adjusted close price
plot(AAPL$AAPL.Adjusted)

# Look at first few rows of aapl_raw
head(aapl_raw)

# Look at first few rows of aapl_split
head(aapl_split_adjusted)

# Plot difference between adjusted close and split-adjusted close
plot(Ad(aapl_raw$AAPL.Adjusted) - Cl(aapl_split_adjusted$AAPL.Close))

# Plot difference between volume from the raw and split-adjusted sources
plot(Vo(aapl_raw$AAPL.Volume) - Vo(aapl_split_adjusted$AAPL.Volume))