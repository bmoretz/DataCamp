set.seed(3)
wn <- ts(rnorm(36))
autoplot(wn)

ggAcf(wn) + ggtitle("ACF for White Noise")

autoplot(pigs / 1000) +
  xlab("Year") +
  ylab("Thousands") +
  ggtitle("Pigs Slaughtered in Victoria (Thousands)")

ggAcf(pigs) +
  ggtitle("ACF of Pigs Slaughtered")

Box.test(pigs, lag = 24, fitdf = 0, type = "Lj")

