# Calculate skewness and kurtosis of djx
skewness(djx)
kurtosis(djx)

# Carry out a Jarque-Bera test for djx
jarque.test(djx)

# Calculate skewness and kurtosis of djreturns 
s <- apply(djreturns, FUN = skewness, MARGIN = 2)
k <- apply(djreturns, FUN = kurtosis, MARGIN = 2)

# Plot k against s and add text labels to identify stocks
plot(s, k, type = "n")
text(s, k, names(s), cex = 0.6)

# Carry out Jarque-Bera tests for each constituent in djreturns
apply(djreturns, FUN = jarque.test, MARGIN = 2)

# Calculate weekly and monthly log-returns from djx_d
djx_w <- apply.weekly(djx_d, colSums)
djx_m <- apply.monthly(djx_d, colSums)

# Calculate the p-value for each series in djx_d
apply(djx_d, 2, function(v) { jarque.test(v)$p.value })

# Calculate the p-value for each series in djx_w
apply(djx_w, 2, function(v) { jarque.test(v)$p.value })

# Calculate the p-value for each series in djx_m
apply(djx_m, 2, function(v) { jarque.test(v)$p.value })

# Calculate a 21-day moving sum of djx
djx21 <- rollapplyr(djx, width = 21, FUN = sum)[-(1:20)]

# Calculate a 63-day moving sum of djx
djx63 <- rollapplyr(djx, width = 63, FUN = sum)[-(1:62)]

# Merge the three series and plot
djx2 <- merge(djx, djx21, djx63, all = FALSE)
plot.zoo(djx2)

# Compute the skewness and kurtosis for each series in djx2
apply(djx2, 2, kurtosis)
apply(djx2, 2, skewness)

# Conduct the Jarque-Bera test to each series in djx2
apply(djx2, 2, jarque.test)

# Fit a Student t distribution to djx
tfit <- fit.st(djx)

# Define tpars, nu, mu, and sigma
tpars <- tfit$par.ests
nu <- tpars["nu"]
mu <- tpars["mu"]
sigma <- tpars["sigma"]

# Plot a histogram of djx
hist(djx, nclass = 20, probability = TRUE, ylim = range(0, 40))

# Compute the fitted t density at the values djx
yvals <- dt((djx - mu) / sigma, df = nu) / sigma

# Superimpose a red line to show the fitted t density
lines(djx, yvals, col = "red")

# Plot the daily log-return series in fx_d
plot.zoo(fx_d)

# Apply the Jarque-Bera test to each of the series in fx_d
apply(fx_d, FUN = jarque.test, MARGIN = 2)

# Plot the monthly log-return series in fx_m
plot.zoo(fx_m)

# Apply the Jarque-Bera test to each of the series in fx_m
apply(fx_m, FUN = jarque.test, MARGIN = 2)

# Fit a Student t distribution to each of the series in fx_m
apply(fx_m, MARGIN = 2, function(v) { fit.st(v)$par.ests })

# Plot the interest-rate return series zcbx_m and zcbx2_m
plot.zoo(zcbx_m, type = "h")
plot.zoo(zcbx2_m, type = "h")

# Make Q-Q plots of the 3rd component series of zcbx_m and zcbx2_m
qqnorm(zcbx_m[, 3])
qqnorm(zcbx2_m[, 3])

# Compute the kurtosis of each series in zcbx_m and zcbx2_m
apply(zcbx_m, FUN = kurtosis, MARGIN = 2)
apply(zcbx2_m, FUN = kurtosis, MARGIN = 2)

# Conduct the Jarque-Bera test on each series in zcbx_m and zcbx2_m
apply(zcbx_m, FUN = jarque.test, MARGIN = 2)
apply(zcbx2_m, FUN = jarque.test, MARGIN = 2)

