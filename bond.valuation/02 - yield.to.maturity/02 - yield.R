# Generate prc_yld
prc_yld <- seq(0.02, 0.4, 0.01)

# Convert prc_yld to data frame
prc_yld <- data.frame(prc_yld)

# Calculate bond price given different yields
for (i in 1:nrow(prc_yld)) {
  prc_yld$price[i] <- bondprc(100, 0.10, 20, prc_yld$prc_yld[i])
}

# Plot P/YTM relationship
plot(prc_yld,
     type = "l",
     col = "blue",
     main = "Price/YTM Relationship")

# Load quantmod package
library(quantmod)

# Obtain Treasury yield data
t10yr <- getSymbols(Symbols = "DGS10", src = "FRED", auto.assign = FALSE)

# Subset data
t10yr <- t10yr["2006-01/2016-09"]

# Plot yields
plot(x = index(t10yr),
     y = t10yr$DGS10,
     xlab = "Date",
     ylab = "Yield (%)",
     type = "l",
     col = "red",
     main = "10-Year US Treasury Yields")

# Examine first and last six elements in spread
head(spread, 6)
tail(spread, 6)

# Calculate spread$diff
spread$diff <- (baa$Value - aaa$Value) * 100

# Plot spread
plot(x = spread$date,
     y = spread$diff,
     type = "l",
     xlab = "Date",
     ylab = "Spread (bps)",
     col = "red",
     main = "Baa - Aaa Spread")

