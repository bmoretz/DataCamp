# Simulate 100,000 flips of a coin with a 40% chance of heads
A <- rbinom(100000, 1, .4)

# Simulate 100,000 flips of a coin with a 20% chance of heads
B <- rbinom(100000, 1, .2)

# Estimate the probability both A and B are heads
mean(A & B)

# You've already simulated 100,000 flips of coins A and B
A <- rbinom(100000, 1, .4)
B <- rbinom(100000, 1, .2)

# Simulate 100,000 flips of coin C (70% chance of heads)
C <- rbinom(100000, 1, .7)

# Estimate the probability A, B, and C are all heads
mean(A & B & C)

# Simulate 100,000 flips of a coin with a 60% chance of heads
A <- rbinom( 100000, 1, .6 )

# Simulate 100,000 flips of a coin with a 10% chance of heads
B <- rbinom(100000, 1, .1)

# Estimate the probability either A or B is heads
mean(A | B)

# Use rbinom to simulate 100,000 draws from each of X and Y
X <- rbinom(100000, 10, .6)
Y <- rbinom(100000, 10, .7)

# Estimate the probability either X or Y is <= to 4
mean(X <= 4 | Y <= 4)

# Use pbinom to calculate the probabilities separately
prob_X_less <- pbinom(4, 10, .6)
prob_Y_less <- pbinom(4, 10, .7)

# Combine these to calculate the exact probability either <= 4
prob_X_less + prob_Y_less - prob_X_less * prob_Y_less

# If X is a binomial with size 50 and p = .4, 
# what is the expected value of 3 * X ?

mean <- 50 * .4
mean * 3 # ans

# Simulate 100,000 draws of a binomial with size 20 and p = .1
X <- rbinom(100000, 20, .1)

# Estimate the expected value of X
mean(X)

# Estimate the expected value of 5 * X
mean(X * 5)

# X is simulated from 100,000 draws of a binomial with size 20 and p = .1
X <- rbinom(100000, 20, .1)

# Estimate the variance of X
var(X)

# Estimate the variance of 5 * X
(var(X * 5))

# In the last multiple choice exercise, you found the expected value of the sum of two binomials. 
# In this problem you 'll use a simulation to confirm your answer.

# Simulate 100,000 draws of X (size 20, p = .3) and Y (size 40, p = .1)
X <- rbinom(100000, 20, .3)
Y <- rbinom(100000, 40, .1)

# Estimate the expected value of X + Y
mean(X) + mean(Y)

# Simulation from last exercise of 100,000 draws from X and Y
X <- rbinom(100000, 20, .3)
Y <- rbinom(100000, 40, .1)

# Find the variance of X + Y
var(X + Y)

# Find the variance of 3 * X + Y
var(3 * X + Y)

