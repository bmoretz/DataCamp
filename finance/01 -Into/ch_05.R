# List components
name <- "Apple and IBM"
apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
cor_matrix <- cor(cbind(apple, ibm))

# Create a list
portfolio <- list(name, apple, ibm, cor_matrix)

# View your first list
portfolio

# Add names to your portfolio
names(portfolio) <- c("portfolio_name", "apple", "ibm", "correlation")

# Print portfolio
portfolio

# Second and third elements of portfolio
portfolio[2:3]

# Use $ to get the correlation data
portfolio$correlation

# Add weight: 20% Apple, 80% IBM
portfolio$weight <- c(apple = .20, ibm = .80)

# Print portfolio
portfolio

# Change the weight variable: 30% Apple, 70% IBM
portfolio$weight <- c(apple = .30, ibm = .70)

# Print portfolio to see the changes
portfolio

# Take a look at portfolio
portfolio

# Remove the apple stock prices from your portfolio
portfolio$aaple <- NULL

# *********************
# Split-Apply-Combine
# *********************
rm(list = ls())

# Basics - setup

# Data
cash <- data.frame(	company = c("A", "A", "A", "B", "B", "B", "B"),
					cash_flow = c(1000, 4000, 550, 1500, 1100, 750, 6000),
					year = c(1, 3, 4, 1, 2, 4, 5))


cash

# Define grouping from year
grouping <- cash$year

# Split cash on your new grouping
split_cash <- split(cash, grouping)

# Look at your split_cash list
split_cash

# Unsplit split_cash to get the original data back.
original_cash <- unsplit(split_cash, grouping)

# Print original_cash
original_cash

# Basics - double cashflow for one company

# Data Setup
cash <- data.frame(company = c("A", "A", "A", "B", "B", "B", "B"),
					cash_flow = c(1000, 4000, 550, 1500, 1100, 750, 6000),
					year = c(1, 3, 4, 1, 2, 4, 5))

grouping <- cash$company

split_cash <- split(cash, grouping)

# Print split_cash
split_cash

# Print the cash_flow column of B in split_cash
split_cash$B$cash_flow

# Set the cash_flow column of company A in split_cash to 0
split_cash$A$cash_flow <- 0

# Use the grouping to unsplit split_cash
cash_no_A <- unsplit(split_cash, grouping)

# Print cash_no_A
cash_no_A

# *********************
# Attributes
# *********************
rm(list = ls())

# my_matrix and my_factor

my_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
rownames(my_matrix) <- c("Row1", "Row2")
colnames(my_matrix) <- c("Col1", "Col2", "Col3")

my_factor <- factor(c("A", "A", "B"), ordered = T, levels = c("A", "B"))

# attributes of my_matrix
attributes(my_matrix)

# Just the dim attribute of my_matrix
attr(my_matrix, which = "dim")

# attributes of my_factor
attributes(my_factor)