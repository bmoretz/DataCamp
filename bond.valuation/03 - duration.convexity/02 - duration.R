# Calculate bond price today
px <- bondprc(p = 100, r = .10, ttm = 20, y = .1)
px

# Calculate bond price if yields increase by 1%
px_up <- bondprc(p = 100, r = .10, ttm = 20, y = .11)
px_up

# Calculate bond price if yields decrease by 1%
px_down <- bondprc(p = 100, r = .10, ttm = 20, y = .09)
px_down

# Calculate approximate duration
duration <- (px_down - px_up) / (2 * px * .01)
duration

# Estimate percentage change
duration_pct_change <- -duration * -0.01
duration_pct_change

# Estimate dollar change
duration_dollar_change <- -duration_pct_change / -.01
duration_dollar_change
