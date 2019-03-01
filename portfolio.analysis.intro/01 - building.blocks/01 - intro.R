# Define ko_pep 
ko_pep <- ko / pep

# Make a time series plot of ko_pep
plot.zoo(ko_pep)

# Add as a reference, a horizontal line at 1
abline(h = 1)

# Define the vector values
values <- c(4000, 4000, 2000)

# Define the vector weights
weights <- values / sum(values)

# Print the resulting weights
print(weights)

# Define marketcaps
marketcaps <- c(5, 8, 9, 20, 25, 100, 100, 500, 700, 2000)

# Compute the weights
weights <- marketcaps / sum(marketcaps)

# Inspect summary statistics
summary(weights)

# Create a barplot of weights
barplot(weights)

# Vector of initial value of the assets
in_values <- c(1000, 5000, 2000)

# Vector of final values of the assets
fin_values <- c(1100, 4500, 3000)

# Weights as the proportion of total value invested in each assets
weights <- in_values / sum(in_values)

# Vector of simple returns of the assets 
returns <- (fin_values - in_values) / in_values

# Compute portfolio return using the portfolio return formula
preturns <- sum(weights * returns)

# Suppose that you have an investment horizon of two periods. In the first period you make a 10% return. But in the second period you take a loss of 5%.

((1 + .10) * (1 + -.05) - 1) * 1000

