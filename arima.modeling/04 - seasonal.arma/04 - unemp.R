# Plot unemp 
plot(unemp)

# Difference your data and plot it
d_unemp <- diff(unemp)
plot(d_unemp)

# Seasonally difference d_unemp and plot it
dd_unemp <- diff(d_unemp, lag = 12)
plot(dd_unemp)