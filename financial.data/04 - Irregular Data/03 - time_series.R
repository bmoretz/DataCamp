# Create merged object with a Europe/London timezone
tz_london <- merge(london, chicago)

# Look at tz_london structure
str(tz_london)

# Create merged object with a America/Chicago timezone
tz_chicago <- merge(chicago, london)

# Look at tz_chicago structure
str(tz_chicago)

# Create a regular date-time sequence
regular_index <- seq(as.POSIXct("2010-01-04 09:00"), as.POSIXct("2010-01-08 16:00"), by = "30 min")

# Create a zero-width xts object
regular_xts <- xts(, order.by = regular_index)

# Merge irregular_xts and regular_xts, filling NA with their previous value
merged_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

# Subset to trading day (9AM - 4PM)
trade_day <- merged_xts["T09:00/T16:00"]

# Split trade_day into days
daily_list <- split(trade_day, f = "days")

# Use lapply to call na.locf for each day in daily_list
daily_filled <- lapply(daily_list, FUN = na.locf)

# Use do.call to rbind the results
filled_by_trade_day <- do.call(rbind, daily_filled)

# Convert raw prices to 5-second prices
xts_5sec <- to.period(intraday_xts, period = "seconds", k = 5)

# Convert raw prices to 10-minute prices
xts_10min <- to.period(intraday_xts, period = "minutes", k = 10)

# Convert raw prices to 1-hour prices
xts_1hour <- to.period(intraday_xts, period = "hours", k = 1)