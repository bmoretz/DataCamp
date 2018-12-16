library(xts)
library(zoo)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\time.series\\data\\"))

help(OlsonNames)

# *********************
# XTS Indexes
# *********************

# Get the index class of temps
indexClass(temps)

# Get the timezone of temps
indexTZ(temps)

# Change the format of the time display
indexFormat(temps) <- "%m/%d/%Y"

# View the new format
head(temps)

# *********************
# Dealing with Time Zones
# *********************

# Construct times_xts with tzone set to America/Chicago
times_xts <- xts(1:10, order.by = times, tzone = "America/Chicago")

# Change the time zone of times_xts to Asia/Hong_Kong
tzone(times_xts) <- "Asia/Hong_Kong"

# Extract the current time zone of times_xts
tzone(times_xts)

# *********************
# Periods
# *********************

# Calculate the periodicity of temps
periodicity(temps)

# Calculate the periodicity of edhec
periodicity(edhec)

# Convert edhec to yearly
edhec_yearly <- to.yearly(edhec)

# Calculate the periodicity of edhec_yearly
periodicity(edhec_yearly)

# Count the months
nmonths(edhec)

# Count the quarters
nquarters(edhec)

# Count the years
nyears(edhec)

# Explore underlying units of temps in two commands: .index() and .indexwday()
.index(temps)
.indexwday(temps)

# Create an index of weekend days using which()
index <- which(.indexwday(temps) == 0 | .indexwday(temps) == 6)

# Select the index
temps[index]

# Make z have unique timestamps
z_unique <- make.index.unique(z, eps = 1e-4)

# Remove duplicate times in z
z_dup <- make.index.unique(z, drop = TRUE)

# Round observations in z to the next time
z_round <- align.time(z, n = 60)

