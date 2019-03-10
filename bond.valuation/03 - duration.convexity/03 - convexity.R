# Calculate approximate convexity
convexity <- (px_up + px_down - 2 * px) / (px * (.01) ^ 2)
convexity

# Estimate percentage change
convexity_pct_change <- 0.5 * convexity * (0.01) ^ 2
convexity_pct_change

# Estimate dollar change
convexity_dollar_change <- convexity_pct_change * px
convexity_dollar_change

# Estimate change in price
price_change <- duration_dollar_change + convexity_dollar_change

# Estimate price
price <- duration_dollar_change + convexity_dollar_change + px
