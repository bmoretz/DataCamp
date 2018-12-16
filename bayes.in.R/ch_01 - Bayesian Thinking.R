library(TeachBayes)

my_regions <- c(3, 2, 2, 3)
spinner_plot(my_regions)

spinner_probs(my_regions)

# Define a spinner with five regions: regions
regions <- c(1,1,1,1,1)

# Plot the spinner
spinner_plot(regions)

# Show the probability distribution
spinner_probs(regions)

# Define new spinner: regions
regions <- c(2,2,4)

# Simulation 1000 spins: spins
spins <- spinner_data(regions, nsim = 1000 )

# Graph the spin data using bar_plot()
bar_plot(spins)

# Construct frequency table of spins
table(spins)

# Find fraction of spins equal to 2
sum( spins == 2 ) / length( spins )

# Find mean spin value
mean(spins)

# Create the vector of models: Model
Model <- c("Spinner A", "Spinner B")

# Define the vector of prior probabilities: Prior
Prior <- c(0.5, 0.5)

# Define the vector of likelihoods: Likelihood
Likelihood <- c(1 / 2, 1 / 6)

# Make a data frame with variables Model, Prior, Likelihood: bayes_df
bayes_df <- data.frame(Model, Prior, Likelihood)

# Compute the posterior probabilities
bayes_prod <- bayesian_crank(bayes_df)

prior_post_plot(bayes_prod)

# Wrap-up

regA <- c(1, 2, 3)
regB <- c(3, 2, 1)

spinner_plot(regA)
spinner_plot(regB)

# Display the vector of models: Model
Model <- c("Spinner A", "Spinner B")

# Define the vector of prior probabilities: Prior
Prior <- c(0.75, 0.25)

# Define the vector of likelihoods: Likelihood
Likelihood <- c(1 / 2, 1 / 6)

# Make a data frame with variables Model, Prior, Likelihood: bayes_df
bayes_df <- data.frame(Model, Prior, Likelihood)

# Compute the posterior probabilities
bayesian_crank(bayes_df)
