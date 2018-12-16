require(data.table)

# basic J operations, by reference

# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add column by reference: Total

DT[, Total := sum(B), by = A]

# Add 1 to column B

DT[c(2, 4), B := B + 1L,]

# Add a new column Total2

DT[2:4, Total2 := sum(B), by = A]

# Remove the Total column

DT[, Total := NULL,]

# Select the third column using `[[`

DT[[3]]

# A data.table DT has been created for you
DT <- data.table(A = c(1, 1, 1, 2, 2), B = 1:5)

# Update B, add C and D

DT[, ':='(B = B + 1L, C = A + B, D = 2)]

# Delete my_cols
my_cols <- c("B", "C")

DT[, paste(my_cols) := NULL,]

# Delete column 2 by number
DT[[2]] = NULL
