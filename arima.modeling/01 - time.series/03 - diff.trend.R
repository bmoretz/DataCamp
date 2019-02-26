# Plot globtemp and detrended globtemp
par(mfrow = c(2, 1))
plot(globtemp)

# Plot cmort and detrended cmort
par(mfrow = c(2, 1))
plot(cmort)

# Plot globtemp and detrended globtemp
par(mfrow = c(2, 1))
plot(diff(globtemp))

# Plot diff cmort and detrended cmort
par(mfrow = c(2, 1))
plot(diff(cmort))
