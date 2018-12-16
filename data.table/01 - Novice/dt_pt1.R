library(data.table)

# Create my_first_data_table
# Create a data.table my_first_data_table with a 
# column x = c("a", "b", "c", "d", "e") and a column y = c(1, 2, 3, 4, 5) . Use the function data.table() .

my_first_data_table <- data.table(x = letters[1:5],
								  y = 1:5)

my_first_data_table

# Create a data.table using recycling
# Create a two-column data.table DT that contains the four 
# integers 1, 2, 1 and 2 in the first column a and the letters A, B, C and D in the 
# second column b. Use recycling so that the contents of a will be automatically used twice. 
# Note that LETTERS[1] returns "A", LETTERS[2] returns "B", and so on.

DT <- data.table(a = c(1:2, 1:2), b = LETTERS[1:4])

# Print the third row to the console
DT[3]

# Print the second and third row to the console without using commas
DT[2:3]

# Print the second to last row of DT using .N
DT[.N - 1]

# Print the column names of DT
colnames(DT)

# Print the number or rows and columns of DT
dim(DT)

# Print a new data.table containing rows 2, 2, and 3 of DT
DT[c(2, 2, 3)]

DT <- data.table(A = 1:5, B = letters[1:5], C = 6:10)

DT[, .(Total = sum(A), Average = mean(C))]

DT[, .(B, C = sum(C))]

# plot DT
DT[, plot(A, C)]

DT[, {
	print(A)
	hist(C)
	NULL
}]

# Subset rows 1 and 3, and columns B and C
DT[c(1, 3), .(B, C)]

# Assign to ans the correct value
ans <- DT[, .(B, val = A * C)]

# Fill in the blanks such that ans2 equals target
target <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"),
					 val = as.integer(c(6:10, 1:5)))

ans2 <- DT[, .(B, val = as.integer(c(6:10, 1:5)))]


# Convert iris to a data.table: DT
irisDT <- as.data.table(iris)

# For each Species, print the mean Sepal.Length
irisDT[, mean(Sepal.Length), by = Species]

# Print mean Sepal.Length, grouping by first letter of Species
irisDT[, mean(Sepal.Length), by = substr(Species, 0, 1)]

# data.table version of iris: DT
DT <- as.data.table(iris)

# Group the specimens by Sepal area (to the nearest 10 cm2) and count how many occur in each group
DT[, .N, by = 10 * round((Sepal.Length * Sepal.Width) / 10)]

# Now name the output columns `Area` and `Count`
DT[, .(Count = .N), by = .(Area = 10 * round((Sepal.Length * Sepal.Width) / 10))]


# Create a new data.table DT2 with 3 columns, A, B and C, where C is the cumulative sum of the C column of DT. Call the cumsum() function in the j argument, and group by .(A, B)(i.e. both columns A and B) .
# Select from DT2 the last two values of C using the tail() function, and assign that to column C while
# you group by A alone. Make sure the column names don 't change.

# Create the data.table DT
set.seed(1L)
DT <- data.table(A = rep(letters[2:1], each = 4L),
				 B = rep(1:4, each = 2L),
				 C = sample(8))

# Create the new data.table, DT2
#Create a new data.table DT2 with 3 columns, A, B and C, where C is the 
# cumulative sum of the C column of DT. Call the cumsum() function in the j argument, 
# and group by .(A, B) (i.e. both columns A and B).
DT
DT2 <- DT[, .(C = cumsum(C)), by = .(A, B)]

# Select from DT2 the last two values from C while you group by A

# Select from DT2 the last two values of C using the tail() function, and assign that to column C while
# you group by A alone. Make sure the column names don 't change.

DT2[, .(C = tail(C,2) ), by = A]
