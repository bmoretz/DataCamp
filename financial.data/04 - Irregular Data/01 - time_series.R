# Extract the start date of the series
start_date <- start(irregular_xts)

# Extract the end date of the series
end_date <- end(irregular_xts)

# Create a regular date-time sequence
regular_index <- seq(from = start_date, to = end_date, by = "day")

# Create a zero-width xts object
regular_xts <- xts(, order.by = regular_index)

# Merge irregular_xts and regular_xts
merged_xts <- merge(irregular_xts, regular_xts)

# Look at the first few rows of merged_xts
head(merged_xts)

# Use the fill argument to fill NA with their previous value
merged_filled_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

# Look at the first few rows of merged_filled_xts
head(merged_filled_xts)

# Aggregate DFF to monthly
monthly_fedfunds <- apply.monthly(DFF, mean)

# Convert index to yearmon
index(monthly_fedfunds) <- as.yearmon(index(monthly_fedfunds))

# Merge FEDFUNDS with the monthly aggregate
merged_fedfunds <- merge(FEDFUNDS, monthly_fedfunds)

# Look at the first few rows of the merged object
head(merged_fedfunds)

# Fill NA forward
merged_fedfunds_locf <- na.locf(merged_fedfunds)

# Extract index values containing last day of month
aligned_last_day <- merged_fedfunds_locf[index(monthly_fedfunds)]

# Fill NA backward
merged_fedfunds_locb <- na.locf(merged_fedfunds, fromLast = TRUE)

# Extract index values containing first day of month
aligned_first_day <- merged_fedfunds_locb[index(FEDFUNDS)]