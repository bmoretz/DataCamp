# Partition plotting area into 3 pieces
par(mfrow = c(1, 3))

# Plot djx_extremes
plot(djx_extremes, type = "h")

# Compute the spaces between the times of the extremes
djx_spaces <- diff(time(djx_extremes))

# Make a histogram of these spaces
hist(as.numeric(djx_spaces))

# Make a Q-Q plot of djx_spaces against exp_quantiles
qqplot(exp_quantiles, djx_spaces)

# Carry out the previous 4 steps for iid_extremes
plot(iid_extremes, type = "h")
iid_spaces <- diff(time(iid_extremes))
hist(as.numeric(iid_spaces))
qqplot(exp_quantiles, iid_spaces)

# Make a time series plot of indexes with plot.zoo and a pairwise scatterplot with pairs
plot.zoo(indexes)
pairs(as.zoo(indexes))

# Calculate the sample correlation matrix of indexes
cor(indexes)

# Plot the sample acfs and cross-correlation functions for the returns in indexes
acf(indexes)

# Plot the sample acfs and cross-correlations functions for the absolute values of indexes
acf(abs(indexes))

# Plot fx and fx_w
plot.zoo(fx, type = "h")
plot.zoo(fx_w, type = "h")

# Make acf plots of fx and the absolute values of fx
acf(fx)
acf(abs(fx))

# Apply the Ljung-Box test to the components of fx and their absolute values
apply(fx, 2, Box.test, lag = 10, type = "Ljung")
apply(abs(fx), 2, Box.test, lag = 10, type = "Ljung")

# Make acf plots of fx_w and the absolute values of fx_w
acf(fx_w)
acf(abs(fx_w))

# Apply the Ljung-Box test to the components of fx_w and their absolute values
apply(fx_w, 2, Box.test, lag = 10, type = "Ljung")
apply(abs(fx_w), 2, Box.test, lag = 10, type = "Ljung")

# Make acf plots of zcb_x and the absolute values of zcb_x
acf(zcb_x)
acf(abs(zcb_x))

# Apply the Ljung-Box test to the components of zcb_x and their absolute values
apply(zcb_x, 2, Box.test, lag = 10, type = "Ljung")
apply(abs(zcb_x), 2, Box.test, lag = 10, type = "Ljung")

# Make acf plots of zcbx_m and the absolute values of zcbx_m
acf(zcbx_m)
acf(abs(zcbx_m))

# Apply the Ljung-Box test to the components of zcbx_m and their absolute values
apply(zcbx_m, 2, Box.test, lag = 10, type = "Ljung")
apply(abs(zcbx_m), 2, Box.test, lag = 10, type = "Ljung")

