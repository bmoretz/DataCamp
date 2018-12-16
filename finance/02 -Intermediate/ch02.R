# Stock prices
apple <- 48.99
micr <- 77.93

# Apple vs Microsoft
apple > micr

# Not equals
apple != micr

# Dates - today and tomorrow
today <- as.Date(Sys.Date())
tomorrow <- as.Date(Sys.Date() + 1)

# Today vs Tomorrow
tomorrow < today

date <- as.Date(c("2017-01-20", "2017-01-23", "2017-01-24", "2017-01-25"))
ibm <- c(171.55, 171.03, 175.90, 178.29)
panera <- c(216.65,216.06,213.55,212.22)
stocks <- data.frame(date,ibm,panera)

# Print stocks
print(stocks)

# IBM range
stocks$ibm_buy <- stocks$ibm < 175

# Panera range
stocks$panera_sell <- stocks$panera > 213

# IBM vs Panera
stocks$ibm_vs_panera <- stocks$ibm > stocks$panera

# Print stocks
stocks

# IBM buy range
stocks$ibm_buy_range <- (stocks$ibm > 171 & stocks$ibm < 176)

# Panera spikes
stocks$panera_spike <- (stocks$panera > 216.50 | stocks$panera < 213.20)

# Date range
stocks$good_dates <- stocks$date > as.Date("2017-01-21") & stocks$date < as.Date("2017-01-25")

# Print stocks
stocks

# IBM range
!(stocks$ibm > 176)

# Missing data
missing <- c(24.5, 25.7, NA, 28, 28.6, NA)

# Is missing?
is.na(missing)

# Not missing?
!is.na(missing)

# Panera range
subset(stocks, panera > 216)

# Specific date
subset(stocks, date == as.Date("2017-01-23"))

# IBM and Panera joint range
subset(stocks, ibm < 175 & panera < 216.50)

# View stocks
stocks

# Weekday investigation
stocks$weekday <- weekdays(stocks$date)

# View stocks again
stocks

# Remove missing data
stocks_no_NA <- subset(stocks, !is.na(apple))

# Apple and Microsoft joint range
subset(stocks_no_NA, apple > 117 | micr > 63)

# micr
micr <- 48.55

# Fill in the blanks
if (micr < 55 ) {
	print("buy")
}

# micr
micr <- 57.44

# Fill in the blanks
if (micr < 55) {
	print("Buy!")
} else {
	print("Do nothing!")
}

# micr
micr <- 105.67

# Fill in the blanks
if (micr < 55) {
	print("Buy!")
} else if (micr >= 55 & micr < 75) {
	print("Do nothing!")
} else {
	print("Sell!")
}

# micr
micr <- 105.67
shares <- 1

# Fill in the blanks
if (micr < 55) {
	print("Buy!")
} else if (micr >= 55 & micr < 75) {
	print("Do nothing!")
} else {
	if (shares >= 1) {
		print("Sell!")
	} else {
		print("Not enough shares to sell!")
	}
}

# Microsoft test
stocks$micr_buy <- ifelse(test = stocks$micr > 60 & stocks$micr < 62, yes = 1, no = 0)

# Apple test
stocks$apple_date <- ifelse(test = stocks$apple > 117, yes = stocks$date, no = NA)

# Print stocks
print(stocks)

# Change the class() of apple_date.
class(stocks$apple_date) <- "Date"

# Print stocks again
print(stocks)