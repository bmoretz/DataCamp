# Draw autocorrelation plot
acf(rtn, main = "Apple return autocorrelation")

# Redraw with a maximum lag of 10
acf(rtn, main = "Apple return autocorrelation", lag.max = 10)