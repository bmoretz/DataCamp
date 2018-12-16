library(ggplot2)

flips <- rbinom(100000, 100, .5)

hist(flips)

flips <- rbinom(100000, 1000, .5)

hist(flips)

# Suppose you flipped 1000 coins, each with a 20 % chance of being heads. What would be the mean and variance of the binomial distribution ?

mean <- 1000 * .2
var <- mean * (1 - .2)

compare_histograms <- function(variable1, variable2) {
	x <- data.frame(value = variable1, variable = "Variable 1")
	y <- data.frame(value = variable2, variable = "Variable 2")
	ggplot(rbind(x, y), aes(value)) + geom_histogram() + facet_wrap(~variable,
		nrow = 2)
}

# Draw a random sample of 100,000 from the Binomial(1000, .2) distribution
binom_sample <- rbinom(100000, 1000, .2)

# Draw a random sample of 100,000 from the normal approximation
normal_sample <- rnorm(100000, 1000 * .2, sqrt(1000 * .2 * ( 1 - .2 ) ))

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, normal_sample)

# simulations from the normal and binomial distributions
binom_sample <- rbinom(100000, 1000, .2)
normal_sample <- rnorm(100000, 200, sqrt(160))

# Use binom_sample to estimate the probability of <= 190 heads
mean( binom_sample <= 190 )

# Use normal_sample to estimate the probability of <= 190 heads
mean(normal_sample <= 190)

# Calculate the probability of <= 190 heads with pbinom
pbinom(190, 1000, .2)

# Calculate the probability of <= 190 heads with pnorm
pnorm(190, 200, sqrt(160))

# Draw a random sample of 100,000 from the Binomial(10, .2) distribution
binom_sample <- rbinom(100000, 10, .2)

# Draw a random sample of 100,000 from the normal approximation
normal_sample <- rnorm(100000, 2, sqrt(1.6))

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, normal_sample)

binomial <- rbinom(100000, 1000, 1 / 1000)

ggplot(, aes(binomial)) +
	geom_bar()

poisson <- rpois(100000, 1)

compare_histograms(binomial, poisson)

# Draw a random sample of 100,000 from the Binomial(1000, .002) distribution
binom_sample <- rbinom(100000, 1000, .002)

# Draw a random sample of 100,000 from the Poisson approximation
poisson_sample <- rpois(100000, 2)

# Compare the two distributions with the compare_histograms function
compare_histograms(binom_sample, poisson_sample)

? dpois

# Simulate 100,000 draws from Poisson(2)
poisson_sample <- rpois(100000, 2)

# Find the percentage of simulated values that are 0
sum(poisson_sample == 0) / length(poisson_sample)

# Use dpois to find the exact probability that a draw is 0
dpois(0, lambda = 2)

# Simulate 100,000 draws from Poisson(1)
X <- rpois(100000, 1)

# Simulate 100,000 draws from Poisson(2)
Y <- rpois(100000, 2)

# Add X and Y together to create Z
Z <- X + Y

# Use compare_histograms to compare Z to the Poisson(3)
compare_histograms(Z, rpois(100000, 3))

# Simulate 100 instances of flipping a 20% coin
flips <- rbinom(100, 1, .2)

# Use which to find the first case of 1 ("heads")
which(flips == 1)[]

# Existing code for finding the first instance of heads
which(rbinom(100, 1, .2) == 1)[1]

# Replicate this 100,000 times using replicate()
replications <- replicate(100000, which(rbinom(100, 1, .2) == 1)[1])

# Histogram the replications with qplot
qplot(replications)

# Replications from the last exercise
replications <- replicate(100000, which(rbinom(100, 1, .2) == 1)[1])

# Generate 100,000 draws from the corresponding geometric distribution
geom_sample <- rgeom(100000, .2)

# Compare the two distributions with compare_histograms
compare_histograms(replications, geom_sample)

# Find the probability the machine breaks on 5th day or earlier
pgeom(4, .1)

# Find the probability the machine is still working on 20th day
1 - pgeom(19, prob = .1)

# Calculate the probability of machine working on day 1-30
still_working <- 1 - pgeom(0:29, .1)

# Plot the probability for days 1 to 30
qplot(1:30, still_working)