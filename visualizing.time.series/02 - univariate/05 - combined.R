# Draw histogram and add red density line
hist(rtn, probability = TRUE)
lines(density(rtn), col = "red")

# Draw box and whisker plot
boxplot(rtn)

# Draw autocorrelogram
acf(rtn)

# Draw q-q plot and add a red line for normality
qqnorm(rtn)
qqline(rtn, col = "red")


# Set up 2x2 graphical window
par(mfrow = c(2, 2))

# Recreate all four plots
hist(rtn, probability = TRUE)
lines(density(rtn), col = "red")

boxplot(rtn)

acf(rtn)

qqnorm(rtn)
qqline(rtn, col = "red")