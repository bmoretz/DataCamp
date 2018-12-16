library(data.table)

# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
				 B = c(5, 4, 1, 9, 8, 8, 6),
				 C = 6:12,
				 key = "A,B")

# Get the key of DT

key(DT)

# Row where A == "b" and B == 6
DT[.("b",6)]

# Return the prevailing row
DT[.("b", 6), roll = TRUE]

# Return the nearest row
DT[.("b", 6), roll = "nearest"]