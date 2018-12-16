# What is the current date?
Sys.Date()

# What is the current date and time?
Sys.time()

# Create the variable today
today <- Sys.Date()

# Confirm the class of today
class(today)

# Create crash
crash <- as.Date("2008-09-29")

# Print crash
print(crash)

# crash as a numeric
print(as.numeric(crash))

# Current time as a numeric
as.numeric(Sys.time())

# Incorrect date format
as.Date("09/29/2008")

# Create a vector of daily character dates
dates <- c("2017-02-05", "2017-02-06", "2017-02-07", "2017-02-08")

# Add names to dates
names(dates) <- c("Sunday", "Monday", "Tuesday", "Wednesday")

# Subset dates to only return the date for Monday
dates["Monday"]

# "08,30,30"
as.Date("08,30,30", format = "%m,%d,%y", origin = "1900-01-01")

# "Aug 30,1930"
as.Date("Aug 30,1930", format = "%b %d,%Y")

# "30aug1930"
as.Date("30aug1930", format = "%d%b%Y")

# char_dates
char_dates <- c("1jan17", "2jan17", "3jan17", "4jan17", "5jan17")

# Create dates using as.Date() and the correct format 
dates <- as.Date(char_dates, format = "%d%b%y")

# Use format() to go from "2017-01-04" -> "Jan 04, 17"
format(dates, format = "%b %d, %y")

# Use format() to go from "2017-01-04" -> "01,04,2017"
format(dates, format = "%m,%d,%Y")

# Dates
dates <- as.Date(c("2017-01-01", "2017-01-02", "2017-01-03"))

# Create the origin
origin <- as.Date("1970-01-01")

# Use as.numeric() on dates
as.numeric(dates)

# Find the difference between dates and origin
dates - origin

# dates
dates <- as.Date(c("2017-01-02", "2017-05-03", "2017-08-04", "2017-10-17"))

# Extract the months
months(dates)

# Extract the quarters
quarters(dates)

# dates2
dates2 <- as.Date(c("2017-01-02", "2017-01-03", "2017-01-04", "2017-01-05"))

# Assign the weekdays() of dates2 as the names()
names(dates2) <- weekdays(dates2)

# Print dates2
print(dates2)
