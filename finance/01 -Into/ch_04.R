# credit_rating character vector
credit_rating <- c("BB", "AAA", "AA", "CCC", "AA", "AAA", "B", "BB")

# Create a factor from credit_rating
credit_factor <- factor(credit_rating)

# Print out your new factor
credit_factor

# Call str() on credit_rating
str(credit_rating)

# Call str() on credit_factor
str(credit_factor)

# Identify unique levels
levels(credit_factor)

# Rename the levels of credit_factor
levels(credit_factor) <- c("2A", "3A", "1B","2B", "3C" )

# Print credit_factor
credit_factor

# Summarize the character vector, credit_rating
summary(credit_rating)

# Summarize the factor, credit_factor
summary(credit_factor)

# Visualize 
plot(credit_factor)

# bucketing

AAA_rank <- runif(100, min = 0, max = 100)

# Create 4 buckets for AAA_rank using cut()
AAA_factor <- cut(x = AAA_rank, breaks = c(0, 25, 50, 75, 100))

head(AAA_factor)

# Rename the levels 
levels(AAA_factor) <- c("low", "medium", "high", "very_high")

# Print AAA_factor
AAA_factor

# Plot AAA_factor
plot(AAA_factor)

summary(AAA_factor)

# Use unique() to find unique words
unique(credit_rating)

# Create an ordered factor
credit_factor_ordered <- factor(credit_rating, ordered = TRUE, levels = c("AAA", "AA", "BB", "B", "CCC"))

# Plot credit_factor_ordered
plot(credit_factor_ordered)

# Remove the A bonds at positions 3 and 7. Don't drop the A level.
keep_level <- credit_factor[-c(3, 7)]

# Plot keep_level
plot(keep_level)

# Remove the A bonds at positions 3 and 7. Drop the A level.
drop_level <- credit_factor[-c(3, 7), drop = TRUE]

# Plot drop_level
plot(drop_level)

# Variables
credit_rating <- c("AAA", "A", "BB")
bond_owners <- c("Dan", "Tom", "Joe")

# Create the data frame of character vectors, bonds
bonds <- data.frame(credit_rating, bond_owners, stringsAsFactors = FALSE)

# Use str() on bonds
str(bonds)

# Create a factor column in bonds called credit_factor from credit_rating
bonds$credit_factor <- factor(bonds$credit_rating, ordered = TRUE, levels = c("AAA", "A", "BB"))

# Use str() on bonds again
str(bonds)
