# Display the first few lines of the data
head(data)

# Display the column names of the data
colnames(data)

# Plot yahoo data and add title
plot(data[, c("yahoo")], main = "yahoo")

# Replot yahoo data with labels for X and Y axes
plot(data[, c("yahoo")], main = "yahoo",
  xlab = "date", ylab = "price")

# Plot the second time series and change title
plot(data[, "microsoft"], main = "microsoft")

# Replot with same title, add subtitle, use bars
plot(data[, "microsoft"], main = "microsoft",
  sub = "Daily closing price since 2015", type = "h")


# Change line color to red
plot(data[, "microsoft"], main = "microsoft",
  sub = "Daily closing price since 2015", type = "h")
lines(data[, "microsoft"], col = "red")

# Plot two charts on same graphical window
par(mfrow = c(2, 1))
plot(data[, "yahoo"], main = "yahoo")
plot(data[, "microsoft"], main = "microsoft")

# Replot with reduced margin and character sizes
# Plot two charts on same graphical window
par(mfrow = c(2, 1), mex = .6, cex = .8)
plot(data[, "yahoo"], main = "yahoo")
plot(data[, "microsoft"], main = "microsoft")

