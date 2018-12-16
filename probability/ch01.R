rbinom(1, 10, .5) #

rbinom(10, 10, .5)

summary(rbinom(10, 10, .5))

rbinom(10, 10, .8)
rbinom(10, 10, .2)

# Generate 10 separate random flips with probability .3
rbinom(10, 1, .3)

# Generate 100 occurrences of flipping 10 coins, each with 30% probability
rbinom(100, 10, .3)

flips <- rbinom(100000, 10, .5)

hist(flips)

mean(flips == 5)

dbinom(5, 10, .5)

dbinom(6, 10, .5)

mean(flips <= 4)

pbinom(4, 10, .5)

# Calculate the probability that 2 are heads using dbinom
dbinom(2, 10, .3)

# Confirm your answer with a simulation using rbinom
mean(rbinom(10000, 10, .3) == 2)

# Calculate the probability that at least five coins are heads
1 - pbinom(5, 10, .3 )

# Confirm your answer with a simulation of 10,000 trials
mean(rbinom(10000, 1, .3) == 1)

# If you flip ten coins that each have a 30% probability of heads, what is the probability at least five are heads?

# Calculate the probability that at least five coins are heads
1 - pbinom(4, 10, .3)

# Confirm your answer with a simulation of 10,000 trials
mean(rbinom(10000, 10, .3) >= 5)

# What is the expected value of a binomial distribution where 25 coins are flipped, each having a 30 % chance of heads ?
mean( rbinom(25, 1, .3) == 1 )

# Calculate the expected value using the exact formula
25 * .3

# Confirm with a simulation using rbinom

mean(rbinom(10000, 25, .3))

# What is the variance of a binomial distribution where 25 coins are flipped, each having a 30 % chance of heads ?

# Calculate the variance using the exact formula
( 25 * .3 ) * ( 1  - .3 )

# Confirm with a simulation using rbinom
var( rbinom( 10000, 25, .3 ) )