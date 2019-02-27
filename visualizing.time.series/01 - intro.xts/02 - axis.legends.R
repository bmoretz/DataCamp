# Plot the "microsoft" series
plot(data$microsoft, main = "Stock prices since 2015")

# Add the "dow_chemical" series in red
lines(data$dow_chemical, col = "red")

# Add a Y axis on the right side of the chart
axis(4, pretty(data$dow_chemical))

# Add a legend in the bottom right corner
legend(x = "bottomright",
  legend = c("microsoft", "dow_chemical"),
  col = c("black", "red"),
  lty = c(1, 1))

# Plot the "citigroup" time series
plot(data$citigroup, main = "Citigroup")

# Create vert_line to identify January 4th, 2016 in citigroup
vert_line <- which(index(data$citigroup) == as.Date("2016-01-04"))

# Add a red vertical line using vert_line
abline(v = .index(data$citigroup)[vert_line], col = "red")

# Create hori_line to identify average price of citigroup
hori_line <- mean(data$citigroup)

# Add a blue horizontal line using hori_line
abline(h = hori_line, col = "blue")

# Create period to hold the 3 months of 2015
period <- c("2015-01/2015-03")

# Highlight the first three months of 2015 
chart.TimeSeries(data$citigroup, period.areas = period)

# Highlight the first three months of 2015 in light grey
chart.TimeSeries(data$citigroup, period.areas = period, period.color = "lightgrey")

# Same plot as the previous exercise
plot(data$microsoft, main = "Dividend date and amount")
lines(data$citigroup, col = "orange", lwd = 2)
axis(side = 4, at = pretty(data$citigroup), col = "orange")

# Create the two legend strings
micro <- paste0("Microsoft div. of ", micro_div_value, " on ", micro_div_date)
citi <- paste0("Citigroup div. of ", citi_div_value, " on ", citi_div_date)

# Create the legend in the bottom right corner
legend(x = "bottomright", legend = c(micro, citi), col = c("black", "orange"), lty = c(1, 1))
