library(data.table)

# https://campus.datacamp.com/courses/computational-finance-and-financial-econometrics-with-r/lab-1-return-calculations?ex=1&open_outline=true

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\computational.finance.r\\data\\"))
data.file.sbux <- paste0(RPROJ$DATA, "sbuxPrices.csv")

# Assign the URL to the CSV file, alternative
data_url <- "http://assets.datacamp.com/course/compfin/sbuxPrices.csv"

# Load the data frame using read.csv
sbux_df <- read.csv(data.file.sbux, header = TRUE, stringsAsFactors = FALSE)

head(sbux_df)

# Check the structure of sbux_df
str( sbux_df )

# Check the first and last part of sbux_df
head(sbux_df)
tail(sbux_df)

# Get the class of the Date column of sbux_df

class(sbux_df$Date)

# The sbux_df data frame is already loaded in your work space
closing_prices <- sbux_df[, "Adj.Close", drop = FALSE]

# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 <- which(sbux_df$Date == "3/1/1994")
index_2 <- which(sbux_df$Date == "3/1/1995")

# Extract prices between 3/1/1994 and 3/1/1995
some_prices <- sbux_df[index_1:index_2, "Adj.Close"]

# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]
rownames(sbux_prices_df) <- sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 <- sbux_prices_df["3/1/1994", 1]
price_2 <- sbux_prices_df["3/1/1995", 1]

plot(sbux_df$Adj.Close, type = "l", col = "blue", lwd = 2, ylab = 'Adjusted close', main = "Monthly closing price of SBUX")

# Denote n the number of time periods
n <- nrow(sbux_prices_df)
sbux_ret <- (sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1];

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# Denote n the number of time periods
n <- nrow(sbux_prices_df)

sbux_ret <- (sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1];

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# Denote n the number of time periods:
n <- nrow(sbux_prices_df)
sbux_ret <- ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1])

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# Now add dates as names to the vector and print the first elements of sbux_ret to the console to check
names(sbux_ret) <- sbux_df[2:n, 1];
head(sbux_ret);

# Denote n the number of time periods:
n <- nrow(sbux_prices_df)
sbux_ret <- ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret <- (log(sbux_prices_df[2:n, 1]) - log(sbux_prices_df[1:(n - 1), 1]));

# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) <- sbux_df[2:n, 1];

# Show sbux_ccret
head(sbux_ccret);

# Denote n the number of time periods:
n <- nrow(sbux_prices_df)
sbux_ret <- ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret <- log(sbux_prices_df[2:n, 1]) - log(sbux_prices_df[1:(n - 1), 1])
names(sbux_ccret) <- sbux_df[2:n, 1]
head(sbux_ccret)

# Compare the simple and cc returns
compared <- cbind(sbux_ret, sbux_ccret);
head(compared);

# Plot the returns on the same graph
plot(sbux_ret, type = "l", col = "blue", lwd = 2, ylab = "Return",
			   main = "Monthly Returns on SBUX")

# Add horizontal line at zero
abline(h = 0)

# Add a legend
legend(x = "bottomright", legend = c("Simple", "CC"),
	   lty = 1, lwd = 2, col = c("blue", "red"))

# Add the continuously compounded returns
lines(sbux_ccret, col = "red", lwd = 2)

# Compute gross returns
sbux_gret <- sbux_ret + 1

# Compute future values
sbux_fv <- cumprod(sbux_gret)

# Plot the evolution of the $1 invested in SBUX as a function of time
plot(sbux_fv, type = "l", col = "blue", lwd = 2, ylab = "Dollars",
	 main = "FV of $1 invested in SBUX")

# Compute gross returns
sbux_gret <- sbux_ret + 1

# Compute future values
sbux_fv <- cumprod(sbux_gret)

# Plot the evolution of the $1 invested in SBUX as a function of time
plot(sbux_fv, type = "l", col = "blue", lwd = 2, ylab = "Dollars",
	 main = "FV of $1 invested in SBUX")


simpleReturn <- function(data) {
	n <- nrow(data)

	( data[2:n, 1] - data[1:(n - 1), 1] ) / data[1:(n - 1), 1];
}

sbux_df$Date <- as.Date(sbux_df$Date, "%m/%d/%Y")

####################################################################################
# Questions
####################################################################################

# data <- as.data.table(subset(sbux_df, Date >= "2004-11-1" & Date <= "2005-12-31"))
data <- as.data.table(sbux_df)

n <- nrow(data)
return.simple <- (data[2:n, Adj.Close] - data[1:(n - 1), Adj.Close]) / data[1:(n - 1), Adj.Close]
return.continuous <- (log(data[2:n, Adj.Close]) - log(data[1:(n - 1), Adj.Close]))
data <- cbind(data, Simple = c(0, return.simple), Continuous = c(0, return.continuous))

data$Cum <- data$Continuous + 1
data$Cum <- cumprod(data$Cum)

# What is the simple monthly return between the end of December 2004 and the end of January 2005 ?

round(data[which(data$Date == "2005-01-03")]$Simple * 100, 2)

# What is the continuously compounded monthly return between December 2004 and January 2005?

round(data[which(data$Date == "2005-01-03")]$Continuous * 100, 2)


# Assume that all twelve months have the same return as the simple monthly return between the end of December 2004 and the end of January 2005. 
# What would be the annual return with monthly compounding in that case ?

ret <- data[which(data$Date == "2005-01-03")]$Simple
ret.annual = (((1 + ret) ^ 12) - 1) * 100

# Simple and CC

period <- data[which(data$Date == "2004-12-01" | data$Date == "2005-12-01")]

# compute the actual simple annual return between December 2004 and December 2005.
(period[2,]$Adj.Close - period[1,]$Adj.Close) / period[1,]$Adj.Close

# with the adjusted closing price data for Starbucks stock over the period December 2004 through December 2005.
log( period[2,]$Adj.Close ) - log( period[1, ]$Adj.Close )