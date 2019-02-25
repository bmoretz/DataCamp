# Plot the annual sunspot numbers
autoplot(sunspot.year)
ggAcf(sunspot.year)

# Save the lag corresponding to maximum autocorrelation
maxlag_sunspot <- 1

# Plot the traffic on the Hyndsight blog
autoplot(hyndsight)
ggAcf(hyndsight)

# Save the lag corresponding to maximum autocorrelation
maxlag_hyndsight <- 7