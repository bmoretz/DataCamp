# Create pv
pv <- 100

# Create r
r <- 0.10

# Calculate fv1
fv1 <- pv * (1 + r)

# Calculate fv2
fv2 <- pv * (1 + r) ^ 2

# Calculate pv1
pv1 <- fv1 / (1 + r)

# Calculate pv2
pv2 <- fv2 / (1 + r) ^ 2

# Print pv1 and pv2
print(pv1)
print(pv2)

# Create vector of cash flows
cf <- c(5, 5, 5, 5, 105)

# Convert to data frame
cf <- data.frame(cf)
cf
