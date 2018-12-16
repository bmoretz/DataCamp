library(xts)
library(zoo)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\time.series\\data\\"))

rm(list = ls())

data(edhec, package = "PerformanceAnalytics")

head(edhec["2007-01/2007-03", 1])

head(edhec["200701/03", 1])

# Select all of 2016 from x
x_2016 <- x["2016"]

# Select January 2016 to March 22, 2016
jan_march <- x["2016/2016-03-22"]

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg["T08:00/T10:00"]

# Extract the observations in morn_2010 for January 13th, 2010
morn_2010["2010-01-13"]