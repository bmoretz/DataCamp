# Look at first few rows of AAPL
head(AAPL)

# Adjust AAPL for splits and dividends
aapl_adjusted <- adjustOHLC(AAPL)

# Look at first few rows of aapl_adjusted
head(aapl_adjusted)

# Download AAPL split data
splits <- getSplits('AAPL')

# Download AAPL dividend data
dividends <- getDividends('AAPL')

# Look at the first few rows of dividends
head(dividends)

# Download unadjusted AAPL dividend data
raw_dividends <- getDividends('AAPL', split.adjusted = F)

# Look at the first few rows of raw_dividends
head(raw_dividends)

# Calculate split and dividend adjustment ratios
ratios <- adjRatios(splits = splits, dividends = raw_dividends, close = Cl(AAPL$AAPL.Close))

# Calculate adjusted close for AAPL
aapl_adjusted <- Cl(AAPL$AAPL.Close) * ratios[, "Split"] * ratios[, "Div"]

# Look at first few rows of Yahoo adjusted close
head(Ad(AAPL$AAPL.Adjusted))

# Look at first few rows of aapl_adjusted
head(aapl_adjusted$AAPL.Close)