require(data.table)

# Set the seed
set.seed(1)

dt.wd <- file.path("C:", "Projects", "R", "Playground", "Scripts", "DataCamp", "data.table")

setwd(dt.wd)

# load DT

DT <- as.data.table(read.csv("dt_2.csv", header = TRUE, check.names = TRUE, stringsAsFactors = FALSE))
DT[, X := NULL,]

# For loop with set
# Loop through columns 2, 3, and 4, and for each one, select 3 rows at random and set the value of that column to NA.

for (i in 2:4)
	set(DT, sample(10, 3), i, NA)

# Change the column names to lowercase
setnames(DT, tolower(colnames(DT)))

# Print the resulting DT to the console
# Print the resulting DT to the console to see what changed.

DT

# Define DT
DT <- data.table(a = letters[c(1, 1, 1, 2, 2)], b = 1)

# Add a suffix "_2" to all column names
setnames(DT, paste0(colnames(DT), "_2"))

# Change column name "a_2" to "A2"
colnames(DT)[1] <- "A2"

# Reverse the order of the columns
setcolorder(DT, rev(colnames(DT)))