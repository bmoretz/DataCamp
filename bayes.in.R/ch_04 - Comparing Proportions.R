library(TeachBayes)
library(arm)

# 
pW <- .5
pM <- .5

prior <- testing_prior(lo = .1, hi = .9,
						n_values = 9, pequal = mean(pW,pM))

round(prior, 3)

draw_two_p(prior)

Likelihood <- dbinom(10, size = 20, prob = pW) * dbinom(14, size = 20, pM)

post <- two_p_update(prior, c(10, 10), c(14, 6))

draw_two_p(post)

d <- two_p_summarize(post)

prob_plot(d)


# Define a uniform prior on all 25 pairs: prior
prior <- testing_prior( 0.1, 0.9, 5, uniform = TRUE)

# Display the prior matrix
prior

# Graph the prior
draw_two_p(prior)

# Find the probability distribution of pN - pS: d_NS
d_NS = two_p_summarize(prior)

# Graph this distribution
prob_plot(d_NS)


# Define a uniform prior on all 25 pairs: prior
prior <- testing_prior(0.1, 0.9, 5, uniform = TRUE)

# Define the data: s1f1, s2f2
s1f1 <- c(12,8)
s2f2 <- c(17,3)

# Compute the posterior: post
post <- two_p_update(prior, s1f1, s2f2)

# Graph the posterior
draw_two_p(post)

###################################
## Independent beta priors
###################################

# Find the probability distribution of pN - pS: d_NS
d_NS <- two_p_summarize(post)

# Graph this distribution
prob_plot(d_NS)

# Simulate 1000 values from the prior on pS: sim_pS
sim_pS <- rbeta(1000, 4.91, 3.38)

# Simulate 1000 values from the prior on pN: sim_pN
sim_pN <- rbeta(1000, 4.91, 3.38)

# For each pair of proportions, compute the difference: d_NS
d_NS <- sim_pN - sim_pS

# Plot a histogram of the values in d_NS
hist(d_NS)

# Find the probability d_NS is positive
sum( d_NS > 0 ) / 1000

# Find a 90% probability interval for d_NS
quantile(d_NS, c(0.05, 0.95))

###################################
## Posterior of proportions
###################################

# Define the number of successes and number of failures: s1f1, s2f2
s1f1 <- c(12, 8)
s2f2 <- c(17, 3)

# Find the prior beta shape parameters for pS and pN:
pS_prior <- c(1, 1)
pN_prior <- c(1, 1)

# Find the posterior beta shape parameters for pS: pS_shape
pS_shape <- c(1 + 12, 1 + 8)

# Find the posterior beta shape parameters for pN: pN_shape
pN_shape <- c(1 + 17, 1 + 3)

# Simulate 1000 draws from the posterior: sim_pS, sim_pN
sim_pS <- rbeta(1000, 13, 9)
sim_pN <- rbeta(1000, 18, 4)

# Construct a scatterplot of the posterior
plot(sim_pS, sim_pN)

###################################
## Comparison of proportions
###################################

# Simulate 1000 draws from the posterior: sim_pS, sim_pN
sim_pS <- rbeta(1000, 13, 9)
sim_pN <- rbeta(1000, 18, 4)

# For each pair of proportions, compute the ratio: r_NS
r_NS <- sim_pN / sim_pS

# Plot a histogram of the values in r_NS
hist(r_NS)

# Find the probability r_NS is larger than 1
sum(r_NS > 1) / 1000

# Find a 80% probability interval for r_NS
quantile(r_NS, c(.1, .9))

###################################
## Uniform prior
###################################

# Collect reaction times: times
times <- c(240, 267, 308, 275, 271,
		   268, 258, 295, 315, 262)

# Fit a normal model: fit
fit <- lm(times ~ 1)

# Simulate 1000 from posterior: sim_fit
sim_fit <- sim(fit, n.sims = 1000)

# Extract the simulated values of M and S: M_sim, s_sim
M_sim <- coef(sim_fit)
s_sim <- sigma.hat(sim_fit)

# Construct a scatterplot of simulated values
plot(M_sim, s_sim)

###################################
## Learning about a percentile
###################################

# Collect reaction times: times
times <- c(240, 267, 308, 275, 271,
		   268, 258, 295, 315, 262)

# Fit a normal model: fit
fit <- lm(times ~ 1)

# Simulate 1000 from posterior:  sim_fit
sim_fit <- sim(fit, n.sims = 1000)

# Extract the simulated values of M and S: M_sim, s_sim
M_sim <- coef(sim_fit)
s_sim <- sigma.hat(sim_fit)

# Compute values of the 75th percentile: Q75
Q75 <- M_sim + 0.674 * s_sim

# Construct histogram of the posterior of Q75
hist(Q75)

# Find a 70% probability interval for Q75
quantile(Q75, c(.15, .85))

###################################
## Two group model
###################################

jim <- data.frame(Person = "Jim", Time = c(240, 267, 308, 275, 271, 268, 258, 295, 315, 262))
steve <- data.frame(Person = "Steven", Time = c(279, 241, 225, 252, 288, 242, 281, 254, 263, 276))

dd <- rbind(jim,steve)

# Perform a regression fit of Time with Person as a covariate: fit
fit <- lm(Time ~ Person, data = dd)

# Simulate 1000 values from the posterior distribution: sim_fit
sim_fit <- sim(fit, n.sims = 1000 )

# Extract simulated draws of beta and S: beta_sim, s_sim
beta_sim <- coef(sim_fit)
s_sim <- sigma.hat(sim_fit)

# Construct a scatterplot of the posterior distribution of (beta0, beta1)
plot(beta_sim)

###################################
## Standardized effect inference
###################################

# Perform a regression fit of Time with Person as a covariate: fit
fit <- lm(Time ~ Person, data = dd)

# Simulate 1000 values from the posterior distribution: sim_fit
sim_fit <- sim(fit, n.sims = 1000)

# Extract simulated draws of beta and S:  beta_sim, s_sim
beta_sim <- coef(sim_fit)
s_sim <- sigma.hat(sim_fit)

# Compute simulated values of the standardized change: s_delta
s_delta <- beta_sim[, 2] / s_sim

# Find 90% interval estimate for s_delta
quantile(s_delta, c(0.05, 0.95))