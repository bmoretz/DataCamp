library(data.table)

# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
				 B = c(5, 4, 1, 9, 8, 8, 6),
				 C = 6:12)

setkey(DT, A, B)

# Select the "b" group

DT["b",]

# "b" and "c" groups
DT[c("b","c")]

# The first row of the "b" and "c" groups (Select the first row of the "b" and "c" groups using mult.)
DT[c("b","c"), mult = "first"]

# First and last row of the "b" and "c" groups (Use by = .EACHI and .SD to select the first and last row of the "b" and "c" groups.)
DT[c("b","c"), .SD[c(1, .N)], by = A, .SDcols = B:C]

# Copy and extend code for instruction 4: add printout
DT[c("b", "c"), { print(.SD); .SD[c(1, .N)] }, by = A, .SDcols = B:C]