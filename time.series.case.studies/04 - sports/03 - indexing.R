# Extract the day of the week of each observation
weekday <- .indexwday(sports)
head(weekday)

# Generate an index of weekend dates
weekend <- which(.indexwday(sports) == 0 | .indexwday(sports) == 6)

# Subset only weekend games
weekend_games <- sports[weekend]
head(weekend_games)

