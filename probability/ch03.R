# We see 11 out of 20 flips from a coin that is either fair(50 % chance of heads) or biased(75 % chance of heads) .
# How likely is it that the coin is fair ? Answer this by simulating 50, 000 fair coins and 50, 000 biased coins.

# Simulate 50000 cases of flipping 20 coins from fair and from biased
fair <- rbinom(50000, 20, .5)
biased <- rbinom(50000, 20, .75)

# How many fair cases, and how many biased, led to exactly 11 heads?
fair_11 <- sum(fair == 11)
biased_11 <- sum(biased == 11)

# Find the fraction of fair coins that are 11 out of all coins that were 11
fair_11 / (fair_11 + biased_11)

rbinom(50000, 20, .5)

# We see 14 out of 20 flips are heads, and start with a 80 % chance the coin is fair and a 20 % chance it is biased to 75%.
# You 'll solve this case with simulation, by starting with a "bucket" of 10,000 coins, where 8,000 are fair and 2,000 are biased, and flipping each of them 20 times.

# Simulate 8000 cases of flipping a fair coin, and 2000 of a biased coin
fair_flips <- rbinom(8000, 20, .5)
biased_flips <- rbinom(2000, 20, .75)

# Find the number of cases from each coin that resulted in 14/20
fair_14 <- sum(fair_flips == 14)
biased_14 <- sum(biased_flips == 14)

# Use these to estimate the posterior probability
fair_14 / (fair_14 + biased_14)

# Simulate 80,000 draws from fair coin, 10,000 from each of high and low coins
flips_fair <- rbinom(80000, 20, .5)
flips_high <- rbinom(10000, 20, .75)
flips_low <- rbinom(10000, 20, .25)

# Compute the number of coins that resulted in 14 heads from each of these piles
fair_14 <- sum(flips_fair == 14)
high_14 <- sum(flips_high == 14)
low_14 <- sum(flips_low == 14)

# Use dbinom to calculate the probability of 11/20 heads with fair or biased coin
probability_fair <- dbinom(11, 20, .5)
probability_biased <- dbinom(11, 20, .75)

# Calculate the posterior probability that the coin is fair
probability_fair / (probability_fair + probability_biased)

# Find the probability that a coin resulting in 14/20 is fair
dbinom(14, 20, .5)

# Find the probability that a coin resulting in 18/20 is fair
dbinom(18, 20, .5)

# Find the probability that a coin resulting in 14/20 is fair
dbinom(14, 20, .5) / (dbinom(14, 20, .5) + dbinom(14, 20, .75))

# Find the probability that a coin resulting in 18/20 is fair
dbinom(18, 20, .5) / (dbinom(18, 20, .5) + dbinom(18, 20, .75))

# Bayes Theorem

# Use dbinom to find the probability of 16/20 from a fair or biased coin
probability_16_fair <- dbinom(16, 20, .5)
probability_16_biased <- dbinom(16, 20, .75)

# Use Bayes' theorem to find the posterior probability that the coin is fair
(probability_16_fair * .99 / (probability_16_fair * .99 + probability_16_biased * .01))