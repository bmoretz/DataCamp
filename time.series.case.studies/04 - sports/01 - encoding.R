# View summary information about your redsox data
summary(redsox)

# Convert the date column to a time-based format
redsox$date <- as.Date(redsox$date)

# Convert your red sox data to xts
redsox_xts <- as.xts(redsox[, -1], order.by = redsox$date)

# Plot the Red Sox score and the opponent score over time
plot.zoo(redsox_xts[, c("boston_score", "opponent_score")])

# Generate a new variable coding for red sox wins
redsox_xts$win_loss <- ifelse(redsox_xts$boston_score > redsox_xts$opponent_score, 1, 0)

# Identify the date of the last game each season
close <- endpoints(redsox_xts, on = "years")

# Calculate average win/loss record at the end of each season
period.apply(redsox_xts[, "win_loss"], close, mean)
