# Create vector of cash flows
cf <- c(5, 5, 5, 5, 105)

# Convert to data frame
cf <- data.frame(cf)
cf

# Add column t
cf$t <- as.numeric(rownames(cf))

# Calculate pv_factor
cf$pv_factor <- 1 / (1 + 0.06) ^ cf$t

# Calculate pv
cf$pv <- cf$cf * cf$pv_factor

# Calculate the bond price
sum(cf$pv)

