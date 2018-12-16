library(data.table)

# cars warm-up

head( mtcars )

mtcarsDT <- as.data.table(mtcars)

mtcarsDT[
	mpg > 20,
	.(AvgHP = mean(hp), 
	"MinWt (kg)" = min(wt * 453.6)), 
	by = .(cyl, under5gears = gear < 5)
]

DF <- data.frame(A = 1:6, B = c("a", "b", "c"), C = rnorm(6), D = TRUE)
DT <- as.data.table(DF)

DT

DT[3:5] # works
DF[3:5] # error (must include comma)

