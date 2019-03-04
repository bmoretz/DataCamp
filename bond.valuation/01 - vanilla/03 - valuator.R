# Create function
bondprc <- function(p, r, ttm, y) {
  cf <- c(rep(p * r, ttm - 1), p * (1 + r))
  cf <- data.frame(cf)
  cf$t <- as.numeric(rownames(cf))
  cf$pv_factor <- 1 / (1 + y) ^ cf$t
  cf$pv <- cf$cf * cf$pv_factor
  sum(cf$pv)
}

# Verify prior result
bondprc(100, .05, 5, .06)
