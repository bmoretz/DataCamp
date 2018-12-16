# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
				 B = c(5, 4, 1, 9, 8, 8, 6),
				 C = 6:12,
				 key = "A,B")

# Print the sequence (-2):10 for the "b" group
DT[.("b", -2:10)]

# Add code: carry the prevailing values forwards (roll the prevailing values forward to replace the NAs.)
DT[.("b", -2:10), roll = TRUE]

# Add code: carry the first observation backwards
DT[.("b", -2:10), roll = TRUE, rollends = TRUE]