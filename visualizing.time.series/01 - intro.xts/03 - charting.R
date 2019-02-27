# Create period to hold the 3 months of 2015
period <- c("2015-01/2015-03")

# Highlight the first three months of 2015 
chart.TimeSeries(data$citigroup, period.areas = period)

# Highlight the first three months of 2015 in light grey
chart.TimeSeries(data$citigroup, period.areas = period, period.color = "lightgrey")

# Plot the microsoft series
plot(data$microsoft, main = "Dividend date and amount")

# Add the citigroup series
lines(data$citigroup, col = "orange", lwd = 2)

# Add a new y axis for the citigroup series
axis(4, pretty(data$citigroup), col = "orange")