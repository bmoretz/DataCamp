library(xts)
library(zoo)

# Add a quarterly difference in gdp
gdp$quarterly_diff <- diff(gdp$gdp, lag = 1, differences = 1)

# Split gdp$quarterly_diff into years
gdpchange_years <- split(gdp$quarterly_diff, f = "years")

# Use lapply to calculate the cumsum each year
gdpchange_ytd <- lapply(gdpchange_years, FUN = cumsum)

# Use do.call to rbind the results
gdpchange_xts <- do.call(rbind, gdpchange_ytd)

# Plot cumulative year-to-date change in GDP
plot.xts(gdpchange_xts, type = "h")

# Use rollapply to calculate the rolling yearly average US unemployment
unemployment$year_avg <- rollapply(unemployment$us, width = 12, FUN = mean)

# Plot all columns of US unemployment data
plot.zoo(unemployment[, c("us", "year_avg")], plot.type = "single", lty = lty, lwd = lwd)

# Add a one-year lag of MA unemployment
unemployment$ma_yearlag <- lag(unemployment$ma, k = 12)

# Add a six-month difference of MA unemployment
unemployment$ma_sixmonthdiff <- diff(unemployment$ma, lag = 6, differences = 1)

# Add a six-month rolling average of MA unemployment
unemployment$ma_sixmonthavg <- rollapply(unemployment$ma, width = 6, FUN = mean)

# Add a yearly rolling maximum of MA unemployment
unemployment$ma_yearmax <- rollapply(unemployment$ma, width = 12, FUN = max)

# View the last year of unemployment data
tail(unemployment, 1)
