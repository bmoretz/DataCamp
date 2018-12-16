library(xts)
library(zoo)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\time.series\\data\\"))

# *********************
# Basic ( attached data )
# *********************

data(sunspots)

# Convert austres to an xts object called au
au <- as.xts(austres)

# Convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Convert the original austres into a matrix am2
am2 <- as.matrix(austres)

# *********************
# File I/O
# *********************

tmp_file <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1127/datasets/tmp_file.csv"

# Create dat by reading tmp_file

dat <- read.csv(tmp_file)

# Convert dat into xts
xts(dat, order.by = as.Date(rownames(dat), "%m/%d/%Y"))

# Read tmp_file using read.zoo
dat_zoo <- read.zoo(tmp_file, index.column = 0, sep = ",", format = "%m/%d/%Y")

# Convert dat_zoo to xts
dat_xts <- as.xts(dat_zoo)

# Convert sunspots to xts using as.xts(). Save this as sunspots_xts
sunspots_xts <- as.xts(sunspots)

# Get the temporary file name
tmp <- paste(RPROJ$DATA,"sunspots.xts" )

# Write the xts object using zoo to tmp 
write.zoo(sunspots_xts, sep = ",", file = tmp)

# Read the tmp file. FUN = as.yearmon converts strings such as Jan 1749 into a proper time class
sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon)

# Convert sun into xts. Save this as sun_xts
sun_xts <- as.xts(sun)
