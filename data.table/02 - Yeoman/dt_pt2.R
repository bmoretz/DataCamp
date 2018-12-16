require(data.table)

dt.wd <- file.path("C:", "Projects", "R", "Playground", "Scripts", "DataCamp", "data.table")

setwd(dt.wd)

# load DT

DT <- as.data.table(read.csv("dt.csv", header = TRUE, col.names = c("x", "y", "z")))

# Sum of all columns and the number of rows
DT[, c(lapply(.SD, sum), .N), by = x, .SDcols = c("x", "y", "z")]

# Cumulative sum of column x and y while grouping by x and z > 8

DT[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z > 8), .SDcols = c("x", "y")]