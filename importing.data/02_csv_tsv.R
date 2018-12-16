# Load the readr package
library(readr)
library(data.table)

RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\importing.data\\data\\"))

potatoes.csv <- paste0(RPROJ$DATA, "potatoes.csv")

# Import potatoes.csv with read_csv(): potatoes
potatoes <- read_csv(potatoes.csv)

# readr is already loaded

potatoes.txt <- paste0(RPROJ$DATA, "potatoes.txt")

# Column names
properties <- c("area", "temp", "size", "storage", "method",
				"texture", "flavor", "moistness")

# Import potatoes.txt: potatoes
potatoes <- read_tsv(potatoes.txt, col_names = properties)

# Call head() on potatoes
head(potatoes)

# Import potatoes.txt using read_delim(): potatoes
potatoes <- read_delim(potatoes.txt, delim = "\t", col_names = properties)

# Print out potatoes
potatoes

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv(potatoes.txt,
	skip = 6,
	n_max = 5,
	col_names = properties
)

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv(potatoes.txt, col_types = "cccccccc", col_names = properties)

# Print out structure of potatoes_char
str(potatoes_char)

hotdogs.txt <- paste0(RPROJ$DATA, "hotdogs.txt")

# Import without col_types
hotdogs <- read_tsv(hotdogs.txt, col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv(hotdogs.txt,
	col_names = c("type", "calories", "sodium"),
	col_types = list(fac, int, int)
)

# Display the summary of hotdogs_factor
summary(hotdogs_factor)

# Import potatoes.csv with fread(): potatoes
potatoes <- fread(potatoes.csv)

# Print out potatoes
potatoes

# Import columns 6 and 8 of potatoes.csv: potatoes
potatoes <- fread(potatoes.csv, select = c(6,8))

# Plot texture (x) and moistness (y) of potatoes
plot(potatoes$texture, potatoes$moistness)