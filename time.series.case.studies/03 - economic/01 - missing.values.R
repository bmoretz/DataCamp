# Get a summary of your GDP data
summary(gdp)

# Convert GDP date column to time object
gdp$date <- as.yearqtr(gdp$date)

# Convert GDP data to xts
gdp_xts <- as.xts(gdp[, -1], order.by = gdp$date)

# Plot GDP data over time
plot.xts(gdp_xts)

# Fill NAs in gdp_xts with the last observation carried forward
gdp_locf <- na.locf(gdp_xts)

# Fill NAs in gdp_xts with the next observation carried backward 
gdp_nocb <- na.locf(gdp_xts, fromLast = TRUE)

# Produce a plot for each of your new xts objects
par(mfrow = c(2, 1))
plot.xts(gdp_locf, major.format = "%Y")
plot.xts(gdp_nocb, major.format = "%Y")

# Query for GDP in 1993 in both gdp_locf and gdp_nocb
gdp_locf["1993"]
gdp_nocb["1993"]

# Fill NAs in gdp_xts using linear approximation
gdp_approx <- na.approx(gdp_xts)

# Plot your new xts object
plot.xts(gdp_approx, major.format = "%Y")

# Query for GDP in 1993 in gdp_approx
gdp_approx["1993"]
