library(hflights)
library(data.table)


hflights <- as.data.table(hflights)
hflights[Month == 10, mean(na.omit(AirTime)), by = UniqueCarrier]

dt <- as.data.table(iris)

head(dt)

dt[, .(Count = .N), by = .(Area = 10 * round(Sepal.Width * Sepal.Length / 10))]

set.seed(1L)

DT <- data.table(A = rep(letters[2:1], each = 4L),
				 B = rep(1:4, each = 2L),
				 C = sample(8))

# Create the new data.table, DT2, Given DT, calculate cumulative sum of C in column C while you group by A,B. Store it in a new data.table DT2 with 3 columns: A, B and C.

DT
DT2 <- DT[, .(C = cumsum(C)), by = .(A, B)]

# Select from DT2 the last two values from C while you group by A
DT2[, .(C = tail(C, 2)), by = A]
