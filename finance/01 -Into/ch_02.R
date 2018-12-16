# Another numeric vector
ibm_stock <- c(159.82, 160.02, 159.84)

# Another character vector
finance <- c("stocks", "bonds", "investments")

# A logical vector
logic <- c(TRUE, FALSE, TRUE)

a <- c(1L, "I am a character")
class(b)

b <- c(TRUE, "Hello")
class(b)

c <- c(FALSE, 2)
class(c)

# Vectors of 12 months of returns, and month names
ret <- c(5, 2, 3, 7, 8, 3, 5, 9, 1, 4, 6, 3)
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Add names to ret
names(ret) <- months

# Print out ret to see the new names!
ret

# Look at the data
apple_stock <- ret

# Plot the data points
plot(apple_stock)

# Plot the data as a line graph
plot(apple_stock, type = "l")

# *********************
# Weighted average( 1 )
# *********************

# Weights and returns
micr_ret <- 7
sony_ret <- 9
micr_weight <- .2
sony_weight <- .8

# Portfolio return
portf_ret <- micr_ret * micr_weight + sony_ret * sony_weight

# *********************
# Weighted average( 2 )
# *********************

# Weights, returns, and company names
ret <- c(7, 9)
weight <- c(.2, .8)
companies <- c("Microsoft", "Sony")

# Assign company names to your vectors
names(ret) <- companies
names(weight) <- companies

# Multiply the returns and weights together 
ret_X_weight <- ret * weight

# Print ret_X_weight
ret_X_weight

# Sum to get the total portfolio return
portf_ret <- sum(ret_X_weight)

# Print portf_ret
portf_ret

# *********************
# Weighted average( 3 )
# *********************

ret <- c(7, 8, 9)
names(ret) <- c("Microsoft", "Apple", "Sony")

# Print ret

ret

# Assign 1/3 to weight
weight <- 1/3

# Create ret_X_weight
ret_X_weight <- ret * weight

# Calculate your portfolio return
portf_ret <- sum( ret_X_weight )

# Vector of length 3 * Vector of length 2?
ret * c(.2, .6)

# *********************
# Vector subsetting
# *********************

month.names <- c("Jan", "Feb", "Mar",
			  "Apr", "May", "Jun",
			  "Jul", "Aug", "Sep",
			  "Oct", "Nov", "Dec")

ret <- c(5, 2, 3, 7, 8, 3, 5, 9, 1, 4, 6, 3)
names(ret) <- head(month.names, length(ret))

# First 6 months of returns
ret[c(1:6)]

# Just March and May
ret[c("Mar","May")]

# Omit the first month of returns
ret[-1]

# *********************
# Matrix
# *********************

# A vector of 9 numbers
my_vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# 3x3 matrix
my_matrix <- matrix(data = my_vector, nrow = 3, ncol = 3)

# Print my_matrix
my_matrix

# Filling across using byrow = TRUE
matrix(data = c(2, 3, 4, 5), nrow = 2, ncol = 2, byrow = TRUE)

# *********************
# Matrix <- bind vectors
# *********************

apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
micr <- c(59.2, 59.25, 60.22, 59.95, 61.01)

# cbind the vectors together
cbind_stocks <- cbind(apple, ibm, micr)

# Print cbind_stocks
cbind_stocks

# cbind the vectors together
rbind_stocks <- rbind(apple, ibm, micr)

# Print rbind_stocks
rbind_stocks

# *********************
# Cor()relation
# *********************

# Correlation of Apple and IBM
cor(apple, ibm)

stock_matrix <- matrix(data = cbind(apple, micr, ibm), nrow = 3)
stock_matrix

cor(stock_matrix)