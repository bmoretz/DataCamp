# Draw box and whisker plot for the Apple returns
boxplot(rtn)

# Draw a box and whisker plot of a normal distribution
boxplot(rnorm(1000))

# Redraw both plots on the same graphical window
par(mfrow = c(2, 1))
boxplot(rtn, horizontal = TRUE)
boxplot(rnorm(1000), horizontal = TRUE)
