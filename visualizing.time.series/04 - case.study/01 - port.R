# Plot the portfolio value
plot(data$value, main = "Portfolio Value")

# Plot the portfolio return
plot(data$return, main = "Portfolio Return")

# Plot a histogram of portfolio return 
hist(data$return, probability = TRUE)

# Add a density line
lines(density(data$return), col = "red", lwd = 2)

# Plot the four stocks on the same graphical window
par(mfrow = c(2, 2), mex = .8, cex = .8)
plot(data$GS)
plot(data$KO)
plot(data$DIS)
plot(data$CAT)

# Draw the scatterplot of gs against the portfolio
plot(x = gs, y = portfolio)

# Add a regression line in red
abline(reg = lm(gs ~ portfolio), col = "red", lwd = 2)

# Plot scatterplots and regression lines to a 2x2 window
par(mfrow = c(2, 2))

plot(x = gs, y = portfolio)
abline(reg = lm(gs ~ portfolio), col = "red", lwd = 2)

plot(x = ko, y = portfolio)
abline(reg = lm(ko ~ portfolio), col = "red", lwd = 2)

plot(x = dis, y = portfolio)
abline(reg = lm(dis ~ portfolio), col = "red", lwd = 2)

plot(x = cat, y = portfolio)
abline(reg = lm(cat ~ portfolio), col = "red", lwd = 2)

# Plot new and old portfolio values on same chart
plot(old.vs.new.portfolio$old.portfolio.value)
lines(old.vs.new.portfolio$new.portfolio.value, col = "red")


# Plot density of the new and old portfolio returns on same chart
plot(density(old.vs.new.portfolio$old.portfolio.rtn))

hist(old.vs.new.portfolio$new.portfolio.value, probability = TRUE)
lines(density(old.vs.new.portfolio$new.portfolio.rtn), col = "red")

# Draw value, return, drawdowns of old portfolio
charts.PerformanceSummary(old.vs.new.portfolio$old.portfolio.rtn)

# Draw value, return, drawdowns of new portfolio
charts.PerformanceSummary(old.vs.new.portfolio$new.portfolio.rtn)

# Draw both portfolios on same chart
charts.PerformanceSummary(old.vs.new.portfolio[, c(3, 4)])