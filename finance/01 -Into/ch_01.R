# Addition!
3 + 5

# Subtraction!
6 - 4

# Addition 
2 + 2

# Subtraction
4 - 1

# Multiplication
3 * 4

# Division
4 / 2

# Exponentiation
2^4

# Modulo
7 %% 3

# Assign 200 to savings
savings <- 200

# Print the value of savings to the console
savings

# Assign 100 to my_money
my_money <- 100

# Assign 200 to dans_money
dans_money <- 200

# Add my_money and dans_money
my_money + dans_money

# Add my_money and dans_money again, save the result to our_money
our_money <- my_money + dans_money

# Variables for starting_cash and 5% return during January
starting_cash <- 200
jan_ret <- 5
jan_mult <- 1 + (jan_ret / 100)

# How much money do you have at the end of January?
post_jan_cash <- starting_cash * jan_mult

# Print post_jan_cash
post_jan_cash

# January 10% return multiplier
jan_ret_10 <- 10
jan_mult_10 <- 1 + (jan_ret_10 / 100)

# How much money do you have at the end of January now?
post_jan_cash_10 <- starting_cash * jan_mult_10

# Print post_jan_cash_10
post_jan_cash_10

# Starting cash and returns 
starting_cash <- 200
jan_ret <- 4
feb_ret <- 5

# Multipliers
jan_mult <- 1 + (jan_ret / 100 )
feb_mult <- 1 + (feb_ret / 100 )

# Total cash at the end of the two months
total_cash <- starting_cash * jan_mult * feb_mult

# Print total_cash
total_cash

# Apple's stock price is a numeric
apple_stock <- 150.45

# Bond credit ratings are characters
credit_rating <- "AAA"

# You like the stock market. TRUE or FALSE?
my_answer <- TRUE

# Print my_answer
my_answer

ls()

lapply(ls, function(x) { paste(class(x))})
