# Split redsox_xts win_loss data into years 
redsox_seasons <- split(redsox_xts$win_loss, f = "years")

# Use lapply to calculate the cumulative mean for each season
redsox_ytd <- lapply(redsox_seasons, cummean)

# Use do.call to rbind the results
redsox_winloss <- do.call(rbind, redsox_ytd)

# Plot the win_loss average for the 2013 season
plot.xts(redsox_winloss["2013"], ylim = c(0, 1))

# Select only the 2013 season
redsox_2013 <- redsox_xts["2013"]

# Use rollapply to generate the last ten average
lastten_2013 <- rollapply(redsox_2013$win_loss, width = 10, FUN = mean)

# Plot the last ten average during the 2013 season
plot.xts(lastten_2013, ylim = c(0, 1))
