# Create q-q plot
qqnorm(rtn, main = "Apple return QQ-plot")

# Add a red line showing normality
qqline(rtn, col = "red")