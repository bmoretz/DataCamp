library(utils)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\importing.data\\data\\"))

swimming_pools.csv <- file.path(paste0(RPROJ$DATA, "swimming_pools.csv"))

## CSV

# Import swimming_pools.csv: pools
pools <- read.csv(file = swimming_pools.csv)

# Print the structure of pools
str(pools)

# Import swimming_pools.csv correctly: pools
pools <- read.csv(file = swimming_pools.csv, stringsAsFactors = FALSE)

# Check the structure of pools
str(pools)

hotdogs.txt <- file.path(paste0(RPROJ$DATA, "hotdogs.txt"))

## TXT / DELM

# Import hotdogs.txt: hotdogs
hotdogs <- read.delim( file = hotdogs.txt, header = FALSE)

# Summarize hotdogs
summary(hotdogs)

# Path to the hotdogs.txt file: path
path <- file.path(RPROJ$DATA, "hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path,
					  sep = "",
					  col.names = c("type", "calories", "sodium"))

# Call head() on hotdogs
head(hotdogs)

# Finish the read.delim() call
hotdogs <- read.delim(hotdogs.txt, header = FALSE,
	col.names = c("type", "calories", "sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories),]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium),]

# Print lily and tom
lily
tom

# Display structure of hotdogs

str(hotdogs)

# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim(hotdogs.txt, header = FALSE,
					   col.names = c("type", "calories", "sodium"),
					   colClasses = c("factor", "NULL", "numeric"))


# Display structure of hotdogs2
str(hotdogs2)