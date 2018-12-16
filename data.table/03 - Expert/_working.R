require(data.table)

DT <- data.table(A = c("c", "b", "a"), B = 1:6)


DT[, A == "a" ]
DT[ A == "a"]

# Convert iris to a data.table

iris <- as.data.table( iris )

# Species is "virginica"

iris[ Species == "virginica"]

# Species is either "virginica" or "versicolor"

iris[Species %in% c("virginica", "versicolor")]

# reset

iris <- as.data.table(iris)

# Remove the "Sepal." prefix

setnames(iris, colnames(iris), gsub("Sepal.", "", colnames(iris), fixed = TRUE))

# Remove the two columns starting with "Petal"

iris[, grep("Petal", colnames(iris)) := NULL ]

# Area is greater than 20 square centimeters

iris[Length * Width > 20]

# Add new boolean column

iris[, is_large := (Length * Width > 25)]

# Now large observations with is_large

iris[is_large == TRUE]

X = data.table(x = c(1, 1, 1, 2, 2, 5, 6), y = 1:7, key = "x")
Y = data.table(x = c(2, 6), z = letters[2:1], key = "x")

X
Y

X[Y] # join

X[Y, .N] # count of total matches, implicit

X[Y, list(Group = .N), by = .EACHI][, list(X = x, Group, total = sum(Group))] # count of group (EACHI) matches, explicit

# .EACHI

set.seed(10238)
DT <- data.table(A = rep(1:3, each = 5), B = rep(1:5, 3),
				 C = sample(15), D = sample(15))
DT

#Sum all columns
DT[, lapply(.SD, sum)]
#     A  B   C   D
# 1: 30 45 120 120

#Sum all columns EXCEPT A, grouping BY A
DT[, lapply(.SD, sum), by = A]
#    A  B  C  D
# 1: 1 15 38 43
# 2: 2 15 30 49
# 3: 3 15 52 28

#Sum all columns EXCEPT A
DT[, lapply(.SD, sum), .SDcols = !"A"]
#     B   C   D
# 1: 45 120 120

#Sum all columns EXCEPT A, grouping BY B
DT[, lapply(.SD, sum), by = B, .SDcols = !"A"]
#    B  C  D
# 1: 1 27 29
# 2: 2 17 30
# 3: 3 33 11
# 4: 4 23 36
# 5: 5 20 14

# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
				 B = c(5, 4, 1, 9, 8, 8, 6),
				 C = 6:12)

setkey(DT, A, B)

# equality join, null
DT[.("b",4)]

# rolling Join, default = first "C" ( = 8 )
DT[.("b", 4), roll = TRUE]

# rolling join, "nearest" match to 4 ( = 6)
DT[.("b", 4), roll = "nearest"]

# rolling join, next closest in sign (no limit)
DT[.("b", 4), roll = -Inf]
DT[.("b", 4), roll = Inf]

# rolling join, with limit ( 3 - 1 ) = no match
DT[.("b",3), roll = -1]

# rolling join, with limit ( 2 - 1 ) = ~C[8]
DT[.("b", 2), roll = 1]

# rolling join, with limit ends
DT[.("b", 7:8), roll = 2, rollends = TRUE]

