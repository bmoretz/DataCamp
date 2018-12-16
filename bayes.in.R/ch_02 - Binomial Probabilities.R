library(LearnBayes)

quantile1 = list(p = .025, x = 0.05) # the 2.5% quantile should be 0.05
quantile2 = list(p = .975, x = 0.2) # the 97.5% quantile should be 0.2
beta.select(quantile1, quantile2)

# Define the values of the proportion: P
P <- c(0.5, 0.6, 0.7, 0.8, 0.9)

# Define Madison's prior: Prior
Prior <- c(0.3, 0.3, 0.2, 0.1, 0.1)

# Compute the likelihoods: Likelihood
Likelihood <- dbinom(16, size = 20, prob = P)

# Create Bayes data frame: bayes_df
bayes_df <- data.frame(P, Prior, Likelihood )

# Compute the posterior probabilities: bayes_df
bayes_df <- bayesian_crank(bayes_df)

bayes_df

# Graphically compare the prior and posterior
prior_post_plot(bayes_df)

# Rebekah's belief about P, the proportion of college women who believe they are overweight, 
# is described by a beta curve with shape parameters a = 8.13 and b = 3.67.

# beta curve
beta_draw(c(8.13, 3.67))

# Find the probability that P is smaller than 0.85
pbeta(0.85, 8.13, 3.67)

# Find the probability that P is larger than 0.85
1 - pbeta(0.85, 8.13, 3.67)

# Find the 0.75 quantile of P
qbeta(0.75, 8.13, 3.67)

# prior median is 0.70 . This is the value such that the actual proportion P is equally likely to be smaller or larger than it.
# the 90 th percentile is 0.85 . This is the value such that she is 90 % sure P is smaller than it.

quantile1 <- list(p = 0.5, x = 0.70) # median value ( .5 ) = .70
quantile2 <- list(p = 0.9, x = 0.85) # 90th percentile is .85

beta.select(quantile1, quantile2)

# Specify that the 0.25 quantile of P is equal to 0.7: quantile1
quantile1 <- list( p = .25, x = .7)

# Specify that the 0.75 quantile of P is equal to 0.85: quantile2
quantile2 <- list( p = .75, x = 0.85 )

# Find the beta shape parameters matching the two quantiles: ab
ab <- beta.select(quantile1, quantile2)

# Plot the beta curve using the beta_draw() function
beta_draw(ab)

# Harry's shape parameters for his prior: ab
ab <- c(3, 3)

beta_draw(ab)

# Vector of successes and failures: sf
sf <- c(16, 4)

# Harry's shape parameters for his posterior: ab_new
ab_new <- ab + sf

# Graph Harry's posterior
beta_draw(ab_new)

# Vector of beta parameters for Harry: ab
ab <- c(19, 7)

# Compute probability that P is smaller than 0.70
pbeta(0.70, ab[1], ab[2])

# Show the area that is computed
beta_area(0, .70, ab)

# Confidence Interval

y <- 12; n <- 20

p_hat <- y / n; ( se <- sqrt(p_hat * (1 - p_hat)/n))

(CI <- c(p_hat - 1.645 * se, p_hat + 1.645 * se))

# Interval Estimates
qbeta(c(0.05, 0.95), 24.13, 7.67)
beta_interval(0.90, c(24.13, 7.67))

# Vector of beta parameters for Harry: ab
ab <- c(19, 7)

# Compute 90 percent interval
qbeta(c(0.05, 0.95), 19, 7)

# Show the interval that is computed
beta_interval(0.90, ab)

# Classic CI

classical_binom_ci <- function(y, n, conf.level = 0.95) {
	s <- y + 2
	f <- n - y + 2
	n_new <- n + 4
	phat <- s / n_new
	se <- sqrt(phat * (1 - phat) / n_new)
	z <- qnorm(1 - (1 - conf.level) / 2)
	c(phat - z * se, phat + z * se)
}

# Define the number of successes and sample size: y, n
y <- 16
n <- 20

# Construct a 90 percent confidence interval
classical_binom_ci(16, 20, .90)

# Define the shape parameters for a uniform prior: ab
ab <- c(1, 1)

# Find the shape parameters of the posterior: ab_new
ab_new <- c(1 + y, 1 + n - y)

# Find a 90% Bayesian probability interval
qbeta(c(0.05, 0.95), ab_new[1], ab_new[2])

# Posterior Simulation
sim_p <- rbeta(1000, 16.91, 11.38)

hist(sim_p, freq = FALSE)
curve(dbeta(x, 16.91, 11.38), add = TRUE, col = "red", lwd = 3)

(prob <- sum(sim_p < 0.5) / 1000)

pbeta(0.5, 16.91, 11.38)

quantile(sim_p, c(0.05, 0.95))

sim_logit <- log(sim_p / (1 - sim_p))

hist(sim_logit, freq = FALSE)

quantile(sim_logit, c(0.10, 0.90))

# Vector of beta parameters for Harry: ab
ab <- c(19,7)

# Simulate 1000 draws from the beta posterior: p_sim
p_sim <- rbeta(1000, ab[1], ab[2])

# Construct a histogram of the simulated values
hist(p_sim, freq = FALSE)

# Compute the probability that P is larger than 0.7
sum( p_sim > 0.7 ) / 1000

# Find a 90% probability interval
quantile(p_sim, c(0.05, 0.95))

# Vector of beta parameters for Harry: ab
ab <- c(19, 7)

# Simulate 1000 draws from the beta posterior: p_sim
p_sim <- rbeta(1000, ab[1], ab[2])

# Compute the odds-ratio: or_sim
or_sim <- p_sim / ( 1 - p_sim)

# Construct a histogram of the simulated values of or_sim
hist(or_sim, freq = FALSE)

# Find the probability the odds ratio is greater than 2
sum( or_sim > 2 ) / 1000

# Find a 90% probability interval for the odds ratio
quantile(or_sim, c(0.05, 0.95))