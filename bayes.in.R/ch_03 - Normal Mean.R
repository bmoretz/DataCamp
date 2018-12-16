library(TeachBayes)

# Place possible values of M in a vector: Model
Model <- seq(250, 290, by = 10)

# Construct a uniform probability vector: Prior1
Prior1 <- rep(.2,5)

# Graph the prior using function prob_plot()
prob_plot(data.frame(Model,Prior1))

# Construct a different probability distribution: Prior2
Prior2 <- c(.3,.3,.2,.1,.1)

# Graph the prior using function prob_plot()
prob_plot(data.frame(Model, Prior2))

## ################################
## Normal Uniform Prior
## ################################

# Define models and prior: M, Prior
M <- seq(250, 290, by = 10)
Prior <- rep(.2, 5)

# Collect observations
times <- c(240, 267, 308, 275, 271,
		   268, 258, 295, 315, 262)

# Compute ybar and standard error
ybar <- mean(times);
n <- 10
sigma <- 20;
se <- sigma / sqrt(n)

# Compute likelihoods using dnorm(): Likelihood
Likelihood <- dnorm(ybar, M, se)

# Collect the vectors M, Prior, Likelihood in a data frame: bayes_df
bayes_df <- data.frame(M, Prior, Likelihood)

# Use bayesian_crank to compute the posterior probabilities: bayes_df
bayes_df <- bayesian_crank(bayes_df)

bayes_df

# Use prior_post_plot() to graph the prior and posterior probabilities
prior_post_plot(bayes_df)


## ################################
## Continuous Prior
## ################################

# Specify the 0.02 quantile of M: quantile1
quantile1 <- list(p = 0.02, x = 240 )

# Specify the 0.60 quantile of M: quantile2
quantile2 <- list(p = 0.60, x = 280)

# Find the normal parameters that match the two quantiles
normal_par <- normal.select(quantile1, quantile2 )

# Plot the normal curve using the normal_draw() function
normal_draw(normal_par)

# Bayes

# Collect observations
times <- c(240, 267, 308, 275, 271,
		   268, 258, 295, 315, 262)

# Compute ybar and standard error
ybar <- mean(times)
sigma <- 20;
se <- sigma / sqrt(10)

# Define mean and standard error: Data
Data <- c(ybar, se)

# Define mean and standard deviation of prior: Prior
Prior <- c(260, 10)

# Use normal_update() function: Posterior
Posterior <- normal_update(Prior, Data)

# Construct plot of prior and posterior
many_normal_plots(list(c(Prior[1], Prior[2]), c(Posterior[1], Posterior[2])))

# Define mean and standard error: Data
Data <- c(275.9, 6.32)

# Compute 90% confidence interval: C_Interval
C_Interval <- c(Data[1] - 1.645 * Data[2], Data[1] + 1.645 * Data[2])

# Find the length of the confidence interval
diff(C_Interval)

# Define mean and standard deviation of posterior: Posterior
Posterior <- c(271.35, 5.34)

# Display a 90% probability interval
normal_interval(.9, Posterior)

# Compute the 90% probability interval: B_Interval
B_Interval <- qnorm(c(0.05, 0.95), mean = Posterior[1], sd = Posterior[2])

# Compute the length of the Bayesian interval
diff(B_Interval)

# is Jim slow?
pnorm(275, mean = 270.5, sd = 5.8, lower.tail = FALSE)

## ################################
## Posterior simulation
## ################################

# Simulate 1000 values from the posterior curve: M_sim
M_sim <- rnorm(1000, 270.5, 5.8)

# Compute the posterior standard deviation 
sd(M_sim)

# Compute the probability that M is smaller than 260
1 - dnorm(260, 270.5, 5.8)

sum(M_sim < 260) / 1000

# Find a 70 percent probability interval for M
qnorm(c(.15, .85), 270.5, 5.8)
quantile(M_sim, c(.15, .85))



# Simulate 1000 draws from John's posterior density: M_sim
M_sim <- rnorm(1000, 270.5, 5.8)

# Simulate 1000 draws from the predictive density: y_sim
y_sim <- rnorm(1000, M_sim, 20)

# Compute the probability I score less than 250
sum( y_sim < 250 ) / 1000

# Find a 90 percent prediction interval for my score
quantile(y_sim, c(.05,0.95))
