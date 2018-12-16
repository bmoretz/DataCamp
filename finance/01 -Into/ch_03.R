# *********************
# data.frame
# *********************

# Variables
company <- c("A", "A", "A", "B", "B", "B", "B")
cash_flow <- c(1000, 4000, 550, 1500, 1100, 750, 6000)
year <- c(1, 3, 4, 1, 2, 4, 5)

# Data frame
cash <-data.frame(company, cash_flow, year)

# Print cash
cash

# Call head() for the first 4 rows
head(cash, 4)

# Call tail() for the last 3 rows
tail(cash,3)

# Call str()
str(cash)

cash

# Fix your column names

colnames(cash) <- c("company", "cash_flow", "year")

# Print out the column names of cash
colnames(cash)

# *********************
# subsetting
# *********************

# Third row, second column
cash[3, 2]

# Fifth row of the "year" column
cash[5, "year"]

# Select the year column
cash[,"year"]

# Select the cash_flow column and multiply by 2
cash[,"cash_flow"] * 2

# Delete the company column
cash$company <- NULL

# Print cash again
cash

# Rows about company B
subset(cash, company == "B")

# Rows with cash flows due in 1 year
subset(cash, year == 1)

cash$half_cash <- cash$cash_flow * .5

# Quarter cash flow scenario
cash$quarter_cash <- cash$half_cash * .5

# Double year scenario
cash$double_year <- cash$year * 2

# *********************
# Present Value
# *********************

# present_value <- cash_flow * (1 + interest / 100) ^ -year

100 * (1.05) ^ -1 # If you expect a cash flow of $100 to be received 1 year from now, the present value of that cash flow at a 5%
# 95.238

# Present value of $4000, in 3 years, at 5%
present_value_4k <- 4000 * ( 1 + 5 / 100 ) ^ -3

# Present value of all cash flows
cash$present_value <- cash$cash_flow * ( 1 + 5 / 100 ) ^  ( -cash$year )

# Print out cash
cash

# Total present value of cash
total_pv <- sum(cash$present_value)

# Company B information
cash_B <- subset(cash, company == "B")

# Total present value of cash_B
total_pv_B <- sum(cash_B$present_value)
