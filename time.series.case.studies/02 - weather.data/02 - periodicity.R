# Subset your temperature data to include only 2010 through 2015: temps_xts_2
temps_xts_2 <- temps_xts["2010/2015"]

# Use to.period to convert temps_xts_2 to monthly periodicity
temps_monthly <- to.period(temps_xts_2, period = "months", OHLC = FALSE, indexAt = "firstof")

# Compare the periodicity and duration of temps_monthly and flights_xts 
periodicity(temps_monthly)
periodicity(flights_xts)

# Split temps_xts_2 into separate lists per month
monthly_split <- split(temps_xts_2$mean, f = "months")

# Use lapply to generate the monthly mean of mean temperatures
mean_of_means <- lapply(monthly_split, FUN = mean)

# Use as.xts to generate an xts object of average monthly temperature data
temps_monthly <- as.xts(as.numeric(mean_of_means), order.by = index)

# Compare the periodicity and duration of your new temps_monthly and flights_xts 
periodicity(temps_monthly)
periodicity(flights_xts)

# Use merge to combine your flights and temperature objects
flights_temps <- merge(flights_xts, temps_monthly)

# Examine the first few rows of your combined xts object
head(flights_temps)

# Use plot.zoo to plot these two columns in a single panel
plot.zoo(flights_temps[, c("pct_delay", "temps_monthly")], plot.type = "single", lty = lty)
legend("topright", lty = lty, legend = labels, bg = "white")

# Confirm the periodicity and duration of the vis and wind data
periodicity(vis)
periodicity(wind)

# Merge vis and wind with your existing flights_temps data
flights_weather <- merge(flights_temps, vis, wind)

# View the first few rows of your flights_weather data
head(flights_weather)
