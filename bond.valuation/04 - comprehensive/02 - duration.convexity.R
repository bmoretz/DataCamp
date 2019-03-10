# Calculate bond price when yield increases
px_up <- bondprc(p = 100, r = 0.03, ttm = 8, y = aaa_yield + 0.01)

# Calculate bond price when yield decreases
px_down <- bondprc(p = 100, r = 0.03, ttm = 8, y = aaa_yield - 0.01)

# Calculate duration
duration <- (px_down - px_up) / (2 * px * 0.01)

# Calculate percentage effect of duration on price
duration_pct_change <- -duration * 0.01
duration_pct_change

# Calculate dollar effect of duration on price
duration_dollar_change <- duration_pct_change * px
duration_dollar_change

# Calculate convexity measure
convexity <- (px_up + px_down - 2 * px) / (px * (0.01) ^ 2)

# Calculate percentage effect of convexity on price
convexity_pct_change <- 0.5 * convexity * 0.01 ^ 2
convexity_pct_change

# Calculate dollar effect of convexity on price
convexity_dollar_change <- convexity_pct_change * px
convexity_dollar_change

# Estimate price_change
price_change <- duration_dollar_change + convexity_dollar_change
price_change

# Estimate new_price
new_price <- duration_dollar_change + convexity_dollar_change + px
new_price
