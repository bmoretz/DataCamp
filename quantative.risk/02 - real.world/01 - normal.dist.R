# Calculate average and standard deviation of djx
mu <- mean(djx)
sigma <- sd(djx)

# Plot histogram of djx
hist(djx, nclass = 20, probability = TRUE)

# Add the normal density as a red line to histogram
lines(djx, dnorm(djx, mu, sigma), col = "red")

# Plot non-parametric KDE of djx
plot(density(djx))

# Add the normal density as red line to KDE
lines(djx, dnorm(djx, mu, sigma), col = "red")

# Make a Q-Q plot of djx and add a red line
qqnorm(djx)
qqline(djx, col = "red")

# Calculate the length of djx as n
n <- length(djx)

# Generate n standard normal variables, make a Q-Q plot, add a red line
x1 <- rnorm(n)
qqnorm(x1)
qqline(x1, col = "red")

# Generate n Student t variables, make a Q-Q plot, add a red line
x2 <- rt(n, df = 4)
qqnorm(x2)
qqline(x2, col = "red")


# Generate n standard uniform variables, make a Q-Q plot, add red line
x3 <- runif(n)
qqnorm(x3)
qqline(x3, col = "red")

