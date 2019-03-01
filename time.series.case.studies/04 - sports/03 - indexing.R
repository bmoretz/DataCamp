# Extract the day of the week of each observation
weekday <- .indexwday(sports)
head(weekday)

# Generate an index of weekend dates
weekend <- which(.indexwday(sports) == 0 | .indexwday(sports) == 6)

# Subset only weekend games
weekend_games <- sports[weekend]
head(weekend_games)

# Generate a subset of sports data with only homegames
homegames <- sports[sports$homegame == 1]

# Calculate the win/loss average of the last 20 home games
homegames$win_loss_20 <- rollapply(homegames$win_loss, width = 20, FUN = mean)

# Calculate the win/loss average of the last 100 home games
homegames$win_loss_100 <- rollapply(homegames$win_loss, width = 100, FUN = mean)

# Use plot.xts to generate
plot.zoo(homegames[, c("win_loss_20", "win_loss_100")], plot.type = "single", lty = lty, lwd = lwd)
