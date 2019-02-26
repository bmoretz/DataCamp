# astsa and xts are preloaded 
library(xts)
library(astsa)

# Plot GNP series (gnp) and its growth rate
par(mfrow = c(2, 1))
plot(gnp)

par(mfrow = c(2, 1))
plot(diff(gnp))

par(mfrow = c(2, 1))
plot(log(gnp))

# Plot DJIA closings (djia$Close) and its returns
par(mfrow = c(2, 1))
plot(djia$Close)

par(mfrow = c(2, 1))
plot(diff(djia$Close))

par(mfrow = c(2, 1))
plot(log(djia$Close))
