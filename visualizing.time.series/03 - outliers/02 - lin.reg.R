# Draw the scatterplot
plot(x = sp500, y = citi)

# Draw a regression line
abline(lm(citi ~ sp500), reg = lm(citi ~ sp500), col = "red", lwd = 2)